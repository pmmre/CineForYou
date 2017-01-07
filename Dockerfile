FROM ubuntu:latest

#Autor
MAINTAINER Pablo Martin-Moreno Ruiz <pmmr1990@gmail.com>

#Actualizar Sistema Base
RUN apt-get -y update


# Instalar Python 
RUN apt-get install -y python-setuptools
RUN apt-get -y install python-dev
RUN apt-get -y install build-essential
RUN apt-get -y install python-psycopg2
RUN apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN pip install --upgrade pip
RUN pip install Django
RUN apt-get -y install mongoDB
