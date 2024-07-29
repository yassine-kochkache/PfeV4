pipeline {
agent any
    

    environment {
       
        NODEJS_VERSION = 'nodejs-lts' // Define NodeJS version
        COMPOSER_HOME = './.composer' // Define Composer home directory
    }

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
     
   
          
        
    }
    
}