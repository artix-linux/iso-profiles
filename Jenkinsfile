pipeline {
    agent any

    stages {
        stage('Checkout source') {
            checkout scm
        }
        stage('Build Iso') {
            steps {
                echo "buildiso -p ${profile}"
                sh "printenv"
            }
        }
        post {
            success {
                echo 'deployiso -p ${profile}'
            }
        }
    }
}
