# This Dockerfile helps us to setup the jenkins docker container 
Please follow the following commands to setup Jenkins docker container 
1. Git Clone 
   
   git clone https://github.com/KuruvaSomaSekhar/tomcat-docker.git --branch jenkins

2. change directory 
   
   cd tomcat-docker

3.Build docker image

docker build -t jenkins:v1 .

or

docker build --tag jenkins:v1 .

4. Check docker image

docker image --query reference=jenkins:v1

5. Run dokcer image

docker run  -it --rm -d -p 8080:8080 --name jenkins jenkins.:v1

6.Check container
  docker ps 

Open Jenkins with your public IP

Note: Before browsing it , you should open 8080 port in your security groups. 

    <publicIP>:8080/jenkins
  
  
