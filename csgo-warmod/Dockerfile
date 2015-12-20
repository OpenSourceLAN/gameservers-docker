FROM steamcmd

USER root

RUN apt-get install  -y curl 

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/csgo

RUN ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 740  +quit

WORKDIR /steam/csgo/

ADD start.sh .
ADD download.sh .
RUN ./download.sh

RUN tar -xf mm*.tar.gz -C csgo/
RUN tar -xf sourcemod*.tar.gz -C csgo/

ADD metamod.vdf csgo/

ADD http://warmod.bitbucket.org/plugins/warmod.smx csgo/addons/sourcemod/plugins/

