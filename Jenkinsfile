pipeline{
    agent any
   // hh
    stages{
       stage('GetCode'){
            steps{
                git branch: 'main', credentialsId: '40f7a21f-6ce7-4bc0-b115-4a85ab05b062', url: 'https://github.com/Patilgit/demo.git'
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
        
     
      stage('Ansible Deploy') {
             
           steps {
                 
             
               
             ansiblePlaybook credentialsId: 'tomcat', installation: 'ansible', inventory: 'inventories/dev', playbook: 'main.yml'

               
            
            }
        }
      }
    }

