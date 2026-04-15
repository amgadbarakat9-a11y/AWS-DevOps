pipeline {
     agent any  
     
     parameters {
         choice ( 
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
         stage('Terraform Init') {
    steps {
        sh """
            terraform init
            terraform workspace select ${params.ENVIRONMENT} || terraform workspace new ${params.ENVIRONMENT}
        """
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
