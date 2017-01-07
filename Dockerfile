FROM ubuntu:14.04

#Autor
MAINTAINER Pablo Martin-Moreno Ruiz <pmmr1990@gmail.com>

#Add a wheel group with passwordless sudo
RUN groupadd wheel
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#Add user defesti to group wheel and login into it
RUN useradd -m -g wheel cineforyou
RUN su cineforyou
RUN cd ~

#Actualizar Sistema Base
RUN sudo apt-get -y update


# Instalar Python 
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip
RUN sudo pip install Django
RUN sudo apt-get -y install mongoDB
