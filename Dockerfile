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

# Set environment variables (example for MySQL)
ENV SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/Volkswagen
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=12345
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update

# Run the application
CMD ["java", "-jar", "target/ecommerce-cars-0.0.1-SNAPSHOT.jar"]
