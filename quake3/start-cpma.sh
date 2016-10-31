#!/bin/bash

[[ -n $MAP ]] &&  MAP="+map $MAP"
#  This is CPMA and our default is 2 players for some 1v1 love
[[ -z $MAXPLAYERS ]] &&  MAXPLAYERS="2"

MAXPLAYERS="set sv_maxclients $MAXPLAYERS"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="set rconpassword $RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="set g_password $SV_PASSWORD
set g_needpass 1"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="Quake 3 CPMA Server"

cat <<EOF >/usr/share/games/quake3/baseq3/hostname.cfg

set sv_hostname "$SV_HOSTNAME"
$RCON_PASSWORD
$SV_PASSWORD
$MAXPLAYERS
EOF


exec /usr/games/quake3-server +set dedicated 1 +exec hostname.cfg +exec cpma.cfg +set fs_game cpma

