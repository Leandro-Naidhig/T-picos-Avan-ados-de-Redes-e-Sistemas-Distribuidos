#Criação do database para o app3
sudo docker volume create metrics_vms
sudo docker service create -d --name data_vms -p 8086:8086 --mount source=metrics_vms,target=/var/lib/influxdb --network ClusterNet influxdb
sleep 60; curl -X POST -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE prometheus"
