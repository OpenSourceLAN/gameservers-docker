#!/bin/bash

[[ -n $MAP ]] &&  MAP="+map $MAP"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS=16

MAXPLAYERS="set sv_maxclients $MAXPLAYERS"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="set rconpassword $RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="set g_password $SV_PASSWORD
set g_needpass 1"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="Quake 3 CPMA Server"

cat <<EOF > hostname.cfg

set sv_hostname "$SV_HOSTNAME"
$RCON_PASSWORD
$SV_PASSWORD
$MAXPLAYERS
EOF


exec ./ioq3ded.x86_64 +set dedicated 1 +set net_port "27960"  +exec hostname.cfg  +set fs_game "baseq3" +set com_hunkmegs 256 +g_gametype 0 +map Q3DM3

