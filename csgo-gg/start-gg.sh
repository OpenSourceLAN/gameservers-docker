#!/bin/bash

export GAME_TYPE=1
export GAME_MODE=0
export OTHER_ARGS="+mapgroup mg_armsrace"
export MAP="ar_shoots"
export MAXPLAYERS=32
exec ./start.sh 

# [[ -z "$RCON_PASSWORD" ]] || RCON_PASSWORD="rcon_password=$RCON_PASSWORD"
# [[ -z "$SV_PASSWORD" ]] || SV_PASSWORD="sv_password=$SV_PASSWORD"

# cat <<EOF >/steam/csgo/csgo/cfg/server.cfg

# hostname "$SV_HOSTNAME"
# $RCON_PASSWORD
# $SV_PASSWORD
# EOF

# [[ -z "$MAXPLAYERS" ]] && MAXPLAYERS=32

# ./srcds_run -game csgo +sv_lan 1 -maxplayers_override $MAXPLAYERS +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map ar_shoots 