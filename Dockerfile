#
# Build stage
#
FROM maven:3.8.4-openjdk-17 as BUILD
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo.jar"]