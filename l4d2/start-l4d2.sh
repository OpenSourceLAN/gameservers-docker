#!/bin/bash

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ -z "$MAP" ]] && MAP="c1m4_atrium"
[[ -z "$GAME_MODE" ]] && GAME_MODE="versus"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS="8"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="rcon_password $RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="sv_password $SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="L4D2 Server"

# Create config file
cat <<EOF >/steam/l4d2/left4dead2/cfg/server.cfg
hostname "$SV_HOSTNAME"
$RCON_PASSWORD
$SV_PASSWORD
EOF

# Run dedicated server
exec ./srcds_run -game left4dead2 +sv_lan $LAN +ip 0.0.0.0 +map $MAP -usercon +mp_gamemode $GAME_MODE +sv_gametypes $GAME_MODE -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
