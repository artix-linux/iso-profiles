pipeline {
    agent any
    checkout scm
    stages {
        stage('Build') {
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
