FROM l4d2-metamod

WORKDIR /steam/l4d2/
USER steam
ADD download.sh .
RUN ./download.sh

ADD start-l4d2.sh .
ENTRYPOINT ["./start-l4d2.sh"]
