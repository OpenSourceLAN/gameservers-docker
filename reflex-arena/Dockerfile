# This may use wine or wine-src
FROM wine
USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir /steam/reflex
RUN ./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir ../reflex +app_update 329740 +quit

ADD start-*.sh /steam/reflex/

WORKDIR /steam/reflex
CMD ["/steam/reflex/start-reflex.sh"]
