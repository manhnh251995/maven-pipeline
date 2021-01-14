FROM openjdk:8-jre-alpine

WORKDIR /app

COPY *.jar app.jar

CMD java -jar app.jar
