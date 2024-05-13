from django.urls import path
from . import views



urlpatterns = [
    path('', views.list_jobs, name='list_jobs'),
    path('<int:id>/', views.show_job_details, name='show_job_details'),
    path('<int:id>/apply/', views.apply_for_job, name='apply_for_job'),
    path('<int:id>/applications/', views.show_job_applications, name='show_job_applications'),
    path('jobs/submit-application/', views.submit_application, name='submit-application'),
]
