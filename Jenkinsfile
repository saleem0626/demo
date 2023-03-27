pipeline {
    agent any

    stages {
        stage('Gitcheckout') {
            steps {
                git branch: 'main', url: 'https://github.com/saleem0626/demo.git'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build and Push') {
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        	sh "docker build -t saleem ."
        	sh "docker tag saleem saleem4411/demo:latest"
        	sh "docker push saleem4411/demo:latest"
        
        }
      }
           }
	    stage('deploy')
	    steps{
		    sh "kubectl apply -f deployment_demo.yml"
	    }
    }
}
