
# Config files taken from http://respawn.com.au/forums/index.php?showtopic=1087&st=0&p=16113&#entry16113

FROM base:latest

RUN  sed -i '/xenial main restricted$/s/$/ multiverse universe/g' /etc/apt/sources.list && apt-get update

RUN  apt-get -y install quake3-server

RUN adduser quake && mkdir /quake && chown -R quake:quake /quake

ADD CPMA* /quake
WORKDIR /quake
ADD baseq3/* compmaps.txt cpma.cfg /usr/share/games/quake3/baseq3/
RUN unzip /quake/*.zip -d /usr/share/games/quake3/

# We need to be able to update this config file at runtime
RUN touch /usr/share/games/quake3/baseq3/hostname.cfg && chown quake:quake /usr/share/games/quake3/baseq3/hostname.cfg
ADD start*.sh /quake/

USER quake

# exec relative to baseq3 directory
CMD ["./start-cpma.sh"]