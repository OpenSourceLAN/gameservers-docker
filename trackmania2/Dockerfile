FROM base


RUN apt-get install -y unzip
RUN adduser tm && mkdir /tm && chown tm:tm /tm
WORKDIR /tm
ADD *.zip /tm/
RUN ls /tm/
RUN unzip /tm/*.zip

# TODO: create default tracklists etcc
#ADD tracklist.cfg /tm/GameData/Tracks/
#ADD dedicated_cfg.txt /tm/GameData/Config/

Add start_*.sh /tm/

CMD ["/tm/start_tm2_canyon.sh"]
