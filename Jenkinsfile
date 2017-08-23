pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo '"buildiso -p ${profile}"'
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
    profile = ''
  }
}