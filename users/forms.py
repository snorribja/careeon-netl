from django.contrib.auth.forms import AuthenticationForm
from django import forms




class EmailAuthenticationForm(AuthenticationForm):
    username = forms.EmailField(label="Email", widget=forms.EmailInput(attrs={'autofocus': True}))




