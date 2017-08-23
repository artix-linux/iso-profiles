pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo '"buildiso -p ${profile}"'
        sh 'git rev-parse HEAD"'
      }
      post {
        success {
          echo "deployiso -p ${profile}"
          
        }
        
      }
    }
  }
  environment {
    git_commit = ''
  }
}