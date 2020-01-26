#!/bin/bash

export PATH=/usr/games:$PATH
python manage.py migrate 
python manage.py runserver 0.0.0.0:8000 >> log 2>&1
