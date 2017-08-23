pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''
            GIT_COMMIT=$(git rev-parse HEAD)
            DEST=$(git show --pretty=format: --name-only "${GIT_COMMIT}")
            for f in ${DEST[@]};do
                [[ $f == */profile.conf ]] && PROFILE=${f%/profile.conf}
            done
            '''
        echo '"buildiso -p ${PROFILE}"'
      }
      post {
        success {
          echo "deployiso -p ${PROFILE}"
          
        }
        
      }
    }
  }
  environment {
    GIT_COMMIT = ''
    DEST = ''
    PROFILE = ''
  }
}