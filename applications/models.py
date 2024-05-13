from django.db import models
from django.conf import settings
from jobs.models import JobOffer


class Application(models.Model):
    applicant = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    job_offer = models.ForeignKey(JobOffer, on_delete=models.CASCADE)
    status = models.CharField(max_length=100, null=True)
    timestamp = models.DateTimeField(auto_now_add=True)

