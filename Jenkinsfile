pipeline {

    agent any

    enviroment {
        NEW_VERSION = '1.0'
        SERVER_CRED = credentials("") # credentials id can be used inside that func.
    }

    stages {
        stage('test') {
            when { // when condition
                expression {
                    BRANCH_NAME = 'test-jenkins'
                }
            }
            steps {
                echo "test stage is running in test jenkins branch only."
                echo "current verision ${NEW_VERSION}"
            }
        }
        stage('deploy') {
            steps {
                echo "Building stage is running."
            }
        }
    }

}
