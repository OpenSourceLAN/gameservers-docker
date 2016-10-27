FROM csgo

RUN ./steamcmd.sh +login anonymous +force_install_dir ../csgo +app_update 740  +quit

