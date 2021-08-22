FROM l4d2-metamod

WORKDIR /steam/l4d2/
USER steam
ADD download.sh .

RUN ./download.sh
RUN mkdir -p /steam/l4d2/left4dead2/addons/sourcemod/extensions/
RUN unzip l4dtoolz.zip -d /steam/l4d2/left4dead2/addons \
  && unzip l4downtown.zip -d /steam/l4d2/left4dead2/addons/sourcemod/

ADD start.sh .
ENTRYPOINT ["./start.sh"]
