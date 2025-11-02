#!/bin/bash

sh /usr/local/bin/wait-for-eureka.sh eureka:8761 -- echo "Eureka está disponível!"

#exec java -jar /usr/local/lib/springboot-microservices-auth.jar
exec java -jar springboot-microservices-auth.jar
