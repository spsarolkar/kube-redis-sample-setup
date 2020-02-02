#!/bin/bash
eval $(minikube docker-env)
(cd docker-master-sentinel; ./clean-build.sh)
(cd docker-replica-sentinel; ./clean-build.sh)
(cd example; ./build.sh)
