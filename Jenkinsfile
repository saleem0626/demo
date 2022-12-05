pipeline{
    agent any
    environment {
        PATH = "$PATH:/opt/apache-maven-3.8.2/bin"
    }
    stages{
       stage('GetCode'){
            steps{
                git 'https://github.com/Patilgit/demo.git'
            }
         }        
       stage('Build'){
            steps{
                sh 'mvn clean install'
            }
         }
        stage('SonarQube analysis') {
        steps{
        withSonarQubeEnv('sonar') { 
           sh "mvn sonar:sonar"
    }
        }
        }
        stage('Docker Build'){
            steps{
                sh 'docker version'
                
                
            
            }
        }
    }
}
