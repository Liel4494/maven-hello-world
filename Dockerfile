# Define the parent image for the build stage
FROM adoptopenjdk:11-jdk-hotspot AS build

# Set the working directory of the container
WORKDIR /app

# Copy the source code to the container
COPY . /app

# Build the application and create the JAR file
RUN ./mvnw clean package

# Define the parent image for the runtime stage
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory of the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar /app/myapp.jar

# Create new username & group and set it as the folder owner
RUN adduser --system --no-create-home --group myuser && \
    chown -R myuser:myuser /app

# Set the user of the image
USER myuser

# Define the default executable of a Docker image
CMD ["java","-jar","myapp.jar"]
