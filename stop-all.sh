#!/bin/bash

#pideureka=$(ps aux | grep eureka-service | grep -v grep | awk '{print $2}')
#kill -9 $pideureka

#pidauth=$(ps aux | grep auth-service | grep -v grep | awk '{print $2}')
#kill -9 $pidauth

#pidprod=$(ps aux | grep product-service | grep -v grep | awk '{print $2}')
#kill -9 $pidprod

#pidorder=$(ps aux | grep order-service | grep -v grep | awk '{print $2}')
#kill -9 $pidorder

#pidgateway=$(ps aux | grep gateway-service | grep -v grep | awk '{print $2}')
#kill -9 $pidgateway



# Função para matar os processos dos serviços
stop_service() {
    # Filtra os processos relacionados ao serviço pelo nome do JAR
    local service_name=$1
    echo "Parando o serviço $service_name..."

    # Encontra os processos relacionados ao JAR e os mata
    pid=$(ps aux | grep "$service_name" | grep -v grep | awk '{print $2}')
    
    if [ -n "$pid" ]; then
        kill -9 $pid
        echo "$service_name parado com sucesso!"
    else
        echo "Nenhum processo encontrado para $service_name."
    fi
}

# Parar o Eureka
stop_service "eureka-service-0.0.1-SNAPSHOT.jar"

# Parar o Auth Service
stop_service "auth-service-0.0.1-SNAPSHOT.jar"

# Parar o Product Service
stop_service "product-service-0.0.1-SNAPSHOT.jar"

# Parar o Order Service
stop_service "order-service-0.0.1-SNAPSHOT.jar"

# Parar o Gateway Service
stop_service "gateway-service-0.0.1-SNAPSHOT.jar"

echo "Todos os serviços foram parados!"

