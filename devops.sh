#!/bin/bash

PATH_TO_DIR=spring-petclinic/
BOXES=$"boxes -d stone -p a2v1"
DOCKER_TAG=devops-spring-petclinic
DOCKER_MAINTAINER=20000903

if [ -d $PATH_TO_DIR ] 
then
    echo "Directory $PATH_TO_DIR exists... Deleting" | $BOXES
    rm -rf $PATH_TO_DIR
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
docker build -t $DOCKER_MAINTAINER/spring-petclinic:$DOCKER_TAG .

#Docker image build result 
echo "Results for tag - $DOCKER_TAG is below" | $BOXES
docker images | grep $DOCKER_TAG

echo "Push Docker image to the DockerHub" | $BOXES

docker push $DOCKER_MAINTAINER/spring-petclinic:$DOCKER_TAG

echo "Docker image is successfuly pushed to Hub !!!" | $BOXES