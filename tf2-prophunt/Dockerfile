# FROM tf2 so the right steam user exists and so the image dependency builder
# thing builds the right dependencies
FROM tf2 AS assets
USER root
# spcomp is 32 bit, requires this to run.
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y libstdc++6:i386
RUN mkdir /tf /build && chown -R steam /tf /build
USER steam
WORKDIR /tf

# Don't forget they're .tar.gzs, so docker will try and be too smart for its own damed good
ADD mmsource-*-linux.tar.gz /tf/
ADD sourcemod-*-linux.tar.gz /tf/
ADD dhooks-2.0.6-hg105-linux.tar.gz /tf/
ADD metamod.vdf /tf/

ADD sm_observerpoint.smx /tf/addons/sourcemod/plugins/

ADD tf2items-*-linux.zip /

ADD PHMapEssentialsBZ2.7z  /
RUN 7z x -o/tf/ /PHMapEssentialsBZ2.7z
RUN bash -c "cd maps/ && bunzip2 *.bz2"
RUN unzip -n /tf2items*.zip -d /tf/


WORKDIR /build
ADD prophunt-source.zip /

RUN unzip /prophunt-source.zip -d .  \
	&& mv /build/sourcemod-prophunt*/ /build/sourcemod-prophunt \
    && /tf/addons/sourcemod/scripting/spcomp /build/sourcemod-prophunt/addons/sourcemod/scripting/prophunt.sp \
    -i /build/sourcemod-prophunt/addons/sourcemod/scripting/include/ \
    && mkdir /build/sourcemod-prophunt/addons/sourcemod/plugins/ \
    && cp -R ./prophunt.smx \
    /build/sourcemod-prophunt/addons/sourcemod/scripting/include/ \
    /build/sourcemod-prophunt/addons/sourcemod/plugins/   \
    && cp -R /build/sourcemod-prophunt/* /tf/

FROM tf2
USER steam
# If you get an error on this step about chown or from being an invalid flag, upgrade docker
COPY --chown=steam:steam --from=assets /tf/ /steam/tf2/tf/
WORKDIR /steam/tf2/
ADD ph-maplist.txt /steam/tf2/tf/cfg/
ADD start*.sh ./
CMD ["./start-tf2-prophunt.sh"]
