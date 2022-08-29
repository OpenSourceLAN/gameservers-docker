#!/bin/bash

set -e
set -u

if [[ -n $SOURCETV_ADDR ]]
then
   echo "tv_title $HOSTNAME" > csgo/cfg/hostname.cfg 
   exec ./srcds_run -game csgo -console -tickrate 128 -maxplayers 64 +exec hostname.cfg +tv_relay $SOURCETV_ADDRESS $OTHER_ARGS $@
else
   exec ./srcds_run -game csgo +sv_lan $LAN -ip 0.0.0.0 $MAP -usercon $GAME_MODE $GAME_TYPE -tickrate 128 $MAXPLAYERS $SERVER_TOKEN $OTHER_ARGS $@
fi
