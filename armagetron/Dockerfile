FROM base

RUN apt-get install -y libxml2 libxml2-dev
RUN apt-get install -y build-essential xml2

ADD install.sh /install.sh

RUN /install.sh


CMD ["armagetronad-dedicated", "--configdir", "/tron/server/config", "--vardir", "/tron/server/var"]
