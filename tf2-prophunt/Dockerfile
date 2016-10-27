FROM tf2
USER root

USER steam

WORKDIR /steam/tf2/

# Huge dep. Download every time or keep copy locally?
#ADD https://github.com/powerlord/sourcemod-prophunt/releases/download/maps/PHMapEssentialsBZ2.7z .
ADD PHMapEssentialsBZ2.7z  .


ADD start.sh /steam/tf2/
ADD download.sh .
RUN ./download.sh


RUN tar -xf mm*.tar.gz -C tf/
RUN tar -xf sourcemod*.tar.gz -C tf/

# One of these two URLs always returns modified, so it craps out Docker's caching mechanism :<

ADD https://forums.alliedmods.net/attachment.php?attachmentid=146505&d=1441898056 prophuntredux.zip
ADD http://www.sourcemod.net/vbcompiler.php?file_id=34433 tf/addons/sourcemod/plugins/sm_observerpoint.smx
ADD metamod.vdf tf/

USER root
RUN chown steam *
RUN chown -R steam tf/addons
USER steam

RUN unzip -n prophuntredux.zip -d tf/ 
RUN unzip -n tf2items*.zip -d tf/ 


RUN 7zr x -otf/ PHMapEssentialsBZ2.7z

WORKDIR tf/maps/
RUN bunzip2 *.bz2
