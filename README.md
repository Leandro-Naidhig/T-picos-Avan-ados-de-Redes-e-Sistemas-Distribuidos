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

### Decisões de Projeto

Diante da proposta do trabalho, algumas decisões foram necessárias para seu desenvolvimento. Uma destas foi a de utilizar o banco de dados InfluxDB, visto que este apresenta, aparentemente, mais simplicidade e contempla os pontos solicitados na descrição do trabalho. Além desta decisão, optamos em utilizar o Prometheus como ferramenta única para monitoração da infraestrutura, excluindo a possibilidade de utilizar a ferramenta Netdata. Outra decisão tomada pelo grupo foi a de utilizar as ferramentas cAdvisor e Node Exporter para captar todos os dados necessários.

### Infraestutrura

![alt text](https://github.com/Leandro-Naidhig/Trabalho01-TARSD/blob/master/ArquiteturaTARSD-Final.jpg?raw=true)

### Dificuldades Encontradas

Uma das dificuldades encontradas foi fazer a integração do banco de dados ao Prometheus. Em algumas situações, conseguíamos visualizar todas as métricas disponíveis, mas não apenas as métricas selecionadas. Para isto, procuramos conteúdos disponíveis na internet como documentos e vídeos explicando e exemplificando cenários semelhantes a posposta do trabalho. Além desta, enfrentamos a dificuldade de implementar junto a ferramentas (de certa forma, complexas) que não tínhamos familiaridade antes do curso.
