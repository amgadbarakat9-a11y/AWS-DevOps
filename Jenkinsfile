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
         stage ('Terraform Init') {
            steps {
                 sh """
                     cd environments/${params.ENVIRONMENT}
                     terraform init
                 """
            }
         }
          stage ('Terraform Plan') {
            steps {
                 sh """
                     cd environments/${params.ENVIRONMENT}
                     terraform paln -var-file="${params.ENVIRONMENT}.tfvars"
                 """
            }
         }
          stage ('Terraform Apply') {
            steps {
                 sh """
                     cd environments/${params.ENVIRONMENT}
                     terraform apply -var-file="${params.ENVIRONMENT}.tfvars"
                 """
            }
         }
     }
 }
