#!/bin/bash

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ $LAN -ge 1 ]] && ENABLE_LOBBY="0" || ENABLE_LOBBY="1"
[[ -z $SERVER_IP ]] && SERVER_IP=0.0.0.0
[[ -z "$MAP" ]] && MAP="c1m4_atrium"
[[ -z $MP_GAMEMODE ]] && MP_GAMEMODE="versus"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="$RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="$SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="Left 4 Dead 2 - MetaMod"

# mp config

# Create config file
cat <<EOF >/steam/l4d2/left4dead2/cfg/server.cfg
hostname $SV_HOSTNAME
rcon_password $RCON_PASSWORD
sv_password $SV_PASSWORD
sv_allow_lobby_connect_only $ENABLE_LOBBY
EOF

echo '$FULL_ADMINS' > left4dead2/addons/sourcemod/configs/admins_simple.ini

exec ./srcds_run -game left4dead2 +sv_lan $LAN +ip $SERVER_IP +map $MAP +mp_gamemode $MP_GAMEMODE -usercon -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
