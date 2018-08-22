FROM steamcmd

# Dear srcds, plz don't crash. We have brought you these offerings.
USER root
RUN dpkg --add-architecture i386; apt-get update;  apt-get install -y libstdc++6:i386 libcurl4-gnutls-dev:i386

USER steam
RUN mkdir -p /steam/l4d2

WORKDIR /steam/steamcmd_linux
RUN ./steamcmd.sh +login anonymous +force_install_dir ../l4d2 +app_update 222860 +quit

ARG CACHE_DATE
# do another update to catch updates since the original image was built
# need to run docker build --build-arg CACHE_DATE="$(date)"
RUN ./steamcmd.sh +login anonymous +force_install_dir ../l4d2 +app_update 222860 +quit

WORKDIR /steam/l4d2/
ADD start*.sh .

ENTRYPOINT ["./start-l4d2.sh"]
