#Clone do repositorio do projeto
git clone https://github.com/Leandro-Naidhig/Trabalho01-TARSD.git

DEBIAN_FRONTEND=noninteractive sudo apt update

#Instalacao do Docker
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
DEBIAN_FRONTEND=noninteractive sudo apt update
DEBIAN_FRONTEND=noninteractive sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

#Iniciando o Docker Swarm Master
#Entrada do programa na instalação da imagem do docker do cliente
cd Trabalho01-TARSD/

#Inicializa e joga o token gerado em um script externo
sudo docker swarm init --advertise-addr 192.168.50.2:2377 | sed 5!d > /vagrant/join.sh

#Criação da rede para o cluster
sudo docker network create -d overlay --subnet 10.0.10.0/24 ClusterNet
