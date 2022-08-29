FROM steamcmd

# Dear srcds, plz don't crash. We have brought you these offerings.
USER root
RUN dpkg --add-architecture i386; apt-get update;  apt-get install -y libstdc++6:i386 libcurl4-gnutls-dev:i386

ENV GAME=l4d2
ENV APP_ID=222860

WORKDIR /steam/${GAME}/

RUN chown -R steam /steam/${GAME}/

USER steam

RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} +quit
ARG CACHE_DATE
RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} +quit

COPY update_server_details.sh .
COPY zip-utils.sh .

COPY server.cfg left4dead2/cfg/server.cfg

COPY start.sh .

USER root
RUN chown steam:steam left4dead2/cfg/server.cfg
USER steam

ENTRYPOINT ["./start.sh"]
