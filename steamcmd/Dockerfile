FROM base

RUN useradd -m steam

RUN mkdir -p /steam/steamcmd_linux

RUN chown -R steam /steam
USER steam


WORKDIR /steam/steamcmd_linux
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz 
RUN tar -xf steamcmd_linux.tar.gz


RUN ./steamcmd.sh +login anonymous +quit


