#!/bin/bash

# Application source code download and build
echo "**Application source code download and build**" | boxes -d stone -p a2v1
#git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package -DskipTests


# Docker image build
echo "**Docker image build**" | boxes -d stone -p a2v1
cd ..
docker build -t 20000903/spring-petclinic:devops-spring-petclinic .


echo "**Docker image build result**" | boxes -d stone -p a2v1

docker images | grep devops-spring-petclinic