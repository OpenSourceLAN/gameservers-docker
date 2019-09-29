#!/bin/bash


AVAILABLE_MAPS="MapRotation=FFA_ThePit
MapRotation=TDM_Camp
MapRotation=SKM_Grad
MapRotation=FFA_Contraband
MapRotation=TDM_Tourney
MapRotation=SKM_MountainPeak
MapRotation=FFA_Taiga
MapRotation=TDM_Crossroads
MapRotation=SKM_ThePit
MapRotation=FFA_Camp
MapRotation=TDM_Grad
MapRotation=SKM_Contraband
MapRotation=FFA_Tourney
MapRotation=TDM_MountainPeak
MapRotation=SKM_Taiga
MapRotation=FFA_Crossroads
MapRotation=TDM_ThePit
MapRotation=SKM_Camp
MapRotation=FFA_Grad
MapRotation=TDM_Contraband
MapRotation=SKM_Tourney
MapRotation=FFA_MountainPeak
MapRotation=TDM_Taiga
MapRotation=SKM_Crossroads"

[[ -n $GAMEMODE ]] && AVAILABLE_MAPS=$(echo "$AVAILABLE_MAPS" | grep -i  ${GAMEMODE}_)

[[ -z $MAXPLAYERS ]] && MAXPLAYERS=16
[[ -z $MAP ]] && MAP="FFA_ThePit"

mkdir -p Mordhau/Saved/Config/LinuxServer/
cat <<EOF >Mordhau/Saved/Config/LinuxServer/Game.ini
[/Script/Mordhau.MordhauGameMode]
PlayerRespawnTime=5.000000
AutoKickOnTeamKillAmount=5
BallistaRespawnTime=30.000000
CatapultRespawnTime=30.000000
HorseRespawnTime=30.000000
DamageFactor=1.000000
TeamDamageFactor=0.500000
TeamDamageFlinch=0
$AVAILABLE_MAPS

[/Script/Mordhau.MordhauGameSession]
MaxSlots="$MAXPLAYERS"
ServerName="$SV_HOSTNAME"
ServerPassword="$SV_PASSWORD"
ServerModAuthToken=
AdminPassword="$RCON_PASSWORD"
BannedPlayers=()
MutedPlayers=()
EOF

exec ./MordhauServer.sh $MAP
