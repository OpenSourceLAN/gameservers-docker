FROM steamcmd
USER root
RUN apt-get install -y software-properties-common && dpkg --add-architecture i386 && add-apt-repository ppa:wine/wine-builds && apt-get update && apt-get install -y --install-recommends winehq-staging xvfb
