FROM ubuntu:latest AS build
RUN apt-get update && apt-get install maven -y

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM ubuntu:latest
RUN apt-get update && apt-get install openjdk-21-jdk -y
WORKDIR /app
COPY --from=build /app/target/*.jar springboot-microservices-auth.jar

EXPOSE 8081

#COPY ../wait-for-eureka.sh /usr/local/bin/wait-for-eureka.sh

#RUN chmod +x /usr/local/bin/wait-for-eureka.sh

COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]
#ENTRYPOINT ["java","-jar","springboot-microservices-auth.jar"]
