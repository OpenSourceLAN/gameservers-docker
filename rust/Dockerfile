FROM steamcmd

USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/rust

RUN ./steamcmd.sh +login anonymous +force_install_dir ../rust +app_update 258550 +quit

WORKDIR /steam/rust/

ADD start*.sh /steam/rust/

CMD ["./start-rust.sh"]