#!/bin/bash

# classic competitive
export GAME_TYPE=0
export GAME_MODE=1

export LAN=1
export MAX_PLAYERS=11
export MAP="de_dust2"
export OTHER_ARGS="$OTHER_ARGS +mapgroup mg_active"

exec ./start.sh $@
