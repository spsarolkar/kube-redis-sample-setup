#!/bin/bash
ssh -t -oStrictHostKeyChecking=no -i ~/.minikube/machines/minikube/id_rsa docker@$(minikube ip) "sudo cat /etc/systemd/resolved.conf | sed 's/#DNS\=/DNS=8.8.8.8 8.8.4.4/gi' | sudo tee /etc/systemd/resolved.conf"
ssh -t -oStrictHostKeyChecking=no -i ~/.minikube/machines/minikube/id_rsa docker@$(minikube ip) "sudo systemctl restart systemd-resolved"
kubectl -n kube-system get configmap coredns -o yaml | sed 's/\/etc\/resolv.conf/8.8.8.8/gi' | kubectl apply -f -
PODNAMES=(`kubectl -n kube-system get pods -o jsonpath='{.items[*].metadata.name}'`)
for name in ${PODNAMES[@]}; do
    if echo "$name" | grep -q 'coredns-'; then
        kubectl -n kube-system delete pods "$name"
    fi
done

