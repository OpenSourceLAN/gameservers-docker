FROM scpsl

ADD download.sh .

RUN ./download.sh

USER root

ENV CONFIG_DIR '/home/steam/.config/'

RUN tar -xzvf Exiled.tar.gz \
  && mv Assembly-CSharp.dll SCPSL_Data/Managed/ \
  && mv EXILED "${CONFIG_DIR}" \
  && mv *.dll "${CONFIG_DIR}/EXILED/Plugins/" || exit 0 \
  && chown -R steam:steam "${CONFIG_DIR}" \
  && chmod u+rw "${CONFIG_DIR}"

RUN rm -f *.tar.gz

USER steam

ADD config.yml "${CONFIG_DIR}/EXILED/Configs/${SERVER_PORT}-config.yml"

ENTRYPOINT ["./start.sh"]
