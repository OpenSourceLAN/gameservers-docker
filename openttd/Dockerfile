FROM base

RUN apt-get update && \
	apt-get install -y libsdl1.2debian \
	libfontconfig1 && \
	adduser openttd && \
	mkdir -p /openttd/extract && \
	chown -R openttd:openttd /openttd

USER openttd
WORKDIR /openttd

ADD download.sh .

RUN ./download.sh && \
	mkdir -p baseset/opengfx/ && \
	mkdir -p baseset/openmsx/ && \
	mkdir -p baseset/opensfx/ && \
	tar -xf openttd-*-linux-generic-amd64.tar.gz -C extract/ && \
	mv --no-clobber extract/openttd-*-linux-generic-amd64/* . && \
	unzip 'opengfx*.zip' -d extract/ && \
	tar -xf extract/opengfx-*.tar -C extract/ && \
	mv --no-clobber extract/opengfx-*/* baseset/opengfx/ && \
	unzip 'openmsx*.zip' -d extract/ && \
	mv --no-clobber extract/openmsx-*/* baseset/openmsx/ && \
	unzip 'opensfx*.zip' -d extract/ && \
	mv --no-clobber extract/opensfx-*/* baseset/opensfx/

ADD start.sh .

ENTRYPOINT ["./start.sh"]
