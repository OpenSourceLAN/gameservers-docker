#!/bin/bash

[[ -z $MAPCYCLEFILE ]] && export MAPCYCLEFILE="ph-maplist.txt"
[[ -z $MAXPLAYERS ]] && export MAXPLAYERS=32
[[ -z $MAP ]] && export MAP="arena_storm_b1c"
[[ -z $SV_HOSTNAME ]] && export SV_HOSTNAME="TF2 Prophunt Server"

exec ./start-tf2.sh