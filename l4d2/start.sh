#!/bin/bash

set -e

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ -z $SERVER_IP ]] && SERVER_IP=0.0.0.0
[[ -z "$MAP" ]] && MAP="c1m4_atrium"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS="8"
[[ -z $MP_GAMEMODE ]] && MP_GAMEMODE="versus"

./update_server_details.sh

exec ./srcds_run -game left4dead2 +sv_lan $LAN +ip $SERVER_IP +map $MAP +mp_gamemode $MP_GAMEMODE -usercon -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
