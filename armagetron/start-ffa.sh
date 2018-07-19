#!/bin/bash

[[ -n $SERVER_NAME ]] || SERVER_NAME="Tron server"
[[ -z $RCON_PASSWORD ]] || RCON_PASSWORD="ADMIN_PASS $RCON_PASSWORD"

cat <<EOF > /tron/server/config/autoexec.cfg

LIMIT_SCORE 100 # score limit (all limits for one match)
LIMIT_ROUNDS 10 # max number of rounds to play
LIMIT_TIME 30 # max time (in minutes)
SERVER_PORT 4534
SERVER_NAME $SERVER_NAME
MESSAGE_OF_DAY Let Squid Live \n\n Also have fun.
MIN_PLAYERS 0 #number of players needed. AI will fill the rest of the spots

# One player per team. 16 teams. 
TEAM_MAX_PLAYERS 1
TEAMS_MAX 16

SIZE_FACTOR -2 # Scales the map. Too big is boring.

$RCON_PASSWORD
EOF



exec armagetronad-dedicated --configdir /tron/server/config --vardir /tron/server/var
