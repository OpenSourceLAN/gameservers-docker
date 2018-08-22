FROM steamcmd

# Dear srcds, plz don't crash. We have brought you these offerings.
USER root
RUN dpkg --add-architecture i386; apt-get update;  apt-get install -y libstdc++6:i386 libcurl4-gnutls-dev:i386

USER steam
RUN mkdir -p /steam/css

WORKDIR /steam/steamcmd_linux
RUN ./steamcmd.sh +login anonymous +force_install_dir ../css +app_update 232330 +quit

ARG CACHE_DATE
# do another update to catch updates since the original image was built
# need to run docker build --build-arg CACHE_DATE="$(date)"
RUN ./steamcmd.sh +login anonymous +force_install_dir ../css +app_update 232330 +quit

WORKDIR /steam/css/
ADD start*.sh .

CMD ["./start-css.sh"]
