
# Config files taken from http://respawn.com.au/forums/index.php?showtopic=1087&st=0&p=16113&#entry16113

FROM base:latest


RUN adduser quake && mkdir /quake && chown -R quake:quake /quake
WORKDIR /quake
USER quake

RUN wget https://files.ioquake3.org/Linux.zip && unzip Linux.zip && unzip release-linux-x86_64.zip && rm Linux.zip release-linux*.zip

# ADD CPMA* /quake
ADD baseq3/ /quake/baseq3 
 # compmaps.txt cpma.cfg /usr/share/games/quake3/baseq3/
#RUN unzip /quake/*.zip -d /usr/share/games/quake3/

# We need to be able to update this config file at runtime
#RUN touch /usr/share/games/quake3/baseq3/hostname.cfg && chown quake:quake /usr/share/games/quake3/baseq3/hostname.cfg
ADD start*.sh /quake/


# exec relative to baseq3 directory
CMD ["./start-ffa.sh"]
