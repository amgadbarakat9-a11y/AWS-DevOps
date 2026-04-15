pipeline {
    agent any  

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'prod'],
            description: 'choose environment'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/amgadbarakat9-a11y/AWS-DevOps.git'
            }
        }

        stage('Terraform Init & Workspace') {
    steps {
        withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'aws-creds'
        ]]) {
            sh """
                export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                export AWS_DEFAULT_REGION=us-east-1

                terraform init

                terraform workspace select ${params.ENVIRONMENT} || \
                terraform workspace new ${params.ENVIRONMENT}
            """
        }
    }
}

        stage('Terraform Plan') {
            steps {
                sh """
                    terraform plan -var-file="${params.ENVIRONMENT}.tfvars"
                """
            }
        }

        stage('Terraform Apply') {
            steps {
                sh """
                    terraform apply -var-file="${params.ENVIRONMENT}.tfvars" -auto-approve
                """
            }
        }
    }
}