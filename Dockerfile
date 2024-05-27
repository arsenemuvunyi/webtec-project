# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Grant execute permission on the mvnw file
RUN chmod +x ./mvnw

# Build the application using Maven
RUN ./mvnw clean install

# Run the application
CMD ["java", "-jar", "target/ecommerce-cars-0.0.1-SNAPSHOT.jar"]
