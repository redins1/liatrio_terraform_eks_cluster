pipeline {
    agent any
    parameters { 
        choice(name: 'ACTION', choices: ['Create', 'Destroy'], description: 'Option what should happen via terraform') }
    
    if (${params.ACTION} == 'Create') {
        stages {
            stage('Plan') {
                steps {
                    sh 'terraform init -input=false'
                    sh 'terraform plan -input=false'
                }
            }

            stage('Apply') {
                steps {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    } else if (${params.ACTION} == 'Destroy') {
        stages {
            stage('Init') {
                steps {
                    sh 'terraform init -input=false'
                }
            }

            stage('Apply') {
                steps {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
