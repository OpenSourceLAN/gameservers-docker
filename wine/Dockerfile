FROM steamcmd
USER root
RUN apt-get install -y software-properties-common apt-transport-https && dpkg --add-architecture i386 && wget https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
RUN apt-get update && apt-get install -y --install-recommends winehq-staging xvfb

