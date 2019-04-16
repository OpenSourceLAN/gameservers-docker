#!/bin/bash

ls openttd*-linux-ubuntu-xenial-amd64.deb || (
   BINURL=$(curl https://www.openttd.org/downloads/openttd-releases/latest.html | egrep -o "\/\/proxy.binaries.openttd.org/openttd-releases/.*/openttd-.*-linux-ubuntu-xenial-amd64.deb")
   [[ -z "$BINURL" ]] && echo "failed to get binary URL" && exit 1

   wget https:$BINURL
)


ls opengfx*-all.zip || (
   BINURL=$(curl https://www.openttd.org/downloads/opengfx-releases/latest.html | egrep -o "\/\/binaries.openttd.org/extra/opengfx/.*/opengfx-.*-all.zip")
   [[ -z "$BINURL" ]] && echo "failed to get gfx URL" && exit 2

   wget https:$BINURL
)
