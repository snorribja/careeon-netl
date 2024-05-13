from django.shortcuts import render, redirect
from applications.models import Application
from django.http import HttpRequest, HttpResponse
from django.contrib.auth.decorators import login_required
from users.models import CustomUser
from django.conf import settings

@login_required
def show_user_profile(request: HttpRequest, id: int) -> HttpResponse:
    user = request.user
    context = {'user': user}
    return render(request, 'users/index.html', context)


@login_required
def show_user_applications(request: HttpRequest, id: int) -> HttpResponse:
    user = request.user

    applications = Application.objects.filter(applicant=user).select_related('job_offer')

    context = {'applications': applications}
    return render(request, 'users/applications.html', context)



def signup(request: HttpRequest) -> HttpResponse:
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        password = request.POST.get('password')

        CustomUser.objects.create_user(
            name=name,
            email=email,
            password=password,
        )
        
        return redirect('login')
    
    return render(request, 'registration/signup.html')

