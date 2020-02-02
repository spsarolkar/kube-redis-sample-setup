#ssh into minikube

#minikube ssh

#vim /etc/systemd/resolved.conf

#uncomment/edit below entry
#DNS=8.8.8.8 8.8.4.4

#restart resolvd
#sudo systemctl restart systemd-resolved

ssh -t -i ~/.minikube/machines/minikube/id_rsa docker@$(minikube ip) "sudo cat /etc/systemd/resolved.conf | sed 's/#DNS=/DNS=8.8.8.8 8.8.4.4' >> test.conf"
