node {
    stage('SCM') {
        checkout scm
    }
    stage('SonarQube Analysis'){
        def mvn = tool 'maven';
        withSonarQubeEnv{
            sh "${mvn}/bin/mvn clean verify sonar:sonar --Dsonar.projectKey=17646A1 -Dsonar.login=sqp_916093cad412ceca7e500afe3e271dcc3fec928e"
        }
    }
    stage('Build JAR'){
        def mvn = tool 'maven'
        sh "${mvn}/bin/mvn package"
    }
    stage('Run Project'){
        // Run project
        sh "java -jar -Dserver.port=50001 target/spring-petclinic-3.0.0-SNAPSHOT.jar"

        // Wait for 5 minutes
        sh "sleep 300"
        
        // Send a termination signal to the Java process
        sh "killall java"
    }
}