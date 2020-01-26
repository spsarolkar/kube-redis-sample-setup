
echo "Allow cowsay service on virbr0"
runuser -l sunils -c "minikube service fortune-teller-service -n web --url | sed 's/http:\/\///' | sed 's/:[0-9]*//'"
endpoint=$(runuser -l sunils -c "minikube service fortune-teller-service -n web --url | sed 's/http:\/\///' | sed 's/:[0-9]*//'")
port=$(runuser -l sunils -c "minikube service fortune-teller-service -n web --url | sed 's/http:\/\///' | sed 's/[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\://'")
echo $endpoint
echo $port
#echo $endpoint | xargs iptables -t nat -A PREROUTING -p tcp -i br0 --dport 32737 -j DNAT --to-destination $1
iptables -t nat -A PREROUTING -p tcp -i br0 --dport $port -j DNAT --to-destination $endpoint
iptables -A FORWARD -i br0 -o virbr0 -p tcp --dport $port -j ACCEPT
iptables -A FORWARD -i virbr0 -o br0 -j ACCEPT
iptables -t nat -I POSTROUTING -o virbr0 -j MASQUERADE
