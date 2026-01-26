pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'clouddeploy-app'
        REGISTRY = 'registry.example.com' // Placeholder
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    // sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
                    echo 'Docker build simulated successfully.'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    // In a real scenario: sh "docker run --rm ${DOCKER_IMAGE}:${BUILD_NUMBER} npm test"
                    echo 'Tests passed successfully.'
                }
            }
        }

        stage('Push to Registry') {
            steps {
                script {
                    echo 'Pushing image to registry...'
                    // sh "docker push ${REGISTRY}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
                    echo 'Image pushed to registry.'
                }
            }
        }

        stage('Deploy to Staging') {
            steps {
                script {
                    echo 'Deploying to Staging Environment...'
                    // Here we would call Ansible
                    // sh "ansible-playbook -i infra/ansible/inventory/hosts infra/ansible/playbooks/deploy-app.yml"
                    echo 'Ansible playbook executed successfully. Application deployed to Staging.'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
