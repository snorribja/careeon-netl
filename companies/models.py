from django.db import models
from django.utils import timezone


class Company(models.Model):
    name = models.CharField(max_length=255)
    industry = models.CharField(max_length=255)
    description = models.TextField(max_length=1024, blank=True, null=True)
    logo = models.ImageField(upload_to='logos/', blank=True, null=True)
    cover_image = models.ImageField(upload_to='covers/', blank=True, null=True)
    is_premium = models.BooleanField(default=False)
    website_url = models.CharField(max_length=255, blank=True, null=True)


    @property
    def total_active_job_offers(self):
        current_time = timezone.now()
        return self.job_offers.filter(
            start_date__lte=current_time,
            due_date__gte=current_time
        ).count()

    @property
    def brief_description(self):
        if len(self.description) > 200:

            brief_description = self.description[:200]
            last_space = brief_description.rfind(' ')

            if last_space == -1:
                return brief_description + '...'

            return self.description[:last_space] + '...'
        return self.description


    def __str__(self):
        return self.name

