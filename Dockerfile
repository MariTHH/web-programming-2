FROM tomcat:10.1.1
LABEL maintainer="satheeskumar.pmp@gmail.com"

ADD target/web2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]