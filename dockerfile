FROM openjdk:8-jdk
LABEL maintainer="500kg.ggwp@gmail.com" 

RUN useradd -u 1000 vladyslav
USER vladyslav
COPY --chown=vladyslav:vladyslav ./spring-petclinic/target ./target
WORKDIR /
EXPOSE 8080
ENTRYPOINT java -Dspring.profiles.active=mysql -jar target/*.jar
