FROM steamcmd
USER root
RUN apt-get install -y xvfb libglu1-mesa libxcursor1 libxrandr2

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/7daystodie

RUN ./steamcmd.sh +login anonymous +force_install_dir ../7daystodie +app_update 294420  +quit

ADD start.sh /steam/7daystodie/

WORKDIR /steam/7daystodie

CMD ["./start.sh"]