pipeline {
    agent any

    stages {
        stage('Build Iso') {
            steps {
                checkout scm
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
