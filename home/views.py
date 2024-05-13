from django.shortcuts import render
from django.http import HttpRequest, HttpResponse
from companies.models import Company
from jobs.models import JobOfferSearch



def index(request: HttpRequest) -> HttpResponse:
    premium_employers = Company.objects.filter(is_premium=True)
    trending_job_offers = JobOfferSearch.objects.all().order_by('-lookup_count')[:6]
    context = {'premium_employers': premium_employers, 'trending_job_offers': trending_job_offers}
    return render(request, 'home/index.html', context)


def show_home_employer(request: HttpRequest) -> HttpResponse:
    return render(request, 'home/employer.html')
