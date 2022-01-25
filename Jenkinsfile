pipeline {
    agent any
    stages {
        stage('Setup parameters') {
            steps {
                script { 
                    properties([
                        parameters([
                            choice(
                                choices: ['Create', 'Destroy'], 
                                name: 'ACTION'
                            )
                        ])
                    ])
                }
            }
        }
        stage('Terraform Plan') {
            when {
                expression { 
                    return params.ACTION == 'Create'
                }
            }
            steps {
                sh 'terraform init -input=false'
                sh 'terraform plan -input=false'
            }
        }
        stage('Terraform Apply') {
            when {
                expression { 
                    return params.ACTION == 'Create'
                }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Kubectl Apply') {
            when {
                expression { 
                    return params.ACTION == 'Create'
                }
            }
            steps {
                sh 'aws eks update-kubeconfig --name liatrio-exercise-cluster'
                sh 'kubectl apply -f manifest.yaml'
            }
        }
        stage('Kubectl Delete') {
            when {
                expression { 
                    return params.ACTION == 'Destroy'
                }
            }
            steps {
                sh 'aws eks update-kubeconfig --name liatrio-exercise-cluster'
                sh 'kubectl delete -f manifest.yaml'
            }
        }
        stage('Terraform Init') {
            when {
                expression { 
                    return params.ACTION == 'Destroy'
                }
            }
            steps {
                sh 'terraform init -input=false'
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { 
                    return params.ACTION == 'Destroy'
                }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
