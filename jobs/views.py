from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator
from django.http import JsonResponse, HttpRequest, HttpResponse
from jobs.models import JobOffer
from applications.models import Application
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from datetime import timedelta




def list_jobs(request):
    keyword = request.GET.get('keyword', '').strip()
    location = request.GET.get('location', '').strip()
    salary_range = request.GET.get('salary_range', '').strip()
    job_type = request.GET.get('job_type', '').strip()
    education_required = request.GET.get('education_required', '').strip()
    date_posted = request.GET.get('date_posted', '').strip()
    is_remote = request.GET.get('is_remote', '')
    sort_by = request.GET.get('sort_by', '')

    job_offer_list = JobOffer.objects.filter(start_date__lte=timezone.now())

    if keyword:
        job_offer_list = job_offer_list.filter(Q(title__icontains=keyword) | Q(company__name__icontains=keyword))
    if location:
        job_offer_list = job_offer_list.filter(address__icontains=location)
    if salary_range:
        salary_min, salary_max = salary_range.split('-')
        if salary_min:
            job_offer_list = job_offer_list.filter(salary__gte=int(salary_min))
        if salary_max:
            job_offer_list = job_offer_list.filter(salary__lte=int(salary_max))
    if job_type:
        job_offer_list = job_offer_list.filter(job_type__iexact=job_type)
    if education_required:
        job_offer_list = job_offer_list.filter(education_required__iexact=education_required)
    if is_remote:
        job_offer_list = job_offer_list.filter(is_remote__iexact=is_remote)
    if date_posted:
        days = int(date_posted)
        date_threshold = timezone.now() - timedelta(days=days)
        job_offer_list = job_offer_list.filter(start_date__gte=date_threshold)

    if sort_by:
        if sort_by == 'due_date':
            job_offer_list = job_offer_list.order_by('due_date')
        elif sort_by == 'date_posted':
            job_offer_list = job_offer_list.order_by('-start_date')

    paginator = Paginator(job_offer_list, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'jobs/index.html', {'page_obj': page_obj})




def show_job_details(request: HttpRequest, id: int) -> JsonResponse:
    job_offer = get_object_or_404(JobOffer, pk=id)

    has_applied = False
    if request.user.is_authenticated:
        has_applied = Application.objects.filter(job_offer=job_offer, applicant=request.user).exists()

    return JsonResponse({
        'id': job_offer.pk,
        'title': job_offer.title,
        'company': str(job_offer.company),
        'description': job_offer.description,
        'salary': job_offer.salary,
        'address': job_offer.address,
        'start_date': job_offer.start_date.strftime('%d-%m-%Y') if job_offer.start_date else None,
        'due_date': job_offer.due_date.strftime('%d-%m-%Y') if job_offer.due_date else None,
        'has_applied': has_applied
    })


@login_required
def apply_for_job(request: HttpRequest, id: int) -> HttpResponse:
    job_offer = get_object_or_404(JobOffer, pk=id)
    
    if request.method == 'POST':
        user = request.user
        has_applied = Application.objects.filter(job_offer=job_offer, applicant=user).exists()
        if not has_applied:
            Application.objects.create(job_offer=job_offer, applicant=user, status='pending')
        return redirect('list_jobs')
    context = {'job_offer': job_offer}
    return render(request, 'applications/apply.html', context)



@login_required
def show_job_applications(request: HttpRequest, id: int) -> HttpResponse:
    job_offer = get_object_or_404(JobOffer, pk=id)
    applications = Application.objects.filter(job_offer=job_offer)

    context = {
        'job_offer': job_offer,
        'applications': applications,
    }
    return render(request, 'jobs/applications.html', context)



@csrf_exempt
def submit_application(request):
    if request.method == 'POST':
        # Example: Process the CV and cover letter files
        cv = request.FILES.get('cv')
        cover_letter = request.FILES.get('coverLetter')
        if cv and cover_letter:
            fs = FileSystemStorage()
            cv_name = fs.save(cv.name, cv)
            cover_letter_name = fs.save(cover_letter.name, cover_letter)
            # Here, you might link these files with an application model or send an email
            return JsonResponse({'status': 'success', 'cv_url': fs.url(cv_name), 'cover_letter_url': fs.url(cover_letter_name)})
        return JsonResponse({'status': 'error', 'message': 'Files are missing.'}, status=400)
    return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)


