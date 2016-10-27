#!/bin/bash

cd LinuxServer/Engine/Binaries/Linux
chmod +x UE4Server-Linux-Shipping
exec ./UE4Server-Linux-Shipping UnrealTournament DM-Spacer?Game=DM?MaxPlayers=64 
