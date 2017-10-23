#!/bin/bash

cd /zdaemon

function explodemaps() {
	for map in $(echo $1 | tr ',' '\n'); do echo "addmap $map"; done
}

[[ -n $HOSTNAME ]] && HOSTNAME="set hostname \"$HOSTNAME\""
[[ -n $MOTD ]] && MOTD="set motd \"$HOSTNAME\""
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="set rcon_password \"$RCON_PASSWORD\""
[[ -n $PASSWORD ]] && PASSWORD="set password \"$PASSWORD\""
[[ $LAN -ge 1 ]] && MASTER_ADVERTISE="set master_advertise 2" || MASTER_ADVERTISE="set master_advertise 1"
[[ -n $MAXPLAYERS ]] && MAXPLAYERS="set maxclients $MAXPLAYERS
set maxclients $SV_MAXPLAYERS"

# Default maps
[[ -z $MAPS ]] && MAPS="map01,map04,map07"

cat <<EOF > overrides.cfg

$HOSTNAME
$MOTD
$RCON_PASSWORD
$MASTER_ADVERTISE
$PASSWORD
$MAXPLAYERS

// Splits up comma separated map list
$(explodemaps $MAPS)

// Random CVARs from the environment
$(env | grep '^CVAR_' | sed "s/^CVAR_/set /" | tr '=' ' ')
EOF


exec ./zserv -cfg ffa-template.cfg
