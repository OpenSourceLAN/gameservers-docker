FROM steamcmd

# Dear srcds, plz don't crash. We have brought you these offerings.
USER root
RUN dpkg --add-architecture i386; apt-get update;  apt-get install -y libstdc++6:i386 libcurl4-gnutls-dev:i386

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/tf2

RUN ./steamcmd.sh +login anonymous +force_install_dir ../tf2 +app_update 232250  +quit

WORKDIR /steam/tf2/

ADD start*.sh .

CMD ["./start-tf2.sh"]
