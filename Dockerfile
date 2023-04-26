# Define the parent image
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory of the container
WORKDIR /app

# Copy the created JAR to the root folder
COPY ./myapp/target/*.jar /app/myapp.jar

# Create new username & group and set it as the folder owner
RUN adduser --system --no-create-home --group myuser && \
    chown -R myuser:myuser /app

# Set the user of the image
USER myuser

# Define the default executable of a Docker image
CMD ["java","-jar","myapp.jar"]
