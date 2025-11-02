FROM openjdk:21-jdk-slim AS build
RUN apt-get update && apt-get install maven -y

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar springboot-microservices-order.jar

EXPOSE 8083

#COPY ../wait-for-eureka.sh /usr/local/bin/wait-for-eureka.sh

#RUN chmod +x /usr/local/bin/wait-for-eureka.sh

COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]
#ENTRYPOINT ["java","-jar","springboot-microservices-order.jar"]
