#!/bin/bash

if [ -z $SERVER_TOKEN ]
then
   echo "Warning: No server token supplied" >&2
fi

[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"

[[ -z "$MAP" ]] && MAP="cp_badlands"
MAP="+map $MAP"

[[ -n $MAXPLAYERS ]] &&  MAXPLAYERS="-maxplayers $MAXPLAYERS"
[[ -n $MAPCYCLEFILE ]] && MAPCYCLEFILE="+mapcyclefile $MAPCYCLEFILE"
# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="rcon_password $RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="sv_password $SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="TF2 Server"

cat <<EOF >/steam/tf2/tf/cfg/server.cfg

hostname "$SV_HOSTNAME"
$RCON_PASSWORD
$SV_PASSWORD
EOF

if [[ -n $SOURCETV_ADDR ]]
then
   echo "tv_title $HOSTNAME" > tf/cfg/hostname.cfg 
   exec ./srcds_run -game tf -console -maxplayers 64 +exec hostname.cfg +tv_relay $SOURCETV_ADDRESS $OTHER_ARGS $@

else

   exec ./srcds_run -game tf +sv_lan $LAN -ip 0.0.0.0 $MAP -usercon $GAME_MODE $GAME_TYPE $MAXPLAYERS $MAPCYCLEFILE $OTHER_ARGS $@


fi


#echo '"STEAM_0:0:19457778" "@Full Admins"' > csgo/addons/sourcemod/configs/admins_simple.ini


