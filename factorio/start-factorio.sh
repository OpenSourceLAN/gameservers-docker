#!/bin/bash

BIN=./bin/x64/factorio
SAVE=/factorio/saves/save.zip

[[ -f save.zip ]] || $BIN --create $SAVE

JQ_FILTER=""

[[ -n $SERVER_NAME ]] && JQ_FILTER="$JQ_FILTER .name = \"$SERVER_NAME\" |"
[[ -n $SERVER_DESCRIPTION ]] && JQ_FILTER="$JQ_FILTER .description = \"$SERVER_DESCRIPTION\" |"

JQ_FILTER="$JQ_FILTER ."

jq "$JQ_FILTER" data/server-settings.example.json > data/server-settings.json

$BIN --start-server $SAVE