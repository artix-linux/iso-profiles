pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''
            env.GIT_COMMIT=$(git rev-parse HEAD)
            echo env.GIT_COMMIT
        '''
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
    GIT_COMMIT = ''
  }
}