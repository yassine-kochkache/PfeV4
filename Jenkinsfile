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
        
        stage('Install Dependencies') {
            steps {
                script {
                    // Install PHP dependencies
                    sh 'composer install'
                    
                    // Install Node.js dependencies
                    dir('react') {
                        sh 'npm install'
                    }
                }
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
        
        stage('Build & Test') {
            parallel {
                stage('PHPUnit Tests') {
                    steps {
                        sh 'vendor/bin/phpunit'
                    }
                }
                
                stage('React Build') {
                    steps {
                        dir('react') {
                            sh 'npm run build'
                        }
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Add your deployment steps here
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}
