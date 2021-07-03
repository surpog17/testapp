pipeline {
    agent any
 
   tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'https://github.com/surpog17/testapp.git'
             
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push surafel17/testapp:latest'
        //  sh  'docker push surafel17/testapp:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "docker run -d -p 8003:8080 surafel17/testapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://surafel@172.16.50.180 run -d -p 8003:8080 surafel17/testapp"
 
            }
        }
    }
 }
