FROM ubuntu:latest AS build
RUN apt-get update && apt-get install maven -y

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM ubuntu:latest
RUN apt-get update && apt-get install openjdk-21-jdk -y
WORKDIR /app
COPY --from=build /app/target/*.jar springboot-microservices-eureka.jar

EXPOSE 8761

ENTRYPOINT ["java","-jar","springboot-microservices-eureka.jar"]
