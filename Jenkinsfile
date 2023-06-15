pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        VERSION = '1.0'
    }
    stages {
        stage('Build') {
            steps {
                script {

                    def dockerImage = docker.build("${DOCKERHUB_CREDENTIALS_USR}/go-app:${VERSION}", '.')
                    if (dockerImage) {
                        // Build succeeded
                        sh "docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${$DOCKERHUB_CREDENTIALS_PSW}"
                        dockerImage.push()
                    } else {
                        // Build failed
                        error('Docker build failed')
                    }
                    
                
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Testing stage!'
            }
        }
    }

    post {
        always {
            // Clean up the Docker image after the build
            echo "docker rmi ${DOCKERHUB_CREDENTIALS_USR}/go-app:${VERSION}"
        }

        success {
            echo 'Build successful!'
        }

        failure {
            echo 'Build failed!'
        }
        
    }
    
}
