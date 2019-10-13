#!/bin/bash

BIN=./bin/x64/factorio
SAVES_DIR=/factorio/saves
SAVE=$SAVES_DIR/save.zip

# TODO: detect if there's a map preferences file
# factorio --create saves/my-save.zip --map-gen-settings path-to-file-with-desired-map-generation-settings.json

[[ -f $SAVE ]] && EXISTING_SAVE="yes"
[[ -f $SAVE ]] || $BIN --create $SAVE

JQ_FILTER=""

[[ -n $SERVER_NAME ]] && JQ_FILTER="$JQ_FILTER .name = \"$SERVER_NAME\" |"
[[ -n $SERVER_DESCRIPTION ]] && JQ_FILTER="$JQ_FILTER .description = \"$SERVER_DESCRIPTION\" |"
[[ -n $LAN ]] && [[ $LAN -ne "0" ]] && JQ_FILTER="$JQ_FILTER .visibility.public = true | .visibility.lan = true |"
[[ -n $GAME_PASSWORD ]] && JQ_FILTER="$JQ_FILTER .game_password = \"$GAME_PASSWORD\" |"

JQ_FILTER="$JQ_FILTER .auto_pause = false"

jq "$JQ_FILTER" data/server-settings.example.json > data/server-settings.json

# TODO: add the config file if present

# TODO: maybe we can also do ./factorio  --start-server-load-latest --server-settings ./data/server-settings.json ?

[[ -z $EXISTING_SAVE ]] && exec $BIN --start-server-load-scenario Contest-1-Electronic-Circuit --server-settings /factorio/data/server-settings.json

exec $BIN --start-server-load-latest --server-settings /factorio/data/server-settings.json

