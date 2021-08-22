FROM base

RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y libstdc++5:i386 \
  && apt-get clean \
  && mkdir ut2004

WORKDIR ut2004

ADD download.sh .
RUN ./download.sh

ADD start.sh .

CMD ["./start.sh"]
