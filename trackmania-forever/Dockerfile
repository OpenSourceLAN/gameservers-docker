FROM base

## Put Trackmania Server zip file in this directory
## Download from http://files2.trackmaniaforever.com/TrackmaniaServer_2011-02-21.zip

RUN apt-get install -y unzip
RUN adduser tm && mkdir /tm && chown tm:tm /tm
WORKDIR /tm
ADD *.zip /tm/
RUN ls /tm/
RUN unzip /tm/*.zip

ADD tracklist*.cfg /tm/GameData/Tracks/
ADD dedicated_cfg.txt /tm/GameData/Config/
Add start_server.sh /tm/

CMD ["/tm/start_server.sh"]