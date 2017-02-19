# This may use wine or wine-src
FROM wine
USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir /steam/conan
RUN ./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir ../conan +app_update 443030 +quit

ADD start-*.sh /steam/conan/
WORKDIR /steam/conan
RUN timeout --preserve-status 15 /opt/wine*/bin/wine64 ConanSandboxServer.exe -log || true
CMD ["/steam/conan/start-conan.sh"]
