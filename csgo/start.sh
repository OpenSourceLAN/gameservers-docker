#!/bin/bash

if [ -z $SERVER_TOKEN ]
then
   echo "No server token supplied" >&2
   exit 1;
fi

[ $LAN -ge 1 ] && LAN="1" || LAN="0"

[ -n $HOSTNAME ] || HOSTNAME="CS:GO Server"
[ -n $GAME_TYPE ] || GAME_TYPE=0
[ -n $GAME_MODE ] || GAME_MODE=1
[ -n $MAP ] || MAP="cs_office"
[ -n $OTHER_ARGS ] || OTHER_ARGS=""

if [ -n $SOURCETV_ADDR ]
then
   echo "tv_title $HOSTNAME" > csgo/cfg/hostname.cfg 
   ./srcds_run -game csgo -console -tickrate 128 -maxplayers 64 +tv_relay $SOURCETV_ADDRESS $OTHER_ARGS

else

   echo "hostname $HOSTNAME" > csgo/cfg/hostname.cfg 

   ./srcds_run -game csgo +sv_lan $LAN -ip 0.0.0.0 +map $MAP -maxplayers 12 -usercon -exec hostname.cfg +game_type 0 +game_mode 1 -tickrate 128 -maxplayers_override 12 $OTHER_ARGS 


fi


#echo '"STEAM_0:0:19457778" "@Full Admins"' > csgo/addons/sourcemod/configs/admins_simple.ini


