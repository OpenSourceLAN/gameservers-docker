#!/bin/bash


[[ -n $PORT ]] || PORT=25787
[[ -n $SERVERNAME ]] || SERVERNAME="Super cool Reflex Arena server"
#[[ -n $PASSWORD ]] && 
[[ -n $REFPASSWORD ]] && RCONPASSWORD="rcon_password $REFPASSWORD"
[[ -n $REFPASSWORD ]] && REFPASSWORD="sv_refpassword $REFPASSWORD"
[[ -n $MAXPLAYERS ]] || MAXPLAYERS=16
[[ -n $PUBLIC ]] || PUBLIC=0

#TIMELIMIT
#ROUND_TIMELIMIT
[[ -z $MAP && -z $WMAP ]] && MAP="Fusion"

[[ -n $MAP ]] && MAP="sv_startmap $MAP"
[[ -n $WMAP ]] && WMAP="sv_startwmap $WMAP"

cat <<EOF > /steam/reflex/dedicatedserver.cfg

sv_gameport $PORT
sv_hostname "$SERVERNAME"
sv_maxclients $MAXPLAYERS
sv_steam $PUBLIC
$MAP
$WMAP
$REFPASSWORD
$RCONPASSWORD

EOF


# TODO: how do these get extracted/cleaned up?
[[ $ENABLE_REPLAY_RECORDING -eq 1 ]] && (
	mkdir -p /steam/reflex/reflexfps/replays/
)


exec wine reflexded.exe


