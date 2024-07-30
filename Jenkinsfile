pipeline {
agent any
    

    environment {
                PATH = "${env.PATH}:/home/vagrant/sonar-scanner-cli/sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner"

       
        NODEJS_VERSION = 'nodejs-lts' // Define NodeJS version
        COMPOSER_HOME = './.composer' // Define Composer home directory
        SONARQUBE_ENV = 'rsjp'
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
    stage('Build Laravel') {
            steps {
                    script {
                        sh 'composer install'
                        // Additional build steps if needed
                    
                }
            }
        }
   
    stage('Build React') {
            steps {
                dir('react') {
                    script {
                        sh 'npm install'
                    }
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('rsjp') {
                    script {
                        sh 'sonar-scanner'
                    }
                }
            }
        }
         
          
        
    }
    
}