#Criação do database para o app2
sudo docker volume create metrics_containers
sudo docker service create -d --name data_containers -p 8086:8086 --mount source=metrics_containers,target=/var/lib/influxdb --network ClusterNet influxdb
sleep 60; curl -X POST -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE prometheus"
