from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import status
from .models import User
from .serializers import UserSerializer


# Create your views here.
class GetAllUsers(APIView):
    def get(self, request):
        data = User.objects.all()
        data = UserSerializer(data, many=True)
        return Response(data=data, status=status.HTTP_200)
