FROM css

WORKDIR /steam/css/
USER steam
ADD download.sh .
RUN ./download.sh

RUN tar -xf mm*.tar.gz -C cstrike/ && \
	tar -xf sourcemod*.tar.gz -C cstrike/ && \
	mv cstrike/addons/sourcemod/plugins/disabled/mapchooser.smx cstrike/addons/sourcemod/plugins/mapchooser.smx && \
	mv cstrike/addons/sourcemod/plugins/disabled/nominations.smx cstrike/addons/sourcemod/plugins/nominations.smx && \
	mv cstrike/addons/sourcemod/plugins/disabled/randomcycle.smx cstrike/addons/sourcemod/plugins/randomcycle.smx && \
	mv cstrike/addons/sourcemod/plugins/disabled/rockthevote.smx cstrike/addons/sourcemod/plugins/rockthevote.smx

ADD metamod.vdf cstrike/

ADD start-css.sh .
USER root
# I guess if you want to put config stuff in now is the time?
#ADD cfg csgo/cfg
RUN chown  -R steam:steam cstrike/cfg/
USER steam
