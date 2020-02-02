#!/bin/bash
eval $(minikube docker-env)
docker rmi spsarolkar/cowsay-deamon:1.0
docker rmi spsarolkar/fortune-teller:2.0
(cd cowsay-deamon/cowsay; docker build -t spsarolkar/cowsay-deamon:1.0 .)
(cd fortune-teller-ui; docker build -t spsarolkar/fortune-teller:2.0 .)
