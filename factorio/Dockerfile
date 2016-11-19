FROM base


RUN adduser factorio 
ADD factorio_headless*.tar.gz /
RUN chown -R factorio:factorio /factorio
WORKDIR /factorio
ADD start-*.sh /factorio/
