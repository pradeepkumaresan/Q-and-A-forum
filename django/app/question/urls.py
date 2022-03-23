from django.urls import path
from .views import TaskManager
from django.contrib.auth.decorators import login_required
urlpatterns=[
    path('question/', TaskManager.as_view())
]