from django.db import models

# Create your models here.

class Sample(models.Model):
    attatchment = models.FileField()
    name = models.CharField(max_length=30, blank=True, null=True)