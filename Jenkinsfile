pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                checkout scm
            }
        }
        stage('Deploy') {
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
