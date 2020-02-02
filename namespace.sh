#!/bin/bash
kubectl create ns web
kubectl config set-context local-web --cluster minikube --user minikube --namespace web
kubectl config use-context local-web

