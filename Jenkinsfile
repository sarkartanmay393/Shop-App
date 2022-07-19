// This file is used with Shop-App for testing Jenkins

pipeline { 

    agent none

    enviroment {
        NEW_VERSION = '1.0'
        SERVER_CRED = credentials("") # credentials id can be used inside that func.
    }

    stages {
        stage('Build') {
            when {
                expression {
                    BRANCH_NAME = 'test-jenkins'
                }
            }
            agent {
                docker {
                    image 'fischerscode/flutter'
                }
            }
            steps {
                sh 'flutter version'
                // echo "Build stage is running."

            }
        }
        
    }

    post {
        always {

        }
        success {

        }
        failure {

        }
    }

}
