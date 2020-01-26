from django.conf.urls import url
from cowsayRest import views

urlpatterns = [
    url(r'^fortune/$', views.fortune),
    url(r'^', views.fortune),
]
