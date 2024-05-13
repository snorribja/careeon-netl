from django.shortcuts import render, get_object_or_404, redirect
from companies.models import Company
from jobs.models import JobOffer
from .models import Company
from django.http import HttpRequest, HttpResponse
from applications.models import Application
from django.contrib.auth.decorators import login_required
from users.models import CustomUser
from .forms import CompanyForm

def list_companies(request: HttpRequest) -> HttpResponse:
    context = {'companies': Company.objects.all().order_by('name')}
    return render(request, 'companies/index.html', context)


def show_company_detail(request: HttpRequest, id: int) -> HttpResponse:
    company = get_object_or_404(Company, pk=id)
    job_offers = JobOffer.objects.all().filter(company=company)
    context = {'company': company, 'job_offers': job_offers}
    return render(request, 'companies/details.html', context)


@login_required
def signup_company(request: HttpRequest) -> HttpResponse:
    if request.method == 'POST':
        company_name = request.POST.get('name', '')
        company_industry = request.POST.get('industry', '')
        company_description = request.POST.get('description', '')

        company = Company.objects.create(
            name=company_name,
            industry=company_industry,
            description=company_description,
        )
        
        user = request.user
        user.primary_company = company
        user.save()

        return redirect('show_company_job_offers', id=company.pk)

    return render(request, 'companies/signup.html')


@login_required
def show_company_job_offers(request: HttpRequest, id: int) -> HttpResponse:
    company = get_object_or_404(Company, pk=id)
    job_offers = JobOffer.objects.all().filter(company=company)
    context = {'company': company, 'job_offers': job_offers}
    return render(request, 'companies/jobs.html', context)


@login_required
def show_company_job_applications(request: HttpRequest, company_id: int, job_id: int) -> HttpResponse:
    company = get_object_or_404(Company, pk=company_id)
    job_offer = get_object_or_404(JobOffer, pk=job_id)
    applications = Application.objects.all().filter(job_offer=job_offer).select_related('applicant')
    context = {'applications': applications}
    return render(request, 'companies/job_applications.html', context)



@login_required
def edit_company_detail(request: HttpRequest, id: int) -> HttpResponse:
    company = get_object_or_404(Company, pk=id)
    if request.method == 'POST':
        form = CompanyForm(request.POST, request.FILES, instance=company)
        if form.is_valid():
            form.save()
            return redirect('show_company_detail', id=id)
    else:
        form = CompanyForm(instance=company)
    return render(request, 'companies/edit_details.html', {'form': form})


def post_job(request: HttpRequest, id: int) -> HttpResponse:

    company = get_object_or_404(Company, pk=id)

    if request.method == 'POST':
        title = request.POST.get('title', '')
        position = request.POST.get('position', '')
        description = request.POST.get('description', '')
        address = request.POST.get('address', '')
        salary = request.POST.get('salary', 0)

        if title and position and description and address and salary:
            JobOffer.objects.create(
                title=title,
                position=position,
                description=description,
                address=address,
                salary=salary,
                company=company
            )
            return redirect('post_job', id=company.pk)

    context = {'company': company}
    return render(request, 'companies/post_job.html', context)


def edit_job_offer(request: HttpRequest, company_id: int, job_id: int) -> HttpResponse:
    job_offer = get_object_or_404(JobOffer, pk=job_id)
    company = get_object_or_404(Company, pk=company_id)

    if request.method == 'POST':
        job_offer.title = request.POST.get('title', job_offer.title)
        job_offer.position = request.POST.get('position', job_offer.position)
        job_offer.description = request.POST.get('description', job_offer.description)
        job_offer.address = request.POST.get('address', job_offer.address)
        job_offer.salary = request.POST.get('salary', job_offer.salary)

        job_offer.save()

        return redirect('show_company_job_offers', id=job_id)

    context = {
        'job_offer': job_offer
    }
    return render(request, 'jobs/edit_details.html', context)


def show_applicant(request: HttpRequest, company_id: int, job_id: int, user_id: int) -> HttpResponse:
    company = get_object_or_404(Company, pk=company_id)
    job_offer = get_object_or_404(JobOffer, pk=job_id, company=company)
    user = get_object_or_404(CustomUser, pk=user_id)
    application = Application.objects.filter(job_offer=job_offer, applicant=user).first()

    if request.method == 'POST':
        status = request.POST.get('status')
        if status in ['hired', 'interview', 'declined'] and application:
            application.status = status
            application.save()
            return redirect('show_applicant', company_id=company_id, job_id=job_id, user_id=user_id)

    context = {
        'company': company,
        'job_offer': job_offer,
        'applicant': user,
        'application': application,
    }

    return render(request, 'users/applicant_details.html', context)


