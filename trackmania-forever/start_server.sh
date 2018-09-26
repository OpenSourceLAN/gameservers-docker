#!/bin/bash


[[ -n $RCON_PASSWORD ]] || RCON_PASSWORD=$(dd if=/dev/urandom bs=20 count=1 2>/dev/null | base64)

sed -i "s/%%SERVER_NAME%%/$SERVER_NAME/" /tm/GameData/Config/dedicated_cfg.txt

sed -i "s/SuperAdminPassword/$RCON_PASSWORD/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/AdminPassword/$RCON_PASSWORD/" /tm/GameData/Config/dedicated_cfg.txt
sed -i "s/UserPassword/$RCON_PASSWORD/" /tm/GameData/Config/dedicated_cfg.txt

[[ -n $TRACKLIST ]] || TRACKLIST="tracklist-all.cfg"

exec ./TrackmaniaServer /lan /game_settings=$TRACKLIST /dedicated_cfg=dedicated_cfg.txt /nodaemon

