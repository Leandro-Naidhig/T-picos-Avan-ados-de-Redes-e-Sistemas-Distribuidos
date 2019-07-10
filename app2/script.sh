#Criação do database para o app2
sudo docker run -d --name="influxdb" -p 8087:8086 influxdb
sleep 60; curl -X POST -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE prometheus"
