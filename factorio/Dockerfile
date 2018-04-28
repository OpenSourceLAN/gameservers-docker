FROM base


RUN adduser factorio 
ADD factorio_headless*.tar.* /
RUN mkdir -p /factorio/saves && chown -R factorio:factorio /factorio
RUN chown -R factorio:factorio /factorio
WORKDIR /factorio
ADD start-*.sh /factorio/
USER factorio
CMD ["/factorio/start-factorio.sh"]
