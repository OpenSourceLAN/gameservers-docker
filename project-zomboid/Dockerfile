FROM steamcmd

# Dear srcds, plz don't crash. We have brought you these offerings.
USER root
RUN dpkg --add-architecture i386; apt-get update;  apt-get install -y libstdc++6:i386 libcurl4-gnutls-dev:i386

USER steam
RUN mkdir -p /steam/project-zomboid

WORKDIR /steam/steamcmd_linux
RUN ./steamcmd.sh +login anonymous +force_install_dir ../project-zomboid +app_update 380870 +quit

WORKDIR /steam/project-zomboid/
ADD start*.sh .

CMD ["./start-project-zomboid.sh"]
