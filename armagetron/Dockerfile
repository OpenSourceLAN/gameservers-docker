FROM ubuntu:14.04

RUN apt-get update 
RUN apt-get install -y curl  build-essential xml2  #libxml2 libxml2-dev
RUN apt-get install -y libxml2 libxml2-dev

ADD install.sh /install.sh

RUN /install.sh


CMD armagetronad-dedicated --configdir /tron/server/config --vardir /tron/server/var
