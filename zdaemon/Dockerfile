FROM base

RUN dpkg --add-architecture i386 &&  apt-get update && apt-get install -y libc6-i386 libstdc++6:i386

ADD zserv*linux26.tgz /
RUN mkdir /zdaemon && mv /zserv*/* /zdaemon/ && chmod +x /zdaemon/zserv
WORKDIR /zdaemon

ADD wads/* /zdaemon/
ADD start-* ffa-template.cfg /zdaemon/

CMD ["./start-ffa.sh"]

