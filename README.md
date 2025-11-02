#Iniciar e Finalizar removendo Docker Compose

	docker-compose up --build
	
	docker-compose down -v --rmi all

#Descrição

Projeto demonstrativo do conceito de Microserviços aplicando Api Gateway para roteamento e Eureka para descobrir e anexar os projetos endpoint

#Estrutura

* Projeto 1: Eureka Server
* Projeto 2: Simulação Auth
* Projeto 3: Simulação Product
* Projeto 4: Simulação Order
* Projeto 5: Gateway
