#!/bin/bash
./namespace.sh
kubectl apply -f redis-master-sentinel.yml
kubectl apply -f redis-master-sentinel-service.yml
kubectl apply -f redis-replica-sentinel.yml
kubectl apply -f redis-replica-sentinel-service.yml
(cd example; ./deploy.sh)
