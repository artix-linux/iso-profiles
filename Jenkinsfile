pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo '"buildiso -p ${profile}"'
        sh 'printenv'
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