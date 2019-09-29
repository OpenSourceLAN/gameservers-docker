FROM steamcmd

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/mordhau

RUN ./steamcmd.sh +login anonymous +force_install_dir ../mordhau +app_update 629800 +quit
RUN ./steamcmd.sh +login anonymous +force_install_dir ../mordhau +app_update 629800 +quit
USER root
RUN apt-get update
RUN apt-get install -y libcurl3
USER steam

WORKDIR /steam/mordhau/

RUN chmod +x /steam/mordhau/Mordhau/Binaries/Linux/MordhauServer-Linux-Shipping
# Ensure that the server drops some first-run garbage
RUN timeout --preserve-status 15 ./MordhauServer.sh || true
ADD start.sh /steam/mordhau/
CMD ["./start.sh"]
