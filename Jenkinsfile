node {
    stage('Checkout') {
        checkout scm
    }
    stage('Build') {
        sh "/var/lib/jenkins/isobuild.sh"
    }
}

