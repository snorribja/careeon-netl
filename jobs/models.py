from django.db import models
from django.utils import timezone
from companies.models import Company
from django.db.models import Q


class JobOffer(models.Model):
    REMOTE_CHOICES = [
        ('remote', 'Remote'),
        ('hybrid', 'Hybrid'),
        ('on-site', 'On-site'),
    ]

    JOB_TYPE_CHOICES = [
        ('full-time', 'Full-time'),
        ('part-time', 'Part-time'),
        ('internship', 'Internship'),
        ('seasonal', 'Seasonal'),
    ]

    EDUCATION_CHOICES = [
        ('no-education', 'No-Education'),
        ('high-school-degree', 'High School Degree'),
        ('associate-degree', 'Associate Degree'),
        ('bachelors', 'Bachelors'),
        ('masters', 'Masters'),
        ('doctoral', 'Doctoral'),
    ]

    title = models.CharField(max_length=255)
    position = models.CharField(max_length=255)
    description = models.TextField()
    address = models.CharField(max_length=255)
    salary = models.DecimalField(max_digits=10, decimal_places=2)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='job_offers')
    start_date = models.DateTimeField(auto_now_add=True)
    due_date = models.DateTimeField(blank=True, null=True)
    is_remote = models.CharField(max_length=10, choices=REMOTE_CHOICES, default='on-site')
    job_type = models.CharField(max_length=10, choices=JOB_TYPE_CHOICES, default='full-time')
    education_required = models.CharField(max_length=50, choices=EDUCATION_CHOICES, default='no-education')


    @property
    def is_active(self):
        now = timezone.now()
        if self.due_date:
            return self.start_date <= now <= self.due_date
        return self.start_date <= now


    def __str__(self):
        return self.title



class JobOfferSearch(models.Model):
    keywords = models.CharField(max_length=50, unique=True)
    lookup_count = models.IntegerField(default=1)


    @property
    def job_offer_count(self):
        job_offer_list = JobOffer.objects.filter(start_date__lte=timezone.now())
        return job_offer_list.filter(Q(title__icontains=self.keywords) | Q(company__name__icontains=self.keywords)).count()



