pipeline {
    agent any
    stages {
        stage('Checkout') {
            checkout scm
        }
        stage('Build') {
            echo "buildiso -p ${profile}"
        }
        stage('Deploy') {
            echo "deployiso -p ${profile}"
            sh "printenv"
        }
    }
}
