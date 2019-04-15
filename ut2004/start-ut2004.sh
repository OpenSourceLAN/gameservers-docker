#!/bin/bash
INTERFACE=$(ip route | grep default | awk '{print $(NF)}')
IPADDR=$(ip addr list dev $INTERFACE | grep 'inet ' | egrep -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
echo "Using IP: $IPADDR"

[[ -z $MAXPLAYERS ]] && export MAXPLAYERS=64
[[ -z $MAP ]] && export MAP="DM-Deck17"

GAME_OPTS="$MAP?MaxPlayers=$MAXPLAYERS?$@"


[[ -n $SV_PASSWORD ]] && GAME_OPTS="$GAME_OPTS?GamePassword=$SV_PASSWORD"
[[ -n $RCON_PASSWORD ]] && GAME_OPTS="$GAME_OPTS?AdminPassword=$RCON_PASSWORD?AdminName=admin"
[[ -n $INSTAGIB ]] && GAME_OPTS="$GAME_OPTS?Mutator=XGame.MutInstaGib"
[[ -z $INSTAGIB ]] && [[ -n $MUTATORS ]] && GAME_OPTS="$GAME_OPTS?Mutator=$MUTATORS"
[[ -n $OTHER_OPTS ]]  && GAME_OPTS="$GAME_OPTS?$OTHER_OPTS"

[[ -n $SV_HOSTNAME ]] && sed -i "s/ServerName=.*/ServerName=$SV_HOSTNAME/" /ut2004/System/UT2004.ini
[[ $LAN -eq "1" ]] && sed -i "s/DoUplink=.*/DoUplink=False/" /ut2004/System/UT2004.ini

# GameSpy is dead. Long Live Game Spy
sed -i "s/UplinkToGamespy=.*/UplinkToGamespy=False/" /ut2004/System/UT2004.ini

cd /ut2004/System
exec ./ucc-bin server $GAME_OPTS -lanplay -nohomedir