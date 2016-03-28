FROM steamcmd

USER root


USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/csgo

RUN ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 740  +quit

ADD start.sh .
USER root
ADD cfg csgo/cfg
RUN chown  -R steam:steam csgo/cfg/
USER steam
