FROM gradle:8.14.0-jdk21 AS builder
WORKDIR /app
COPY . .
RUN gradle  build --no-daemon

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]


