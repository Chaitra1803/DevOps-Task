pipeline {
    agent any
    environment {
        DOCKER_TASK_IMAGE = "mydevopstask"
        DOCKER_REGISTRY_CREDS = "dockerhub"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t mydevopstask .'
                    sh 'docker tag mydevopstask $DOCKER_TASK_IMAGE'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
                        sh 'docker push veera1808/mydevopstask'
                    }
                }
            }
        }
    }
}
