FROM adoptopenjdk:11-jre-hotspot

WORKDIR /app

COPY ./myapp/target/*.jar /app/myapp.jar


RUN adduser --system --no-create-home --group myuser && \
    chown -R myuser:myuser /app

USER myuser

CMD ["java","-jar","myapp.jar"]
