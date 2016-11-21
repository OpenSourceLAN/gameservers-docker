FROM steamcmd

USER root


USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/csgo

RUN ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 740  +quit

ADD start.sh /steam/csgo/

WORKDIR /steam/csgo

CMD ["./start.sh"]