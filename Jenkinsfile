pipeline {
    agent {
        label 'slave-1'
    }
    
    tools {
      maven 'MAVEN3'
      jdk 'JAVA8'
      dockerTool 'Docker'
    }
    
    stages {
        stage ('Code Checkout..') {
            steps {
                echo 'Code checkout...'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/neldam11/de-cicd-pipleline.git']]])
            }
        }
        
        stage ('Package Artifact') {
            steps {
                echo 'Package'
                sh "echo $USER > /home/ubuntu/usr-tmp"
                sh "mvn -B -DskipTests clean package"
                
            }
        }
        
        stage ('Build Image') {
            steps {
                echo 'Build Docker Image'
                sh "docker image build -t customwebapp:1.0.0 ."
            }
        }
        
        stage ('Archive Artifacts') {
            steps {
                echo 'Push Image to GCR'
                sh "docker tag customwebapp:1.0.0 gcr.io/devops-labs-nd/customwebapp:1.0.0"
                sh "docker push gcr.io/devops-labs-nd/customwebapp:1.0.0"
            }
        }
        
        stage ('Deploy to Google App Engine') {
            steps {
                echo 'Deploy to Google App Engine'
                sh "gcloud app deploy app.yaml"
            }
        }
    
    }
    
}
