#!/bin/bash

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ $LAN -ge 1 ]] && ENABLE_LOBBY="0" || ENABLE_LOBBY="1"
[[ -z $SERVER_IP ]] && SERVER_IP=0.0.0.0
[[ -z "$MAP" ]] && MAP="c1m4_atrium"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS="16"
[[ -z $MP_GAMEMODE ]] && MP_GAMEMODE="versus"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="$RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="$SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="Left 4 Dead 2 - 8v8 Versus"
[[ -z $VERSUS_TEAM_LIMIT ]] && VERSUS_TEAM_LIMIT="8"

# abm config
[[ -z $ABM_EXTRAPLAYERS ]] && ABM_EXTRAPLAYERS="4"
[[ -z $ABM_MINPLAYERS ]] && ABM_MINPLAYERS="1"
[[ -z $ABM_OFFERTAKEOVER ]] && ABM_OFFERTAKEOVER="1"

# mp config

# Create config file
cat <<EOF >/steam/l4d2/left4dead2/cfg/server.cfg
hostname $SV_HOSTNAME
rcon_password $RCON_PASSWORD
sv_password $SV_PASSWORD
sv_allow_lobby_connect_only $ENABLE_LOBBY
sm_cvar sv_maxplayers $MAX_PLAYERS
sm_cvar sv_removehumanlimit 1
sm_cvar sv_force_unreserved 1
sm_cvar fmc+vs_l4d(2)_enable 1
EOF

#create abm config file
cat <<EOF > /steam/l4d2/left4dead2/cfg/sourcemod/abm.cfg
abm_extraplayers = "$ABM_EXTRAPLAYERS"
abm_minplayers = "$ABM_MINPLAYERS"
abm_identityfix = "1"

abm_offertakeover = "$ABM_OFFERTAKEOVER"
EOF

echo $FULL_ADMINS > left4dead2/addons/sourcemod/configs/admins_simple.ini

exec ./srcds_run -game left4dead2 +sv_lan $LAN +ip $SERVER_IP +map $MAP +mp_gamemode $MP_GAMEMODE -usercon -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
