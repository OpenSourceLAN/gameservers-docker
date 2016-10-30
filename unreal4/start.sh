#!/bin/bash
INTERFACE=$(ip route | grep default | awk '{print $(NF)}')
IPADDR=$(ip addr list dev $INTERFACE | grep 'inet ' | egrep -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
echo "Using IP: $IPADDR"

cd LinuxServer/Engine/Binaries/Linux
chmod +x UE4Server-Linux-Shipping
exec ./UE4Server-Linux-Shipping UnrealTournament $@  -multihome $IPADDR
