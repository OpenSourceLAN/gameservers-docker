FROM base

RUN adduser unreal && mkdir /unreal && chown unreal:unreal /unreal
USER unreal
WORKDIR /unreal
ADD UnrealTournament-Server*.zip /unreal
RUN unzip /unreal/UnrealTournament-Server*.zip
ADD start.sh /unreal
# Run the server once so it does the first start stuff then crashes
RUN ./start.sh

#TODO: add config in here, including the bFirstRun=false thing
