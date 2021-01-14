docker run -it -v /tmp/edu_jenkins/pipeline6/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:3-alpine mvn clean package
