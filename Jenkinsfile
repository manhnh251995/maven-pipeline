pipeline {
    agent none
    //options {
        //skipStagesAfterUnstable()
    //}
    environment {
        BUILD_TAG = 'test'
        REGISTRY_PASS = credentials("docker-registry-pass")
        IMAGE = "maven-project"
    }
    stages {
        stage("work dir pull git repo") {
            agent { label 'master' }
            steps {
                sh '''
                pwd && ls -la ./ 
                '''
            }
        }
        stage("Build antifact"){
            agent { label 'master' }
            steps {
                sh'''
                docker run -v /var/lib/jenkins/workspace/pipelinemaven/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:3-alpine mvn clean package
                '''
            }
        }
        stage("Build image") {
            agent {label 'master'}
            steps {
                sh'''
                ./build.sh
                '''
            }
        }
        stage("push image to Docker registry, END CI pipeline") {
            agent {label 'master'}
            steps {
                sh'''
                ./push.sh
                '''
            }
        }
        stage("CD pipline deploy to product"){
            agent {label 'jenkin02'}
            steps {
                sh'''
                docker login -u manhnh1995 -p $REGISTRY_PASS
                docker run -d manhnh1995/$IMAGE:$BUILD_TAG-$BUILD_NUMBER 
                '''
            }
        }
    }   
}
