pipeline{
    agent any
   // hh
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
            sh 'def mavenpom = readmavenpom 'pom.xml''   
            sh 'docker version'
            sh 'docker build -t image-demo .'
            sh 'echo "${mavenpom.version}'  
                
                
            
            }
      }
    }
}
