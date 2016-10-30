FROM ubuntu:16.04
RUN sed -i 's/archive.ubuntu.com/au.archive.ubuntu.com/' /etc/apt/sources.list
RUN apt-get update  && apt-get dist-upgrade -y &&\
	apt-get install -y unzip p7zip curl wget lib32gcc1 iproute2 vim-tiny
RUN echo "Australia/Melbourne" > /etc/timezone
RUN  ln -fs /usr/share/zoneinfo/Australia/Melbourne /etc/localtime

# add to base install: 
