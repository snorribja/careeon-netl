
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views
from .forms import EmailAuthenticationForm


urlpatterns = [
    path('<int:id>', views.show_user_profile, name='show_user_profile'),
    path('<int:id>/applications/', views.show_user_applications, name='show_user_applications'),

    path('signup/', views.signup, name='signup'),
    path('login/', auth_views.LoginView.as_view(authentication_form=EmailAuthenticationForm), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='home_index'), name='logout'),
]



