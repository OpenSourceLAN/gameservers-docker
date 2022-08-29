FROM base

RUN apt-get update \
  && apt-get install -y libsdl1.2debian libfontconfig1 liblzo2-2 libfluidsynth2 libsdl2-2.0-0 \
  && adduser openttd \
  && mkdir -p /tmp \
  && chown -R openttd:openttd /tmp \
  && mkdir -p /home/openttd/.openttd/save \
  && chown -R openttd:openttd /home

WORKDIR /tmp

ARG DISTRO="focal"
ADD download.sh .
RUN ./download.sh

USER root
RUN dpkg -i *.deb \
  && mkdir -p /usr/share/games/openttd/baseset/opengfx/ \
  && unzip 'opengfx*.zip' \
  && ls -Chal \
  && tar -C /usr/share/games/openttd/baseset/opengfx/ -xf opengfx*.tar \
  && rm -fr *.zip *.tar *.deb

USER openttd

WORKDIR /usr/games

ADD start.sh .

VOLUME [ "/home/openttd/.openttd/save" ]

ENTRYPOINT ["./start.sh"]
