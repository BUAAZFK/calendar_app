from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Event, Victory
from django.core import serializers
import json

def calendar_view(request):
    events = Event.objects.all().values('id', 'title', 'description', 'tags', 'progress', 'date')
    events = list(events)
    for event in events:
        event['date'] = event['date'].strftime('%Y-%m-%d')
    events = json.dumps(events)
    # print(events)
    # return render(request, '/templates/calendar.html', {'events': events})
    # events = serializers.serialize('json', events)
    victory = Victory.objects.all().values('date', 'state')
    victory = list(victory)
    for item in victory:
        item['date'] = item['date'].strftime('%Y-%m-%d')
    victory = json.dumps(victory)
    return render(request, 'calendar.html', {'events': events, 'victory': victory})

def event_list(request):
    events = Event.objects.all()
    data = serializers.serialize('json', events)
    return JsonResponse(data, safe=False)

@csrf_exempt
def save_event(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        event_id = data.get('id')
        if event_id:
            event = get_object_or_404(Event, id=event_id)
            event.title = data.get('title')
            event.description = data.get('description')
            event.tags = data.get('tags')
            event.progress = data.get('progress')
            event.date = data.get('date')
            event.save()
        else:
            Event.objects.create(
                title=data.get('title'),
                description=data.get('description'),
                tags=data.get('tags'),
                progress=data.get('progress'),
                date=data.get('date')
            )
        return JsonResponse({'status': 'success'})
    return JsonResponse({'status': 'error'}, status=400)

@csrf_exempt
def delete_event(request, event_id):
    if request.method == 'POST':
        event = get_object_or_404(Event, id=event_id)
        event.delete()
        return JsonResponse({'status': 'success'})
    return JsonResponse({'status': 'error'}, status=400)

@csrf_exempt
def save_state(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        victory_date = data.get('date')
        if victory_date:
            event = get_object_or_404(Victory, date=victory_date)
            event.state = data.get('state')
            event.save()
        else:
            Victory.objects.create(
                date=data.get('date'),
                state=data.get('state')
            )
        return JsonResponse({'status': 'success'})
    print('123')
    return JsonResponse({'status': 'error'}, status=400)