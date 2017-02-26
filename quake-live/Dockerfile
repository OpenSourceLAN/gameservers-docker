FROM steamcmd

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/quake-live

RUN ./steamcmd.sh +login anonymous +force_install_dir ../quake-live +app_update 349090 +quit

WORKDIR /steam/quake-live/

ADD start*.sh /steam/quake-live/

CMD ["./start-quake-live.sh"]