#!/bin/bash

BIN=./bin/x64/factorio
SAVE=/factorio/saves/save.zip

# TODO: detect if there's a map preferences file
# factorio --create saves/my-save.zip --map-gen-settings path-to-file-with-desired-map-generation-settings.json

[[ -f $SAVE ]] || $BIN --create $SAVE

JQ_FILTER=""

[[ -n $SERVER_NAME ]] && JQ_FILTER="$JQ_FILTER .name = \"$SERVER_NAME\" |"
[[ -n $SERVER_DESCRIPTION ]] && JQ_FILTER="$JQ_FILTER .description = \"$SERVER_DESCRIPTION\" |"

JQ_FILTER="$JQ_FILTER ."

jq "$JQ_FILTER" data/server-settings.example.json > data/server-settings.json

# TODO: add the config file if present

# TODO: maybe we can also do ./factorio  --start-server-load-latest --server-settings ./data/server-settings.json ?
$BIN --start-server $SAVE