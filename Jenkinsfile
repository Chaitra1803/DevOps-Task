pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "veera1808/mydevopstask"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build Docker Image
                    docker.build(env.DOCKER_IMAGE_NAME, '.')

                    // Push Docker Image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        docker.image(env.DOCKER_IMAGE_NAME).push()
                    }
                }
            }
        }
    }

    post {
        success {
            script {
                // Print Docker Image URL
                echo "Docker Image URL: https://hub.docker.com/r/${env.DOCKER_IMAGE_NAME}"
            }
        }
    }
}
