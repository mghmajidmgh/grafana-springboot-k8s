# Build Stage
FROM maven:3.9.5-eclipse-temurin-21 AS builder

WORKDIR /app
COPY . .
# Build the standard Spring Boot executable jar (not the native image)
RUN chmod +x mvnw && \
    ./mvnw package -DskipTests && \
    echo ""; echo "=== target directory listing ==="; ls -la target/ || true

# Run Stage: use a small JRE image to run the packaged jar
FROM eclipse-temurin:21-jre

WORKDIR /app
# Copy the packaged jar from the builder stage. The spring-boot plugin writes
# the executable jar under target/ with the artifactId/version name; copy any
# matching jar and rename to app.jar for a stable entrypoint.
COPY --from=builder /app/target/*-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]