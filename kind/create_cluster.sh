#!/bin/bash
kind delete cluster --name kube-demo
cat <<EOF | kind create cluster --name=kube-demo --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
        authorization-mode: "AlwaysAllow"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80 
    protocol: TCP
  - containerPort: 443 
    hostPort: 443 
    protocol: TCP
EOF

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/baremetal/service-nodeport.yaml

cat <<EOF | kubectl patch deployments -n ingress-nginx nginx-ingress-controller -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
        {
          "name": "nginx-ingress-controller",
          "ports": [
          {
            "containerPort": 80,
            "hostPort": 80 
          },
          {
            "containerPort": 443,
            "hostPort": 443
          }
          ]
        }
        ],
        "nodeSelector": {
          "ingress-ready": "true"
        },
        "tolerations": [
        {
          "key": "node-role.kubernetes.io/master",
          "operator": "Equal",
          "effect": "NoSchedule"
        }
        ]
      }
    }
  }
}'
EOF


kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.0/cert-manager.crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm install cert-manager --namespace cert-manager jetstack/cert-manager --version v0.14.0


while [[ $(kubectl -n cert-manager get deployment cert-manager -o=jsonpath='{.status.conditions[?(@.type=="Available")].status}') != "True" ]];
do
	echo "waiting for cert-manager" && sleep 10;
done
while [[ $(kubectl -n cert-manager get deployment cert-manager-cainjector -o=jsonpath='{.status.conditions[?(@.type=="Available")].status}') != "True" ]];
do
	echo "waiting for cert-manager-cainjector" && sleep 5;
done
while [[ $(kubectl -n cert-manager get deployment cert-manager-webhook -o=jsonpath='{.status.conditions[?(@.type=="Available")].status}') != "True" ]];
do
	echo "waiting for cert-manager-webhook" && sleep 2;
done
