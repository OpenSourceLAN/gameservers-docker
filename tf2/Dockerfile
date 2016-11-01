FROM steamcmd


USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/tf2

RUN ./steamcmd.sh +login anonymous +force_install_dir ../tf2 +app_update 232250  +quit

WORKDIR /steam/tf2/

ADD start*.sh .

CMD ./start-tf2.sh