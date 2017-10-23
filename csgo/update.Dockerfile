FROM csgo


USER steam
WORKDIR /steam/steamcmd_linux

RUN ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 740  +quit

WORKDIR /steam/csgo

CMD ["./start.sh"]
