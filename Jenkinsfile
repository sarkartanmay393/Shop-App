// This file is used with Shop-App for testing Jenkins

pipeline { 

    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'fischerscode/flutter'
                }
            }
            steps {
                sh 'flutter version'
                echo 'echooooo'
                // echo "Build stage is running."
            }
        }
    }
}
