pipeline {
    agent any
    
    stages{
       stage('GetCode'){
            steps{
                git branch: 'main', credentialsId: '40f7a21f-6ce7-4bc0-b115-4a85ab05b062', url: 'https://github.com/Patilgit/demo.git'
            }
         }        
       stage('Build'){
            steps{
                sh 'mvn install'
            }
        }
        
        stage('SonarQube analysis') {
            steps{
                withSonarQubeEnv('sonar') { 
                 sh "mvn clean package sonar:sonar"
                }
            }
       }
       stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
                // in manage jenkins > configure systems > sonarqube servers > Url should not end with / it must be http//ip:9000
              }
            }
          }
stage ('Package'){
            steps {
                sh 'mvn package'
             }
        }
	stage ('Server'){
            steps {
               rtServer (
                 id: "jfrog",
                 url: 'http://13.126.218.81:8081/artifactory',
                 username: 'darsh',
                  password: 'Darshan4',
                  bypassProxy: true,
                   timeout: 300
                        )
            }
        }
        stage('Upload'){
            steps{
                rtUpload (
                 serverId:"jfrog" ,
                  spec: '''{
                   "files": [
                      {
                      "pattern": "*.war",
                      "target": "libs-snapshot/"
                      }
                            ]
                           }''',
                        )
            }
        }
        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "jfrog"
                )
            }
        }
     
      stage('Ansible Deploy') {
             
           steps {
                 sh 'ansible-playbook playbook.yml'
            }
        }
      }
    }

