FROM csgo

WORKDIR /steam/csgo/
USER steam
ADD download.sh .
RUN ./download.sh

RUN tar -xf mm*.tar.gz -C csgo/
RUN tar -xf sourcemod*.tar.gz -C csgo/

ADD metamod.vdf csgo/

ADD https://warmod.bitbucket.io/plugins/warmod.smx csgo/addons/sourcemod/plugins/

ADD start-warmod.sh .
USER root
# I guess if you want to put config stuff in now is the time?
#ADD cfg csgo/cfg
RUN chown steam:steam csgo/addons/sourcemod/plugins/warmod.smx
RUN chown  -R steam:steam csgo/cfg/
USER steam
