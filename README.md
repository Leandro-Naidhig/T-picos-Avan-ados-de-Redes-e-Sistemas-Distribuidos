# Tópicos Avançados em Redes de Computadores e Sistemas Distribuídos - Trabalho Prático

Bacharelado em Ciência da Computação

Universidade Federal de São Carlos - Campus Sorocaba

### Trabalho Final Prático da disciplina de TARSD

Docente: Prof.  Dr.  Fabio Verdi

Auxiliares: Paulo Ditarso e André Beltrami

### Integrantes
Nome: [Bruno Sacconi Peres](https://github.com/mdk97)
RA: 726501

Nome: [Leandro Naidhig](https://github.com/Leandro-Naidhig)
RA: 726555

Nome: [Vinícius Silva Salinas](https://github.com/viniciussalinas)
RA: 726594

**Resumo:** Este documento tem o objetivo de relatar os passos elaborados e descrever o trabalho produzido na disciplina que aborda o tema de Cloud Network Slicing. Neste trabalho prático, foram desenvolvidos serviços segundo a infraestrutura prosposta que contempla a criação de três aplicações: tranferência de arquivo entre cliente e servidor; armazenamento das métricas dos containers; e armazenamentos das métricas das VMs. Utilizamos para tal desenvolvimento ferramentas como Vagrant, Docker Swarm, InfluxDB, Prometheus, entre outros citados abaixo. Informações sobre a infraestrutura montada, dificuldades encontradas e decisões de projeto estão presentes neste documento.

----

### Decisões de Projeto

Diante da proposta do trabalho, algumas decisões foram necessárias para seu desenvolvimento. Uma destas foi a de utilizar o banco de dados InfluxDB, visto que este apresenta, aparentemente, mais simplicidade e contempla os pontos solicitados na descrição do trabalho. Além desta decisão, optamos em utilizar o Prometheus como ferramenta única para monitoração da infraestrutura, excluindo a possibilidade de utilizar a ferramenta Netdata. Outra decisão tomada pelo grupo foi a de utilizar as ferramentas cAdvisor e Node Exporter para captar todos os dados necessários dos containers e das máquinas virtuais.

----

### Infraestutrura

A partir da descrição dos requisitos do trabalho, utilizamos a infraestrutura contendo duas VMs (máquinas virtuais). Neste caso, as VMs auxiliam na representação do serviço proposto para a tranferência de arquivos, que é uma funcionalidade presente na aplicação 1. Para a configuração inicial destas máquinas virtuais utilizamos os scripts Vagrantfile, Cliente.sh e Server.sh.

Para cada uma das máquinas virtuais, inserimos as ferramentas Node Exporter e cAdvisor, em que estes coletam os dados dos containers e VMs, respectivamente. Estas ferramentas estão em containers e são muito importantes para que as aplicações 2 e 3 sejam executadas com sucesso.

Para monitoramentos dos containers e da infraestrutura, utilizamos o Prometheus em um container, presente em uma de nossas máquinas virtuais. Utilizamos os arquivos presentes na pasta prometheus para a coleta dos dados captados pelo Node Exporter e cAdvisor e para instituir as regras de gravação destes dados. Para o armazenamento destes dados, utilizamos a ferramenta InfluxDB.

Desta forma, anexamos abaixo a figura macro do ambiente que utilizamos para a execução e realização da atividade proposta.

![alt text](https://github.com/Leandro-Naidhig/Trabalho01-TARSD/blob/master/ArquiteturaTARSD.jpg?raw=true)

----

### Dificuldades Encontradas

Uma das dificuldades encontradas foi fazer a integração do banco de dados ao Prometheus. Em algumas situações, conseguíamos visualizar todas as métricas disponíveis, mas não apenas as métricas selecionadas. Para isto, procuramos conteúdos disponíveis na internet como documentos e vídeos explicando e exemplificando cenários semelhantes a posposta do trabalho. Além desta, enfrentamos a dificuldade de implementar o docker file de modo a fazer com que a aplicação 1 faça o bind na porta. Outra dificuldade foi a de que, mesmo depois de várias tentativas, o grupo não conseguiu implementar o remote write em prometheus.yml.
