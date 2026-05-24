# URL Shortener

Production-grade URL shortening service with click analytics, built with
Spring Boot 3, PostgreSQL, and Redis.

## Tech Stack

Java 21 · Spring Boot 3.5 · Spring Security · PostgreSQL 16 · Redis 7
Flyway · JWT · Testcontainers · Docker

## Running Locally

```bash
docker-compose up -d       # starts postgres + redis
./gradlew bootRun          # starts the app on port 8080
```

Swagger UI: http://localhost:8080/swagger-ui.html  
Health check: http://localhost:8080/actuator/health

## Running Tests

```bash
./gradlew test
```
