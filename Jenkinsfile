pipeline {
    agent {
        node {
            label 'terraform'
        }
    }
    options {
        buildDiscarder(
            logRotator(numToKeepStr:'10')
        )
        // ansiColor('xterm')
    }

    parameters {
        choice(
            name: 'infrastructure_layer',
            choices: [
                "Select infrastructure to create",
                "foundation",
                "platform",
                "garage",
                "roof"
            ],
            description: 'Select Infrastructure Layer'
        )

        choice(
            name: 'terraform_version',
            choices: [
                "select-version",
                "1.3.0"
            ],
            description: 'Select terraform version'
        )
    }

    stages {

        stage('pull terraform docker') {
            steps {
                sh 'sudo docker pull hashicorp/terraform:${terraform_version}'
            }
        }

        stage('plan') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd ${infrastructure_layer}
                        sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/${infrastructure_layer} init
                        sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/${infrastructure_layer} plan
                        rm env.list
                    '''
                }
            }
        }

        stage('approval') {
            options {
                timeout(time: 1, unit: 'HOURS')
            }
            steps {
                input 'approve the plan to proceed and apply'
            }
        }

        stage('apply') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd ${infrastructure_layer}
                        sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/${infrastructure_layer} init
                        sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/${infrastructure_layer} apply --auto-approve
                        rm env.list
                    '''
                    cleanWs()
                }
            }
        }
    }
}
