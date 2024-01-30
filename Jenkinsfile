pipeline {
  agent any
 stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
       
    }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t mydevopstask .'
        sh 'docker tag mydevopstask $DOCKER_TASK_IMAGE'
      }
    }

   stage('Test') {
      echo "testing"
    }
   stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
          sh 'docker push veera1808/mydevopstask'
        }
      }
    }
    
  }
}
