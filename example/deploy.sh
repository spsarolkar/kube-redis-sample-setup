#!/bin/bash
kubectl apply -f cowsay-deployment.yml
kubectl apply -f cowsay-service.yml
kubectl apply -f fortune-teller-deployment.yml
kubectl apply -f fortune-teller-service.yml
