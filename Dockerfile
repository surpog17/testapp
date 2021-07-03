FROM tomcat:latest
LABEL maintainer="surafel kifle"
ADD ./target/testapp-1.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
