FROM steamcmd

USER root

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/insurgency2

RUN ./steamcmd.sh +login anonymous +force_install_dir ../insurgency2 +app_update 237410 +quit

ARG CACHE_DATE
# do another update to catch updates since the original image was built
# need to run docker build --build-arg CACHE_DATE="$(date)"
RUN ./steamcmd.sh +login anonymous +force_install_dir ../insurgency2 +app_update 237410 +quit

ADD start_insurgency.sh /steam/insurgency2/

WORKDIR /steam/insurgency2

ENTRYPOINT ["./start_insurgency.sh"]
