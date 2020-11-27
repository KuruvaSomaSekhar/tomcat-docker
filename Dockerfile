FROM centos:7

RUN yum update -y && \
    yum install -y java-1.8.0 java-devel wget

#RUN java --version

WORKDIR /usr/local


RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.40/src/apache-tomcat-9.0.40-src.tar.gz && \
    tar -xvf apache-tomcat-9.0.40-src.tar.gz && \
        mv apache-tomcat-9.0.40-src tomcat && \
        rm -rf  apache-tomcat-9.0.40-src.tar.gz

RUN echo "export CATALINA_HOME="/usr/local/tomcat"" >> ~/.bashrc && \
    source ~/.bashrc
EXPOSE 8080
CMD ["tomcat/bin/catalina.sh", "run"]
