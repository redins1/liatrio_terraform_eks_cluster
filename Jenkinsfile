pipeline {
    agent any
    if (env.Action.equals("Create")) {
        stages {
            stage('Plan') {
                steps {
                    sh 'terraform init -input=false'
                    sh "terraform plan -input=false"
                }
            }

            stage('Apply') {
                steps {
                    sh "terraform apply -auto-approve"
                }
            }
        }
    } else if (env.Action.equals("Destroy")) {
        stages {
            stage('Init') {
                steps {
                    sh 'terraform init -input=false'
                }
            }

            stage('Apply') {
                steps {
                    sh "terraform destroy -auto-approve"
                }
            }
        }
    }
}
