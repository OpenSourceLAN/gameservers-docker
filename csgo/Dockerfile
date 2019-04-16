FROM steamcmd

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/csgo \
  && ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 740 +quit

ARG CACHE_DATE
# do another update to catch updates since the original image was built
# need to run docker build --build-arg CACHE_DATE="$(date)"
RUN ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 740 +quit

ADD start.sh /steam/csgo/

WORKDIR /steam/csgo

CMD ["./start.sh"]
