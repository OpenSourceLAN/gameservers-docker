FROM steamcmd
USER root

RUN apt-get update
RUN apt-get install -y build-essential flex bison libx11-dev libfreetype6-dev xvfb

ADD wine-*.tar.bz2 /root/
WORKDIR /root/wine-2.0/

RUN ./configure --enable-win64 --prefix=/opt/wine-2.0 && make -j $(cat /proc/cpuinfo  | grep processor | wc -l) &&  make install && make clean

# --without-freetype ?

# These are the warnings spat out when compiled. This is just a note to self in case
# there are random errors with conan, and one of these is a missing dependency

# configure: libxcursor 64-bit development files not found, the Xcursor extension won't be supported.
# configure: libxi 64-bit development files not found, the Xinput extension won't be supported.
# configure: XShm 64-bit development files not found, X Shared Memory won't be supported.
# configure: XShape 64-bit development files not found, XShape won't be supported.
# configure: libXxf86vm 64-bit development files not found, XFree86 Vidmode won't be supported.
# configure: libxrandr 64-bit development files not found, XRandr won't be supported.
# configure: libxinerama 64-bit development files not found, multi-monitor setups won't be supported.
# configure: libxcomposite 64-bit development files not found, Xcomposite won't be supported.
# configure: libGLU 64-bit development files not found, GLU won't be supported.
# configure: libOSMesa 64-bit development files not found (or too old), OpenGL rendering in bitmaps won't be supported.
# configure: OpenCL 64-bit development files not found, OpenCL won't be supported.
# configure: pcap 64-bit development files not found, wpcap won't be supported.
# configure: libdbus 64-bit development files not found, no dynamic device support.
# configure: lib(n)curses 64-bit development files not found, curses won't be supported.
# configure: libsane 64-bit development files not found, scanners won't be supported.
# configure: libv4l 64-bit development files not found.
# configure: libgphoto2 64-bit development files not found, digital cameras won't be supported.
# configure: libgphoto2_port 64-bit development files not found, digital cameras won't be auto-detected.
# configure: liblcms2 64-bit development files not found, Color Management won't be supported.
# configure: libpulse 64-bit development files not found or too old, Pulse won't be supported.
# configure: gstreamer-1.0 base plugins 64-bit development files not found, gstreamer support disabled
# configure: OSS sound system found but too old (OSSv4 needed), OSS won't be supported.
# configure: libudev 64-bit development files not found, plug and play won't be supported.
# configure: libcapi20 64-bit development files not found, ISDN won't be supported.
# configure: libcups 64-bit development files not found, CUPS won't be supported.
# configure: fontconfig 64-bit development files not found, fontconfig won't be supported.
# configure: libgsm 64-bit development files not found, gsm 06.10 codec won't be supported.
# configure: libtiff 64-bit development files not found, TIFF won't be supported.
# configure: libmpg123 64-bit development files not found (or too old), mp3 codec won't be supported.
# configure: libopenal 64-bit development files not found (or too old), OpenAL won't be supported
# configure: openal-soft 64-bit development files not found (or too old), XAudio2 won't be supported
# configure: libldap (OpenLDAP) 64-bit development files not found, LDAP won't be supported.
# 
# configure: WARNING: gettext tools not found (or too old), translations won't be built.
# 
# configure: WARNING: libxrender 64-bit development files not found, XRender won't be supported.
# 
# configure: WARNING: No OpenGL library found on this system.
# OpenGL and Direct3D won't be supported.
# 
# configure: WARNING: libxml2 64-bit development files not found (or too old), XML won't be supported.
# 
# configure: WARNING: libxslt 64-bit development files not found, xslt won't be supported.
# 
# configure: WARNING: libgnutls 64-bit development files not found, no schannel support.
# 
# configure: WARNING: libjpeg 64-bit development files not found, JPEG won't be supported.
# 
# configure: WARNING: No sound system was found. Windows applications will be silent.
