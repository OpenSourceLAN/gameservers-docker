#!/bin/bash

[[ -n $SERVER_NAME ]] || SERVER_NAME="Trackmania Forever Server"
[[ -n $SERVER_COMMENT ]] || SERVER_COMMENT="Powered by Docker"
[[ -n $MAX_PLAYERS ]] || MAX_PLAYERS=64
[[ -n $TRACKLIST ]] || TRACKLIST="tracklist-all.cfg"

[[ -n $SUPER_ADMIN_PASSWORD ]] || SUPER_ADMIN_PASSWORD=SuperAdmin
[[ -n $ADMIN_PASSWORD ]] || ADMIN_PASSWORD=AdminPassword
[[ -n $SERVER_PASSWORD ]] || SERVER_PASSWORD=""

[[ -n $MASTER_SERVER_LOGIN ]] || MASTER_SERVER_LOGIN=""
[[ -n $MASTER_SERVER_PASSWORD ]] || MASTER_SERVER_PASSWORD=""
[[ -n $MASTER_SERVER_KEY ]] || MASTER_SERVER_KEY=""

sed -i "s/%%SERVER_NAME%%/$SERVER_NAME/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/%%SERVER_COMMENT%%/$SERVER_COMMENT/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/%%SERVER_PASSWORD%%/$SERVER_PASSWORD/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/%%MAX_PLAYERS%%/$MAX_PLAYERS/" /tm/GameData/Config/dedicated_cfg.txt

sed -i "s/%%SUPER_ADMIN_PASSWORD%%/$SUPER_ADMIN_PASSWORD/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/%%ADMIN_PASSWORD%%/$ADMIN_PASSWORD/" /tm/GameData/Config/dedicated_cfg.txt

sed -i "s/%%MASTER_SERVER_LOGIN%%/$MASTER_SERVER_LOGIN/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/%%MASTER_SERVER_PASSWORD%%/$MASTER_SERVER_PASSWORD/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/%%MASTER_SERVER_KEY%%/$MASTER_SERVER_KEY/" /tm/GameData/Config/dedicated_cfg.txt

exec ./TrackmaniaServer /lan /game_settings=$TRACKLIST /dedicated_cfg=dedicated_cfg.txt /nodaemon
