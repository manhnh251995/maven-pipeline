pipeline {

    //agent none
    agent {label 'node2'}
    
    environment {
        PASS = credentials('registry-pass') 
    }

    stages {

        stage('Build') {
            //agent {label 'node2'}
            steps {
                sh '''
                    ./pipeline6/jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./pipeline6/jenkins/build/build.sh
                '''
            }

            post {
                success {
                   archiveArtifacts artifacts: 'pipeline6/java-app/target/*.jar', fingerprint: true
                }
            }
        }

        stage('Test') {
            //agent {label 'node2'}
            steps {
                sh './pipeline6/jenkins/test/mvn.sh mvn test'
            }

            post {
                always {
                    junit 'pipeline6/java-app/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Push') {
            //agent {label 'node2'}
            steps {
                sh './pipeline6/jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            //agent {label 'node1'}
            steps {
                sh './pipeline6/jenkins/deploy/deploy.sh'
            }
        }
    }
}
