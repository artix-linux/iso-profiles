pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo "buildiso -p ${profile}"
                sh "printenv"
            }
        }
        stage('Deploy') {
            steps {
                echo "deployiso -p ${profile}"
            }
        }
    }
}
