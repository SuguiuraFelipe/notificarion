FROM gradle:8.14.4-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle bootJar --no-daemon

FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY --from=build /app/build/libs/notification-0.0.1-SNAPSHOT.jar /app/notification.jar

EXPOSE 8083

CMD ["java", "-jar", "/app/notification.jar"]