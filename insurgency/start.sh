#!/bin/bash

[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ -n $MAXPLAYERS ]] && MAXPLAYERS="$MAXPLAYERS"
[[ -n $MP_COOP_LOBBYSIZE ]] && MP_COOP_LOBBYSIZE="$MP_COOP_LOBBYSIZE"

[[ -z $RCON_PASSWORD ]] && RCON_PASSWORD="changeme"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD=$SV_PASSWORD

supportedGamemodes=(
ambush
checkpoint
conquer
firefight
flashpoint
hunt
infiltrate
occupy
outpost
push
skirmish
strike
survival
)

gamemodeSupported="false"
for i in "${supportedGamemodes[@]}"
do
	if [ "$i" = "$GAME_MODE" ] ; then
		gamemodeSupported="true"
		break
	fi
done

[[ -z $GAME_MODE ]] && GAME_MODE=conquer

if [ "$gamemodeSupported" = "true" ] ; then
	printf "Configuring server for $GAME_MODE.\n"
else
	printf "Unsupported game mode! Defaulting to conquer. Ignore this message if MAPCYCLEFILE and SERVER_CFG are customized.\n"
	GAME_MODE=conquer
fi

[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="Insurgency - $GAME_MODE"

[[ -z $MAPCYCLEFILE ]] && MAPCYCLEFILE=mapcycle_"$GAME_MODE".txt
[[ -z $SERVER_CFG ]] && SERVER_CFG=default_server_"$GAME_MODE".cfg

printf "Using mapcyclefile $MAPCYCLEFILE\n"
printf "Using servercfg    $SERVER_CFG\n"

[[ -z $MAP ]] && MAP="$(head -1 /steam/insurgency2/insurgency/$MAPCYCLEFILE)"
[[ -z $TICKRATE ]] && TICKRATE=64

cat <<EOF >/steam/insurgency2/insurgency/cfg/server.cfg
hostname $SV_HOSTNAME
rcon_password $RCON_PASSWORD
sv_password $SV_PASSWORD
mp_coop_lobbysize $MP_COOP_LOBBYSIZE

"mapcyclefile" "$MAPCYCLEFILE"
EOF

exec ./srcds_run -game insurgency +maxplayers $MAXPLAYERS +map "$MAP" +sv_lan $LAN -ip 0.0.0.0 -port 27015 -tickrate $TICKRATE -insecure +exec $SERVER_CFG
