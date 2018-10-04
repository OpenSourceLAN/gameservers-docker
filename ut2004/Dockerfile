FROM base


RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y libstdc++5:i386 && apt-get clean



ADD server_files /ut2004
ADD start-* /ut2004/

CMD ["/ut2004/start-ut2004.sh"]
# 