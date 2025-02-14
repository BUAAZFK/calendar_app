from django.db import models

# Create your models here.

class Event(models.Model):
    PROGRESS_CHOICES = [
        ('not-started', '未开始'),
        ('in-progress', '进行中'),
        ('completed', '完成'),
    ]

    title = models.CharField(max_length=200)
    description = models.TextField()
    tags = models.CharField(max_length=100, blank=True, null=True)
    progress = models.CharField(max_length=20, choices=PROGRESS_CHOICES, default='not-started')
    date = models.DateField()

    def __str__(self):
        return self.title
    
class Victory(models.Model):
    date = models.DateField(primary_key=True)
    state = models.BooleanField()