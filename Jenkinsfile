pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''
            GIT_COMMIT=$(git rev-parse HEAD)
            DEST=$(git show --pretty=format: --name-only "${GIT_COMMIT}")
            for f in ${DEST[@]};do
                if [[ $f == */profile.conf ]];then
                    PROFILE=${f%/profile.conf}
                    echo  "buildiso -p ${PROFILE}"
                fi done
            '''
      }
      post {
        success {
          echo 'success'
          
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