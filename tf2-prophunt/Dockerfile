FROM tf2
USER root

USER steam

WORKDIR /steam/tf2/

# Huge dep. Download every time or keep copy locally?
#ADD https://github.com/powerlord/sourcemod-prophunt/releases/download/maps/PHMapEssentialsBZ2.7z .
ADD PHMapEssentialsBZ2.7z  .

# Don't forget they're .tar.gzs, so docker will try and be too smart for its own damed good
ADD mmsource-*-linux.tar.gz /steam/tf2/tf/
ADD sourcemod-*-linux.tar.gz /steam/tf2/tf/
ADD tf2items-*-linux.zip /steam/tf2/
ADD sm_observerpoint.smx prophuntredux.zip  /steam/tf2/
ADD metamod.vdf tf/
RUN ls



USER root
RUN chown steam *
RUN chown -R steam tf/addons
RUN apt-get install -y bzip2 # Remove this next time we've built all images from scratch
USER steam

RUN unzip -n prophuntredux.zip -d tf/ 
RUN unzip -n tf2items*.zip -d tf/ 


RUN 7zr x -otf/ PHMapEssentialsBZ2.7z
ADD ph-maplist.txt /steam/tf2/tf/cfg/
WORKDIR tf/maps/
RUN bunzip2 *.bz2
WORKDIR /steam/tf2/

ADD start*.sh ./
CMD ./start-tf2-prophunt.sh