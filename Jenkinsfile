pipeline {
    agent any

    options {
        timestamps()
    }

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['blue', 'green'],
            description: 'Select environment to deploy'
        )
    }

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checking out source code..."
                git branch: 'main',
                    url: 'https://github.com/bhargavdevopsaws/terraform-bluegreen-pipeline.git'
            }
        }

        stage('Verify Environment Folder') {
            steps {
                sh '''
                    echo "Root directory content:"
                    ls -l
                '''
                sh """
                    echo "Checking ${params.ENVIRONMENT} folder..."
                    ls -l ${params.ENVIRONMENT}
                """
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${params.ENVIRONMENT}") {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-access'
                    ]]) {
                        sh '''
                            terraform --version
                            terraform init
                        '''
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${params.ENVIRONMENT}") {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-access'
                    ]]) {
                        sh '''
                            terraform plan \
                            -var-file="terraform.tfvars" \
                            -out=tfplan
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${params.ENVIRONMENT}") {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-access'
                    ]]) {
                        sh '''
                            terraform apply -auto-approve tfplan
                        '''
                    }
                }
            }
        }

        stage('Terraform Output') {
            steps {
                dir("${params.ENVIRONMENT}") {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-access'
                    ]]) {
                        sh 'terraform output'
                    }
                }
            }
        }

    }

    post {
        success {
            echo "Deployment to ${params.ENVIRONMENT} completed successfully!"
        }
        failure {
            echo "Deployment failed. Check logs."
        }
    }
}
