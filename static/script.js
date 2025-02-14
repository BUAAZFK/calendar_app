document.addEventListener('DOMContentLoaded', function () {
    const calendarEl = document.getElementById('calendar');
    const currentMonthEl = document.getElementById('current-month');
    const prevMonthBtn = document.getElementById('prev-month');
    const nextMonthBtn = document.getElementById('next-month');
    const searchInput = document.getElementById('search-input');
    const searchYear = document.getElementById('search-year');
    const searchMonth = document.getElementById('search-month');
    const searchButton = document.getElementById('search-button');
    const modal = document.getElementById('event-modal');
    const closeModal = document.querySelector('.close');
    const eventForm = document.getElementById('event-form');
    const eventId = document.getElementById('event-id');
    const eventTitle = document.getElementById('event-title');
    const eventDescription = document.getElementById('event-description');
    const eventTags = document.getElementById('event-tags');
    const eventProgress = document.getElementById('event-progress');
    const eventDate = document.getElementById('event-date');
    const saveEventBtn = document.getElementById('save-event');
    const deleteEventBtn = document.getElementById('delete-event');

    let currentDate = new Date();
    console.log(eventData);
    let events = [];
    let currentEvent = null;
    console.log(events)

    function renderCalendar(date) {
        calendarEl.innerHTML = '';
        const year = date.getFullYear();
        const month = date.getMonth();
        currentMonthEl.textContent = `${year}年 ${month + 1}月`;

        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        const daysInMonth = lastDay.getDate();
        const startDay = firstDay.getDay();

        for (let i = 0; i < startDay; i++) {
            const emptyDay = document.createElement('div');
            emptyDay.classList.add('day');
            calendarEl.appendChild(emptyDay);
        }

        for (let i = 1; i <= daysInMonth; i++) {
            const day = document.createElement('div');
            day.classList.add('day');
            day.innerHTML = `<div class="date">${i}</div>`;
            // add events in current day
            const dayEvents = events.filter(event => {
                const eventDate = new Date(event.date);
                return eventDate.getFullYear() === year && eventDate.getMonth() === month && eventDate.getDate() === i;
            });
            dayEvents.forEach(event => {
                const eventEl = document.createElement('div');
                eventEl.classList.add('event', event.progress);
                eventEl.textContent = event.title;
                eventEl.addEventListener('click', () => openModal(event));
                day.appendChild(eventEl);
            });
            day.addEventListener('click', () => openModal(null, year, month, i));
            calendarEl.appendChild(day);
        }
    }

    function openModal(event, year, month, day) {
        if (event) {
            eventId.value = event.id;
            eventTitle.value = event.title;
            eventDescription.value = event.description;
            eventTags.value = event.tags;
            eventProgress.value = event.progress;
            eventDate.value = event.date;
            deleteEventBtn.style.display = 'inline-block';
            document.getElementById('modal-title').textContent = '编辑事项';
        } else {
            eventId.value = '';
            eventTitle.value = '';
            eventDescription.value = '';
            eventTags.value = '';
            eventProgress.value = 'not-started';
            eventDate.value = `${year}-${String(month + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
            deleteEventBtn.style.display = 'none';
            document.getElementById('modal-title').textContent = '添加事项';
        }
        modal.style.display = 'block';
    }

    function saveEvent(event) {
        const formData = new FormData(eventForm);
        const eventData = {
            id: formData.get('event-id'),
            title: formData.get('title'),
            description: formData.get('description'),
            tags: formData.get('tags'),
            progress: formData.get('progress'),
            date: formData.get('date')
        };
        fetch('/event/save/', {
            method: 'POST',
            headers: {
                'X-CSRFToken': formData.get('csrfmiddlewaretoken'),
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(eventData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                renderCalendar(currentDate);
                closeModal.click();
            }
        });
    }

    function deleteEvent() {
        if (currentEvent) {
            fetch(`/event/delete/${currentEvent.id}/`, {
                method: 'POST',
                headers: {
                    'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    renderCalendar(currentDate);
                    closeModal.click();
                }
            });
        }
    }

    function searchEvents() {
        const query = searchInput.value.toLowerCase();
        const year = parseInt(searchYear.value);
        const month = parseInt(searchMonth.value) - 1;

        const filteredEvents = events.filter(event => {
            const eventDate = new Date(event.date);
            return (event.title.toLowerCase().includes(query) || event.description.toLowerCase().includes(query) || event.tags.toLowerCase().includes(query)) &&
                   (isNaN(year) || eventDate.getFullYear() === year) &&
                   (isNaN(month) || eventDate.getMonth() === month);
        });

        renderSearchResults(filteredEvents);
    }

    function renderSearchResults(filteredEvents) {
        calendarEl.innerHTML = '';
        filteredEvents.forEach(event => {
            const eventDate = new Date(event.date);
            const day = document.createElement('div');
            day.classList.add('day');
            day.innerHTML = `<div class="date">${eventDate.getDate()}</div>`;
            const eventEl = document.createElement('div');
            eventEl.classList.add('event', event.progress);
            eventEl.textContent = event.title;
            eventEl.addEventListener('click', () => openModal(event));
            day.appendChild(eventEl);
            calendarEl.appendChild(day);
        });
    }

    prevMonthBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar(currentDate);
    });

    nextMonthBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar(currentDate);
    });

    searchButton.addEventListener('click', searchEvents);

    closeModal.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    deleteEventBtn.addEventListener('click', deleteEvent);

    eventForm.addEventListener('submit', function (e) {
        e.preventDefault();
        saveEvent(e);
    });

    renderCalendar(currentDate);
});