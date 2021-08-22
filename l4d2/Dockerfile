FROM steamcmd

# Dear srcds, plz don't crash. We have brought you these offerings.
USER root
RUN dpkg --add-architecture i386; apt-get update;  apt-get install -y libstdc++6:i386 libcurl4-gnutls-dev:i386

ENV GAME=l4d2
ENV APP_ID=222860

RUN mkdir -p /steam/${GAME}/.cache/ \
  && touch /steam/${GAME}/.cache/empty
WORKDIR /steam/${GAME}/
COPY .cache .

RUN chown -R steam /steam/${GAME}/ \
  && mv .cache/* . \
  && rm -fr .cache

COPY start.sh .

USER steam

RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir ../${GAME} +app_update ${APP_ID} +quit

ENTRYPOINT ["./start.sh"]
