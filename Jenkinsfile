pipeline {
    agent {
        label 'int-python-stg-1'
    }
    environment {
        PROJECT_NAME = '$PROJECT_NAME'
        BUILD_NUMBER = '$BUILD_NUMBER'
        BUILD_STATUS = '#' 
        CUSTOM_BUILD_URL = '$BUILD_URL'
    }
    stages {
        stage("Collecting Requirements") {
            steps {
                
                sh "sudo pip3 install -r requirements.txt"
            }
        }
        stage("Deploy") {
            steps {
                sh "sudo pm2 restart hospital-8019"
                sh "echo pyhospital-management.mobiloitte.io"
            }
        }
    }
    post {
        always {
            script {
                // Update BUILD_STATUS based on build result
                def buildOutcome = currentBuild.resultIsBetterOrEqualTo('SUCCESS') ? 'SUCCESS' : 'FAILURE'
                BUILD_STATUS = buildOutcome

                emailext attachLog: true, body: """<html>
                    <head>
                        <style>
                            .build-status {
                                color: ${BUILD_STATUS == 'SUCCESS' ? 'green' : 'red'};
                            }
                        </style>
                    </head>
                    <body>
                        <p>Hello,</p>
                        <b><p>This notification is to inform you about your project's build has been $BUILD_STATUS .</p></b>
                        <ul>
                            <li><strong>Project Name:</strong> $PROJECT_NAME</li>
                            <li><strong>Build Number:</strong> $BUILD_NUMBER</li>
                            <li><strong>Build Status:</strong> <span class="build-status">$BUILD_STATUS</span></li>
                            <li><strong>Build Log:</strong> <p>Attached Below</p>
                        </ul>
                        
                    </body>
                </html>""", subject: 'PROJECT BUILD STATUS via JENKINS', to: 'sukrit.gehlot@mobiloitte.com, team-it@mobiloitte.com', mimeType: 'text/html'
            }
        }
    }
}
