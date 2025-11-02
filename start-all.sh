#!/bin/bash

#mvn clean package -f eureka-service/
#mvn clean package -f auth-service/
#mvn clean package -f product-service/
#mvn clean package -f order-service/
#mvn clean package -f gateway-service/

#java -jar eureka-service/target/eureka-service-0.0.1-SNAPSHOT.jar &
#java -jar eureka-service/target/eureka-service-0.0.1-SNAPSHOT.jar > logs/eureka.log 2>&1 &


#java -jar auth-service/target/auth-service-0.0.1-SNAPSHOT.jar &
#java -jar product-service/target/product-service-0.0.1-SNAPSHOT.jar &
#java -jar order-service/target/order-service-0.0.1-SNAPSHOT.jar &
#java -jar gateway-service/target/gateway-service-0.0.1-SNAPSHOT.jar &



#!/bin/bash

# Função para aguardar até que o Eureka esteja no ar
wait_for_service() {
    local url=$1
    local retries=10
    local count=0

    echo "Aguardando o serviço em $url..."

    while ! curl -s "$url" > /dev/null; do
        count=$((count + 1))
        if [ $count -ge $retries ]; then
            echo "Falhou ao conectar ao serviço $url após $retries tentativas."
            exit 1
        fi
        echo "Tentativa $count de $retries: O serviço não está disponível ainda... aguardando."
        sleep 5
    done

    echo "Serviço $url está disponível!"
}

# Fazer o build e iniciar os serviços

echo "Iniciando o Eureka..."
mvn clean package -f eureka-service/
if [ $? -ne 0 ]; then
    echo "Erro durante o build do Eureka. Abortando..."
    exit 1
fi
java -jar eureka-service/target/eureka-service-0.0.1-SNAPSHOT.jar &
# Aguardar o Eureka ficar no ar antes de iniciar os outros serviços
wait_for_service "http://localhost:8761/eureka"

echo "Iniciando o Auth Service..."
mvn clean package -f auth-service/
if [ $? -ne 0 ]; then
    echo "Erro durante o build do Auth Service. Abortando..."
    exit 1
fi
java -jar auth-service/target/auth-service-0.0.1-SNAPSHOT.jar &

echo "Iniciando o Product Service..."
mvn clean package -f product-service/
if [ $? -ne 0 ]; then
    echo "Erro durante o build do Product Service. Abortando..."
    exit 1
fi
java -jar product-service/target/product-service-0.0.1-SNAPSHOT.jar &

echo "Iniciando o Order Service..."
mvn clean package -f order-service/
if [ $? -ne 0 ]; then
    echo "Erro durante o build do Order Service. Abortando..."
    exit 1
fi
java -jar order-service/target/order-service-0.0.1-SNAPSHOT.jar &

echo "Iniciando o Gateway Service..."
mvn clean package -f gateway-service/
if [ $? -ne 0 ]; then
    echo "Erro durante o build do Gateway Service. Abortando..."
    exit 1
fi
java -jar gateway-service/target/gateway-service-0.0.1-SNAPSHOT.jar &

echo "Todos os serviços foram iniciados!"

