#!/bin/bash

PATH_TO_DIR=spring-petclinic/
BOXES=$"boxes -d stone -p a2v1"

if [ -d $PATH_TO_DIR ] 
then
    echo "Directory $PATH_TO_DIR exists... Deleting" | $BOXES
    rm -rf spring-petclinic/
else
    echo "Error: Directory $PATH_TO_DIR does not exists." | $BOXES
fi



# Download the Spring-Petclinic and build it
echo "Download the Spring-Petclinic and build it" | $BOXES
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package -DskipTests


# Docker image build
echo "Docker image build" | $BOXES
cd ..
docker build -t 20000903/spring-petclinic:devops-spring-petclinic .

#Docker image build result 
echo "Docker images result" | $BOXES
docker images | grep devops-spring-petclinic