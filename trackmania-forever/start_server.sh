#!/bin/bash

sed -i "s/%%SERVER_NAME%%/$SERVER_NAME/" /tm/GameData/Config/dedicated_cfg.txt

[[ -n $TRACKLIST ]] || TRACKLIST="tracklist-all.cfg"

exec ./TrackmaniaServer /lan /game_settings=$TRACKLIST /dedicated_cfg=dedicated_cfg.txt /nodaemon

