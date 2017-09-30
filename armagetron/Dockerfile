FROM base

RUN apt-get install -y libxml2 libxml2-dev
RUN apt-get install -y build-essential xml2

ADD armagetronad-*.src.tar.* /
ADD install.sh /install.sh
RUN /install.sh
ADD start-* /tron/

CMD ["/tron/start-ffa.sh"]
