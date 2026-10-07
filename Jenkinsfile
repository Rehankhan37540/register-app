pipeline {

    agent {
        label 'Jenkins-Agent'
    }

    tools {
        jdk 'Java21'
        maven 'Maven3'
    }

    stages {

        stage("Cleanup Workspace") {
            steps {
                cleanWs()
            }
        }

        stage("Checkout from SCM") {
            steps {
                git branch: 'main',
                    credentialsId: 'github',
                    url: 'https://github.com/Rehankhan37540/register-app'
            }
        }

        stage("Build Application") {
            steps {
                sh "mvn clean package"
            }
        }
                  stage("SonarQube Analysis") {
                steps {
                  script {
                       withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
                      sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:sonar"
                     }
                  }
                }
             }
          }
       }
