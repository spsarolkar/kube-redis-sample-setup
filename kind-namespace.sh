#!/bin/bash
(cd kind; ./create_cluster.sh)
kubectl config use-context kind-kube-demo
kubectl create ns web
kubectl create ns cert-manager

