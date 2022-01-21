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
        stage('Plan') {
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
        stage('Apply') {
            when {
                expression { 
                    return params.ACTION == 'Create'
                }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Init') {
            when {
                expression { 
                    return params.ACTION == 'Destroy'
                }
            }
            steps {
                sh 'terraform init -input=false'
            }
        }
        stage('Destroy') {
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
