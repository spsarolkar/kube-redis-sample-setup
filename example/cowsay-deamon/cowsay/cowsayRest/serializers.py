from rest_framework import serializers


class MessageSerializer(serializers.Serializer):
    message = serializers.CharField(max_length=2048)
    serverName = serializers.CharField(max_length=64)

