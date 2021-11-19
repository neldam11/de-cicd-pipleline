FROM tomcat:8.0-alpine
#FROM openjdk:16-alpine3.13 
#webapps directory is in Tomcat directory. Tomcat can be found in base image specs
#COPY /home/ubuntu/workspace/app-engine-deployment/target/*.jar usr/local/tomcat/webapps/
COPY ./target/*.jar /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
