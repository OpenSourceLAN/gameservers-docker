#!/bin/bash

if [ -z $SERVER_TOKEN ]
then
   echo "Warning: No server token supplied" >&2
fi

[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ $GAME_TYPE -ge 1 ]] && GAME_TYPE="1" || GAME_TYPE="0"
[[ $GAME_MODE -ge 1 ]] && GAME_MODE="1" || GAME_MODE="0"


# Command line
[[ -n $GAME_TYPE ]] && GAME_TYPE="+game_type $GAME_TYPE"
[[ -n $GAME_MODE ]] && GAME_MODE="+game_mode $GAME_MODE"
[[ -n $MAP ]] &&  MAP="+map $MAP"
[[ -n $MAXPLAYERS ]] &&  MAXPLAYERS="-maxplayers_override $MAXPLAYERS"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="rcon_password $RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="sv_password $SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="CS:GO Server"

cat <<EOF >/steam/csgo/csgo/cfg/server.cfg

hostname "$SV_HOSTNAME"
$RCON_PASSWORD
$SV_PASSWORD
EOF

if [[ -n $SOURCETV_ADDR ]]
then
   echo "tv_title $HOSTNAME" > csgo/cfg/hostname.cfg 
   exec ./srcds_run -game csgo -console -tickrate 128 -maxplayers 64 +exec hostname.cfg +tv_relay $SOURCETV_ADDRESS $OTHER_ARGS

else

   exec ./srcds_run -game csgo +sv_lan $LAN -ip 0.0.0.0 $MAP -usercon $GAME_MODE $GAME_TYPE -tickrate 128 $MAXPLAYERS $OTHER_ARGS


fi


#echo '"STEAM_0:0:19457778" "@Full Admins"' > csgo/addons/sourcemod/configs/admins_simple.ini


