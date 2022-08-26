FROM l4d2

USER root
RUN apt-get update;  apt-get install -y lib32gcc1 lib32stdc++6

WORKDIR /steam/l4d2/
USER steam

ENV LEFT4DEAD2_DIR "/steam/l4d2/left4dead2"
ENV ADDONS_DIR "${LEFT4DEAD2_DIR}/addons"
ENV SOURCEMOD_DIR "${ADDONS_DIR}/sourcemod"
ENV SOURCEMOD_EXTENSIONS_DIR "${SOURCEMOD_DIR}/extensions"
ENV SOURCEMOD_PLUGINS_DIR "${SOURCEMOD_DIR}/plugins"

RUN mkdir -p "${SOURCEMOD_EXTENSIONS_DIR}/"
RUN mkdir -p "${SOURCEMOD_PLUGINS_DIR}/"

COPY download.sh .
RUN ./download.sh

COPY metamod.vdf left4dead2/
COPY admins_simple.ini "${SOURCEMOD_DIR}/configs/admins_simple.ini"

RUN rm /steam/l4d2/left4dead2/addons/sourcemod/plugins/nextmap.smx

ENTRYPOINT ["./start.sh"]
