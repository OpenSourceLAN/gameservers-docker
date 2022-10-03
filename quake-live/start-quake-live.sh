#!/bin/bash

#[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="rcon_password $RCON_PASSWORD"

# advertise to master servers by default
[[ -z $MASTER ]] && MASTER="1"
# LAN by default
[[ -z $LAN ]] && LAN="1"

[[ $MASTER -ge 1 ]] && MASTER="+set sv_master 1" || MASTER="+set sv_master 0"
[[ $LAN -ge 1 ]] && LAN="+set sv_serverType 1" || LAN="+set sv_serverType 2"


exec ./run_server_x64.sh \
+set net_port 27960 \
+set net_strict 1 \
$MASTER \
$LAN \
+map retribution ffa 
