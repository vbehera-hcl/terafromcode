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
        ansiColor('xterm')
    }

    parameters {
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
//
  //      stage('pull terraform docker') {
    //        steps {
      //          sh 'sudo docker pull hashicorp/terraform:${terraform_version}'
        //    }
        //}

        stage('foundation-plan') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd foundation
                       #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/foundation init
                        terraform -chdir=scaffolding/foundation init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/foundation plan
                        terraform -chdir=scaffolding/foundation plan
                    '''
                }
            }
        }


        stage('foundation-apply') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd foundation
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/foundation init
                        terraform -chdir=scaffolding/foundation init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/foundation apply --auto-approve
                        terraform -chdir=scaffolding/foundation apply --auto-approve
                    '''
                }
            }
        }

        stage('platform-plan') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd platform
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/platform init
                        terraform -chdir=scaffolding/platform init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/platform plan
                        terraform -chdir=scaffolding/platform plan
                    '''
                }
            }
        }


        stage('platform-apply') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd platform
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/platform init
                        terraform -chdir=scaffolding/platform init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/platform apply --auto-approve
                        terraform -chdir=scaffolding/platform apply --auto-approve
                    '''
                }
            }
        }
    

        stage('garage-plan') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd garage
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/garage init
                        terraform -chdir=scaffolding/garage init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/garage plan
                        terraform -chdir=scaffolding/garage plan
                    '''
                }
            }
        }

        stage('garage-apply') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd garage
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/garage init
                        terraform -chdir=scaffolding/garage init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/garage apply --auto-approve
                        terraform -chdir=scaffolding/garage apply --auto-approve
                    '''
                }
            }
        }
    

        stage('roof-plan') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd roof
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/roof init
                        terraform -chdir=scaffolding/roof init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/roof plan
                        terraform -chdir=scaffolding/roof plan
                    '''
                }
            }
        }


        stage('roof-apply') {
            steps {
                dir("scaffolding/") {
                    sh '''
                    #!/bin/bash
                        cd roof
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app  hashicorp/terraform:${terraform_version} -chdir=scaffolding/roof init
                        terraform -chdir=scaffolding/roof init
                        #sudo docker run -w /app -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -v $WORKSPACE:/app hashicorp/terraform:${terraform_version} -chdir=scaffolding/roof apply --auto-approve
                        terraform -chdir=scaffolding/roof apply --auto-approve
                    '''
                    cleanWs()
                }
            }
        }
    }
}
