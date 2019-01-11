FROM centos:7

RUN yum update -y && \
    yum install java-1.8.0 wget -y  

WORKDIR /usr/local

RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz && \
   tar -xvf apache-tomcat-9.0.14.tar.gz && \
   mv apache-tomcat-9.0.14 tomcat && \
   rm -rf  apache-tomcat-9.0.14.tar.gz

RUN echo "export CATALINA_HOME="/usr/local/tomcat"" >> ~/.bashrc && \
    source ~/.bashrc
#COPY jenkins.war tomcat/webapps/
ADD https://updates.jenkins-ci.org/download/war/2.156/jenkins.war tomcat/webapps
#CMD ["bash" , "tomcat/bin/startup.sh","&" ]
CMD ["tomcat/bin/catalina.sh", "run"]
