FROM ubuntu:16.04
ARG TZ="Etc/UTC"
RUN sed -i 's/archive.ubuntu.com/au.archive.ubuntu.com/' /etc/apt/sources.list
RUN apt-get update  && apt-get dist-upgrade -y &&\
	apt-get install -y unzip p7zip-full curl wget lib32gcc1 iproute2 vim-tiny bzip2 jq software-properties-common apt-transport-https lib32stdc++6 && \
	apt-get clean
RUN echo "$TZ" > /etc/timezone
RUN  ln -fs /usr/share/zoneinfo/$TZ /etc/localtime

# add to base install: 
