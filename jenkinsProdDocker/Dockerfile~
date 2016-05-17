# Pull base image.
FROM jenkins:latest

# use the super user (roo)
USER root

RUN apt-get update &&\
   apt-get install curl

RUN curl -sSL https://get.docker.com/ | sh

ENV DOCKER_HOST=tcp://dindProdContainer:2375
