FROM l4d2

WORKDIR /steam/l4d2/
USER steam
ADD download.sh .
RUN ./download.sh

RUN tar -xf mm*.tar.gz -C left4dead2/ && \
	tar -xf sourcemod*.tar.gz -C left4dead2/

ADD metamod.vdf left4dead2/

ADD start.sh .

ENTRYPOINT ["./start.sh"]
