FROM steamcmd

ENV GAME=scpsl
ENV APP_ID=996560

RUN mkdir -p /steam/${GAME}/ \
  && chown steam /steam/${GAME}/

USER steam

WORKDIR /steam/${GAME}/

RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} +quit
ARG CACHE_DATE
RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/${GAME} +app_update ${APP_ID} +quit

ENV SERVER_PORT=7777
ENV GAME_DIR=/home/steam/.config/SCP\ Secret\ Laboratory
ENV INSTANCE_DIR=${GAME_DIR}/config/${SERVER_PORT}/
COPY *.txt "${INSTANCE_DIR}"

USER root

RUN chown -R steam:steam "${GAME_DIR}" \
  && chmod u+rw "${GAME_DIR}"

USER steam

COPY start.sh .
ENTRYPOINT ["./start.sh"]
