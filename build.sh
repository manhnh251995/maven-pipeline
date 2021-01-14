cp -f java-app/target/*.jar ./
docker-compose -f /tmp/edu_jenkins/pipeline6/docker-compose-build.yml build
