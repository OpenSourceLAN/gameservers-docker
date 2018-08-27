FROM base

RUN apt-get install -y unzip && \
	adduser tm && \
	mkdir /tm && \
	chown tm:tm /tm

USER tm
WORKDIR /tm
RUN curl -o TrackmaniaServer_2011-02-21.zip http://files2.trackmaniaforever.com/TrackmaniaServer_2011-02-21.zip && \
	unzip *.zip

ADD tracklist*.cfg GameData/Tracks/
ADD dedicated_cfg.txt GameData/Config/

Add start.sh .

ENTRYPOINT ["./start.sh"]
