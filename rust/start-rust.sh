#!/bin/bash

[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="+rcon.password $RCON_PASSWORD"

# Todo: add all the vars from  https://developer.valvesoftware.com/wiki/Rust_Dedicated_Server#Command_line_parameters

# Rust core dumps if you don't tell it where its libs are
export LD_LIBRARY_PATH=`pwd`:`pwd`/RustDedicated_Data:$LD_LIBRARY_PATH

exec ./RustDedicated -batchmode +server.ip 0.0.0.0 +server.port 28015 +server.tickrate 10 \
+server.hostname "$SV_HOSTNAME" $RCON_PASSWORD $OTHER_ARGS

