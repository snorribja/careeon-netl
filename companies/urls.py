from django.urls import path
from . import views


urlpatterns = [
    path('', views.list_companies, name='list_companies'),
    path('create/', views.signup_company, name='signup_company'),
    path('<int:id>/', views.show_company_detail, name='show_company_detail'),
    path('<int:id>/jobs/', views.show_company_job_offers, name='show_company_job_offers'),
    path('<int:company_id>/jobs/<int:job_id>/', views.show_company_job_applications, name='show_company_job_applications'),
    path('<int:id>/edit/', views.edit_company_detail, name='edit_company_detail'),
    path('<int:id>/post_job/', views.post_job, name='post_job'),
    path('<int:company_id>/jobs/<int:job_id>/edit/', views.edit_job_offer, name='edit_job_offer'),
    path('<int:company_id>/jobs/<int:job_id>/users/<int:user_id>/', views.show_applicant, name='show_applicant'),
]
