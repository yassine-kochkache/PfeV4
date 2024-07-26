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
                        sh '''
                        EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
                        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
                        ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
                        if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then
                            >&2 echo 'ERROR: Invalid installer signature'
                            rm composer-setup.php
                            exit 1
                        fi
                        php composer-setup.php --install-dir=/usr/local/bin --filename=composer
                        rm composer-setup.php
                        composer --version
                        composer install
                        php artisan migrate
                        php artisan db:seed
                        '''
                    }
                }
            }
        }
          
        
    }
    
}