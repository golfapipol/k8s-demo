pipeline {
    agent any

    stages {
        stage('Build Artifact') {
            steps {
                sh 'docker build -t sample-web:1.0.0 .'
            }
        }
        
        stage('Push Artifact') {
            steps {
                sh 'docker tag sample-web:1.0.0 712380418412.dkr.ecr.ap-southeast-1.amazonaws.com/sample-web:1.0'
                sh 'docker push 712380418412.dkr.ecr.ap-southeast-1.amazonaws.com/sample-web:1.0'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sshPublisher(
                        continueOnError: false, failOnError: true,
                        publishers: [
                            sshPublisherDesc(
                                configName: "minikube",
                                verbose: true,
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: "deployment/**",
                                        execCommand: "cd deployment && chmod 700 deploy.sh && ./deploy.sh"
                                    )
                                ]
                            )
                        ]
                    )
                }   
            }
        }
    }
}
