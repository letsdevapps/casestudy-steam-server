#!/bin/bash
until netcat -z -v -w30 eureka 8761
do
  echo "Esperando Eureka ficar disponível..."
  sleep 15
done
echo "Eureka está disponível!"
