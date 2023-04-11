job('Job1') {
    description('My first job')
    scm {
        github(ownerAndProject='prashhantss/simple-java-maven-app' , branch='master')
    }
    steps {
        maven {
            goals('package')
            mavenInstallation("maven")
                  }
        shell('java -jar target/*.jar')
            }
     publishers {
        archiveArtifacts('target/*.jar')
         archiveJunit('target/surefire-reports/*.xml')
        }
}
