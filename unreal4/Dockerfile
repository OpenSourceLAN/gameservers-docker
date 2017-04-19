FROM base

RUN adduser unreal && mkdir /unreal && chown unreal:unreal /unreal
USER unreal
WORKDIR /unreal
ADD UnrealTournament-Server*.zip /unreal
RUN unzip /unreal/UnrealTournament-Server*.zip
ADD start*.sh /unreal

# Run the server once so it does the first start stuff then crashes
RUN ./start-unreal4.sh  || exit 0

ADD deathmatch.sh instagib.sh /unreal/
ADD Game.ini /unreal/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/
ADD Engine.ini /unreal/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/


RUN chown -R unreal:unreal  .

#TODO: add config in here, including the bFirstRun=false thing

CMD ["./start-unreal4.sh"]
