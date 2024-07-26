pipeline {
agent any
    


    stages {
         stage('Checkout') {
            steps {
                git url: "https://github.com/yassine-kochkache/PfeV4.git", branch: 'main'
            }
        }
       
        
               stage("GIT") {
     steps {
       sh 'git checkout main'
       sh 'git pull origin main'
      }
    }
     
  stage('Build Backend') {
            steps {
                script {
                    docker.image('php:8.0-cli').inside {
                        sh 'composer install'
                        sh 'php artisan migrate'
                        sh 'php artisan db:seed'
                    }
                }
            }
        }
          
        
    }
    
}