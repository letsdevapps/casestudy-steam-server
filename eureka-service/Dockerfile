FROM openjdk:21-jdk-slim AS build
RUN apt-get update && apt-get install maven -y

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar springboot-microservices-eureka.jar

EXPOSE 8761

ENTRYPOINT ["java","-jar","springboot-microservices-eureka.jar"]
