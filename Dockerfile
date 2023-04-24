FROM openjdk:8-jdk-alpine
RUN addgroup -S liel && adduser -S liel -G liel
USER liel:liel
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]