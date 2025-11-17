FROM tomcat:jre25-temurin 
COPY target/*.war /usr/local/tomcat/webapps/ 
EXPOSE 8080 
