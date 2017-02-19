#!/bin/bash

WINEPATH=$(ls /opt/wine*/bin/wine64 | head -n 1)
[[ -n $WINEPATH ]] || WINEPATH=$(ls /opt/wine*/bin/wine | head -n 1)

echo "Using $WINEPATH as wine binary"

Xvfb :99 -screen 0 640x480x24:32 &
echo "Sleeping 5 to wait for Xvfb to create screen"
sleep 5
export DISPLAY=:99
exec $WINEPATH ConanSandboxServer.exe -log

# This doesn't work because 
#exec xvfb-run --auto-servernum --server-args='-screen 0 640x480x24:32' $WINEPATH ConanSandboxServer.exe -log
