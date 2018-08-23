#!/bin/bash

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ -z "$MAP" ]] && MAP="de_dust2"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS="24"
[[ -z $SERVER_NUM ]] && SERVER_NUM="1"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="$RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="$SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="Counterstrike Source (Gungame)"

# Create config file
cat <<EOF >/steam/css/cstrike/cfg/server.cfg
hostname $SV_HOSTNAME
rcon_password $RCON_PASSWORD
sv_password $SV_PASSWORD
EOF

echo '"$FULL_ADMINS" "@Full Admins"' > css/addons/sourcemod/configs/admins_simple.ini

exec ./srcds_run -game cstrike +sv_lan $LAN +ip 0.0.0.0 +map $MAP -usercon -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
