#!/bin/bash
INTERFACE=$(ip route | grep default | awk '{print $(NF)}')
IPADDR=$(ip addr list dev $INTERFACE | grep 'inet ' | egrep -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
echo "Using IP: $IPADDR"

# Set up config files with stuff
sed -i "s/RconPassword=.*/RconPassword=$RCON_PASSWORD/" /unreal/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Engine.ini
[[ -n $SV_HOSTNAME ]] && sed -i "s/ServerName=.*/ServerName=$SV_HOSTNAME/" /unreal/LinuxServer/UnrealTournament/Saved/Config/LinuxServer/Game.ini

# Build command line arguments
[[ -z $MAP ]] && export MAP="DM-Spacer"
[[ -z $MAXPLAYERS ]] && export MAXPLAYERS=64

[[ -z "$GAME_OPTS" ]] && (echo "No game arguments provided, can't start server" >&2 && exit 1)

GAME_OPTS="$MAP?MaxPlayers=$MAXPLAYERS?$@"

[[ -n $SV_PASSWORD ]] && GAME_OPTS="$GAME_OPTS?ServerPassword=$SV_PASSWORD"


cd LinuxServer/Engine/Binaries/Linux
chmod +x UE4Server-Linux-Shipping
exec ./UE4Server-Linux-Shipping UnrealTournament  $GAME_OPTS -multihome $IPADDR
