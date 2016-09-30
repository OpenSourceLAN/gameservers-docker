FROM csgo

WORKDIR /steam/csgo/
USER root
RUN apt-get install -y curl 
USER steam
ADD download.sh .
RUN ./download.sh

RUN tar -xf mm*.tar.gz -C csgo/
RUN tar -xf sourcemod*.tar.gz -C csgo/

ADD metamod.vdf csgo/

ADD http://warmod.bitbucket.org/plugins/warmod.smx csgo/addons/sourcemod/plugins/

ADD start.sh .
USER root
ADD cfg csgo/cfg
RUN chown steam:steam csgo/addons/sourcemod/plugins/warmod.smx
RUN chown  -R steam:steam csgo/cfg/
USER steam
