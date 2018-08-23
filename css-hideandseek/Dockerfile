FROM css-metamod

USER steam

WORKDIR /steam/css/cstrike

ADD download.sh .
RUN ./download.sh

RUN	unzip sm_hideandseek.zip
WORKDIR /steam/css

ADD start-css.sh .

ENTRYPOINT [ "./start-css.sh" ]
