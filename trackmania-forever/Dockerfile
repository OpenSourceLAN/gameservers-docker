FROM base

RUN apt-get install -y unzip && \
	adduser tm

WORKDIR /home/tm
RUN curl -o TrackmaniaServer_2011-02-21.zip http://files2.trackmaniaforever.com/TrackmaniaServer_2011-02-21.zip && \
	unzip *.zip

ADD tracklist*.cfg GameData/Tracks/
ADD dedicated_cfg.txt GameData/Config/
Add start_server.sh .

ENTRYPOINT ["./start_server.sh"]
