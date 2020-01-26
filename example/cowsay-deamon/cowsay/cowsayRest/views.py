from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from cowsayRest.models import Message
from cowsayRest.serializers import MessageSerializer
import socket
import subprocess
# Create your views here.


@csrf_exempt
def fortune(request):
    fortune = subprocess.Popen(('fortune'), stdout=subprocess.PIPE)
    output = subprocess.check_output(('cowsay'), stdin=fortune.stdout)
    fortune.wait()
    message = MessageSerializer(Message(message = output.decode("utf-8"),serverName = socket.gethostname()))
    return JsonResponse(message.data, safe = False)



