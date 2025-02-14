from django import forms
from .models import Event, Victory

class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ['title', 'description', 'tags', 'progress', 'date']

class VictoryForm(forms.ModelForm):
    class Meta:
        model = Victory
        fields = ['date', 'state']