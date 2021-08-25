FROM steamcmd

ENV GAME=scpsl
ENV APP_ID=996560

USER root
# ugly hack for HOME variable not being properly read in LocalAdmin
RUN mkdir "/SCP Secret Laboratory/" \
  && chmod a+rw "/SCP Secret Laboratory/"

RUN mkdir -p /steam/${GAME}/.cache/ \
  && touch /steam/${GAME}/.cache/empty
WORKDIR /steam/${GAME}/
COPY .cache .

RUN chown -R steam /steam/${GAME}/ \
  && mv .cache/* . \
  && rm -fr .cache

COPY *.txt \
start.sh \
./

USER steam

RUN /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir ../${GAME} +app_update ${APP_ID} +quit

ENTRYPOINT ["./start.sh"]
