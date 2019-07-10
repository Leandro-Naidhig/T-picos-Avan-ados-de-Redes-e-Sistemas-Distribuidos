#Criação do database para o app3
sudo docker run -d --name="influxdb" -p 8086:8086 influxdb
sleep 60; curl -X POST -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE prometheus"
