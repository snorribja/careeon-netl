# Generated by Django 5.0.4 on 2024-05-13 03:55

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0008_remove_company_cover_img_url_remove_company_logo_url_and_more'),
        ('jobs', '0003_joboffer_education_required_joboffer_job_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='joboffer',
            name='company',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='job_offers', to='companies.company'),
        ),
    ]
