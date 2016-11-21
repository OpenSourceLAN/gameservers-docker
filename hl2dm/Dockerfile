FROM steamcmd

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/hl2dm

RUN ./steamcmd.sh +login anonymous +force_install_dir ../hl2dm +app_update 232370 +quit

WORKDIR /steam/hl2dm/

ADD start.sh /steam/hl2dm/

CMD ["./start.sh"]