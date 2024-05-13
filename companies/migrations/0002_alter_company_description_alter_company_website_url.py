# Generated by Django 5.0.4 on 2024-05-10 14:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='company',
            name='description',
            field=models.TextField(blank=True, max_length=1024, null=True),
        ),
        migrations.AlterField(
            model_name='company',
            name='website_url',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
