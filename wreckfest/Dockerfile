FROM wine

USER steam
ENV DISPLAY :99

WORKDIR /home/steam
RUN winecfg

WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/wreckfest

RUN ./steamcmd.sh +force_install_dir ../wreckfest +login anonymous +@sSteamCmdForcePlatformType windows +app_update 361580  +quit

WORKDIR /steam/wreckfest
ADD start*.sh /steam/wreckfest/
CMD ["./start-wreckfest.sh"]