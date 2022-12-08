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
        
         stage('Docker Build and Push') {
      steps {
      	withCredentials([usernamePassword(credentialsId: 'demo', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
             sh 'docker version'
               sh 'docker build -t demo .'
               sh 'docker tag demo darshan626/new-repo:latest'
          sh 'docker push darshan626/new-repo:latest'
        }
      }
                
            
            }
      }
    }
}
