FROM l4d2-metamod

WORKDIR /steam/l4d2/
USER steam
ADD download.sh .

RUN ./download.sh
RUN unzip l4dtoolz.zip -d /steam/l4d2/left4dead2/addons

ADD start-l4d2.sh .
ENTRYPOINT ["./start-l4d2.sh"]
