pipeline {
    agent any
    environment{
        git_commit = ''
    }
    stages {
        stage('Build Iso') {
            steps {
                echo "buildiso -p ${profile}"
                sh "printenv"
                echo "Commit ${env.GIT_COMMIT}"
            }
            post {
                success {
                    echo "deployiso -p ${profile}"
                }
            }
        }
    }
}
