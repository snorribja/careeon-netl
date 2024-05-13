
from django.urls import path, include
from . import views


urlpatterns = [
    path('', views.index, name='home_index'),
    path('home/employer/', views.show_home_employer, name='home_employer'),
]

