FROM ubuntu:16.04
RUN apt-get update  && apt-get dist-upgrade -y &&\
	apt-get install -y unzip p7zip curl wget lib32gcc1
RUN echo "Australia/Melbourne" > /etc/timezone
RUN  ln -fs /usr/share/zoneinfo/Australia/Melbourne /etc/localtime

# add to base install: 