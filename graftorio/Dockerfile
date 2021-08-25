FROM factorio
USER factorio
ADD --chown=factorio:factorio https://github.com/afex/graftorio/releases/download/v0.0.7/graftorio_0.0.7.zip /
RUN mkdir /factorio/mods && chown -R factorio:factorio /factorio/mods && unzip /graftorio_0.0.7.zip -d /factorio/mods 
ADD --chown=factorio:factorio contest.tar.gz /factorio/scenarios/
ADD start-graftorio.sh /factorio/start-graftorio.sh
CMD /factorio/start-graftorio.sh
