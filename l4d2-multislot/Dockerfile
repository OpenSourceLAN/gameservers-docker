FROM l4d2-metamod

WORKDIR /steam/l4d2/
USER steam

COPY download.sh .
RUN ./download.sh

COPY *.cfg "${LEFT4DEAD2_DIR}/cfg/sourcemod/"

COPY update_config.sh .

USER root
RUN chown -R steam:steam update_config.sh
USER steam

ENTRYPOINT ["/bin/bash", "-c", "./update_config.sh && ./start.sh"]
