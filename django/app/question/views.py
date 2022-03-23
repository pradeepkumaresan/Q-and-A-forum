from django.shortcuts import render
from django.views import View
from django.http import HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response


# Create your views here.

class TaskManager(APIView):

    def get(self, request, *args, **kwargs):
        # your get logic here
        return Response({"message": "Response from the question API get request"})

    def post(self, request, *args, **kwargs):
        return HttpResponse({'message': 'post call'})

