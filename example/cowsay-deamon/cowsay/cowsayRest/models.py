from django.db import models

# Create your models here.

class Message(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    message = models.CharField(max_length=2048)
    serverName = models.CharField(max_length=64)

    def __init__(self, message, serverName):
        self.message = message
        self.serverName = serverName

    class Meta:
        ordering = ('created',)
