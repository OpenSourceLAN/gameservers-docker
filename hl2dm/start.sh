#!/bin/bash

[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="rcon_password $RCON_PASSWORD"

cat <<EOF >/steam/hl2dm/hl2mp/cfg/server.cfg
hostname "$SV_HOSTNAME"
$RCON_PASSWORD
EOF

exec ./srcds_run -game hl2mp +sv_lan 1 -ip 0.0.0.0 +exec server.cfg +map dm_underpass -maxplayers $MAXPLAYERS
