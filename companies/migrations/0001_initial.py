# Generated by Django 5.0.4 on 2024-05-08 21:14

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('industry', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('website_url', models.CharField(max_length=255)),
            ],
        ),
    ]
