from django.forms import ModelForm, widgets
from .models import Company


class CompanyForm(ModelForm):
    class Meta:
        model = Company
        fields = ['name', 'industry', 'description', 'website_url', 'logo', 'cover_image', 'is_premium']