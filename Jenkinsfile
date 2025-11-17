pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('JenkinsDockerHub')
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/DEV8428/java-mvn-springbootapp'
            }
        }

        stage('Build') {
            steps {
                echo "Building the job.."
                sh "mvn clean package"
            }
        }

        stage('Docker image & Deploy') {
            steps {
                sh """
                    docker build -t manisha417/java-mvn-springbootapp:v1.1 .
                    docker tag manisha417/java-mvn-springbootapp:v1.1 manisha417/springbootapp:latest
    
                """
            }
        }

       stage('container')  {  
    steps {
        sh 'docker run -d -p 8068:8080 --name springbootapp manisha417/springbootapp:latest'
    }
}


        stage('Login to DockerHub') {
            steps {
                   sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Publish-to-Docker-registry') {
            steps {
                sh "docker push manisha417/springbootapp:latest"
            }
        }

    } 
}
