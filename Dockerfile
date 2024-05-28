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

# Expose port 8080
EXPOSE 8080

# Set environment variables for the database
ENV SPRING_DATASOURCE_URL=jdbc:mysql://mysql-rfam-public.ebi.ac.uk:4497/Rfam
ENV SPRING_DATASOURCE_USERNAME=rfamro
ENV SPRING_DATASOURCE_PASSWORD=
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update

# Run the application
CMD ["java", "-jar", "target/ecommerce-cars-0.0.1-SNAPSHOT.jar"]
