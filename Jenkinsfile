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
                sh 'docker tag sample-web:1.0.0 ec2-18-138-18-14.ap-southeast-1.compute.amazonaws.com:5000/sample-web:1.0'
                sh 'docker push ec2-18-138-18-14.ap-southeast-1.compute.amazonaws.com:5000/sample-web:1.0'
            }
        }

        stage('Deploy') {
            script {
                sshPublisher(
                    continueOnError: false, failOnError: true,
                    publishers: [
                        sshPublisherDesc(
                            configName: "minikube",
                            verbose: true,
                            transfers: [
                                sshTransfer(
                                    sourceFiles: "./deployment",
                                    remoteDirectory: "./deployment",
                                    execCommand: "./deploy.sh"
                                )
                            ]
                        )
                    ]
                )
            }
        }
    }
}
