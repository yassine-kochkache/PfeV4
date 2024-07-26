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
     
 stage("MAVEN BUILD") {
      steps {
       sh 'mvn clean install -Dmaven.test.skip=true'
      }
   }
          
        
    }
    
}