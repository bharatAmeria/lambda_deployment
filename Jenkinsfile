// @Library("shared") _
pipeline {
    agent any  // Run on any available agent

    environment {
        VENV_DIR = "pred"  // Define virtual environment path
    }

    triggers {
        pollSCM('* * * * *')  // Polls the repo every minute for changes
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/bharatAmeria/lambda_deployment.git'
            }
        }

        // stage('hello') {
        //     steps{
        //         scripts {
        //             hello()
        //         }
        //     }
        // }

        stage('Setup Environment') {
            steps {
                sh 'python3 -m venv $VENV_DIR'
                sh './tracker/bin/pip install -r requirements.txt'
            }
        }

        stage('Test Environment') {
            steps {
                sh './tracker/bin/python testEnvironment.py'
            }
        }

        stage('Data Ingestion') {
            steps {
                sh './tracker/bin/python src/pipeline/stage01_data_ingestion.py'
            }
        }

        stage('Data Pre Processing') {
            steps {
                sh './tracker/bin/python src/pipeline/stage02_data_processing.py'
            }
        }

        stage('Model Training') {
            steps {
                sh './tracker/bin/python src/pipeline/stage03_model_training.py'
            }
        }

        stage('Model Prediction') {
            steps {
                sh './tracker/bin/python app/app.py'
            }
        }

        // stage('Docker Build') {
        //     steps {
        //         sh 'docker build -t lambda-app:latest .'
        //     }
        // }

        // stage('Push Image DockerHub') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId:'Dockerhub', passwordVariable:'', usernamevariable:'')]){
        //         sh 'docker login -u ${env.docekrHubUser} -p ${env.dockerhubPass} ' 
        //         sh 'docker image tag lambda-app:latest  bharat/lambda-app:latest'
        //         sh 'docker push ${env.docekrHubUser}/lambda-app:latest' }
        //     }
        // }

        // stage('Deploy Image') {
        //     steps {
        //         sh 'docker run -d -p 5000:5000 lambda-app:latest'
        //     }
        // }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Check logs.'
        }
    }
}
