FROM csgo

WORKDIR /steam/csgo/
USER steam
ADD download.sh .
RUN ./download.sh

RUN tar -xf mm*.tar.gz -C csgo/ && \
	tar -xf sourcemod*.tar.gz -C csgo/ && \
	mv csgo/addons/sourcemod/plugins/disabled/mapchooser.smx csgo/addons/sourcemod/plugins/mapchooser.smx && \
	mv csgo/addons/sourcemod/plugins/disabled/nominations.smx csgo/addons/sourcemod/plugins/nominations.smx && \
	mv csgo/addons/sourcemod/plugins/disabled/randomcycle.smx csgo/addons/sourcemod/plugins/randomcycle.smx && \
	mv csgo/addons/sourcemod/plugins/disabled/rockthevote.smx csgo/addons/sourcemod/plugins/rockthevote.smx

ADD metamod.vdf csgo/

ADD start.sh .

ENTRYPOINT [ "./start.sh" ]
