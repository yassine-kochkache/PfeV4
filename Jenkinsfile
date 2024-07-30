pipeline {
agent any
    

    environment {
                PATH = "${env.PATH}:/home/vagrant/sonar-scanner-cli/sonar-scanner-4.6.2.2472-linux/bin"

       
        NODEJS_VERSION = 'nodejs-lts' // Define NodeJS version
        COMPOSER_HOME = './.composer' // Define Composer home directory
        SONARQUBE_ENV = 'laravel-react-survey-main'
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
        
  stage('Prepare SonarQube') {
            steps {
                script {
                    // Change ownership and permissions without requiring password
                    sh 'sudo chown -R jenkins:jenkins /home/vagrant/sonar-scanner-cli'
                    sh 'sudo chmod -R 755 /home/vagrant/sonar-scanner-cli'
                }
            }
        }

       stage('SonarQube Analysis') {
    steps {
        withSonarQubeEnv('laravel-react-survey-main') { // Nom de votre configuration SonarQube
            sh '''
                sonar-scanner \
                    -Dsonar.projectKey=sonartesttest \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://192.168.56.2:9000 \
                    -Dsonar.login=sqp_c20fdc4389adf1a4c90e75b11188887d7b0daab8
                    
            '''
        }
    }
}

          
        
    }
    
}