pipeline {
    agent any

    stages {
        stage('Build Iso') {
            steps {
                echo "buildiso -p ${profile}"
                sh "printenv"
            }
            post {
                success {
                    echo 'deployiso -p ${profile}'
                }
            }
        }
    }
}
