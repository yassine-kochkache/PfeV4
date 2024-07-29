pipeline {
    agent any
    
    environment {
        NODEJS_VERSION = 'nodejs-lts'
        COMPOSER_HOME = './.composer'
        SONARQUBE_ENV = 'laravel-react-survey-main'
    }
    
    tools {
        sonarQubeScanner 'SonarQube Scanner1'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/yassine-kochkache/PfeV4.git', branch: 'main'
            }
        }
        
       
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('laravel-react-survey-main') {
                    script {
                        sh 'sonar-scanner'
                    }
                }
            }
        }
        
      
        
       
    }
    
   
}
