#!/bin/bash

ls openttd*-linux-generic-amd64.tar.gz || (
   BINURL=$(curl https://www.openttd.org/en/download-stable | egrep -o "\/\/binaries.openttd.org/releases/.*/openttd-.*-linux-generic-amd64.tar.gz")
   [[ -z "$BINURL" ]] && echo "failed to get binary URL" && exit 1
   
   wget https:$BINURL
)


ls opengfx*-all.zip || (
   BINURL=$(curl https://www.openttd.org/en/download-opengfx | egrep -o "\/\/binaries.openttd.org/extra/opengfx/.*/opengfx-.*-all.zip")
   [[ -z "$BINURL" ]] && echo "failed to get gfx URL" && exit 2
   
   wget https:$BINURL
)

ls opensfx*-all.zip || (
   BINURL=$(curl http://www.openttd.org/en/download-opensfx | egrep -o "\/\/binaries.openttd.org/extra/opensfx/.*/opensfx-.*-all.zip")
   [[ -z "$BINURL" ]] && echo "failed to get sfx URL" && exit 3
   
   wget https:$BINURL
)


ls openmsx*-all.zip || (
   BINURL=$(curl http://www.openttd.org/en/download-openmsx | egrep -o "\/\/binaries.openttd.org/extra/openmsx/.*/openmsx-.*-all.zip")
   [[ -z "$BINURL" ]] && echo "failed to get msx URL" && exit 4
   
   wget https:$BINURL
)
