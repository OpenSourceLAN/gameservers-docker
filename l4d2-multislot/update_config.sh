#!/bin/bash

set -e

export MAX_PLAYERS=${MAX_PLAYERS:-8}

# update config file
cat <<EOF >> /steam/l4d2/left4dead2/cfg/server.cfg
upgrade_denied_sound "1" - Play sound when ammo already used
upgrade_block_glauncher "1" - "Block use of special ammo with grenade launcher (0 - Allow | 1 - Block any | 2 - Block incendiary | 3 - Block explosive)
upgrade_incendiary_multi "1.0" - Incendiary ammo multiplier on pickup
upgrade_explosive_multi "1.0" - Explosive ammo multiplier on pickup

sv_maxplayers "${MAX_PLAYERS}" - max human players that can join your server. -1 to disable and use standart check (range 0 to 32)
sv_removehumanlimit "1" - remove kick for players when they are more than 8 for vs and 4 for coop(0 to disable, 1 to enable)
sv_force_unreserved "0"  - if you set it to 1 before connection from lobby your server will stay unreserved and allow players to connect using connect command, this command sets sv_allow_lobby_connect_only 0, so you need to create lobby using ms_force_dedicated_server and then connect to server, your friends may see wrong max players in friend lobby, so give them ip.

- keep this at the end
sm plugins reload sceneadjustments.smx
EOF

# create l4d2_character_manager config
cat <<EOF > /steam/l4d2/left4dead2/cfg/sourcemod/l4d2_character_manager.cfg
l4d2_character_manager_version

// Should enable identity fix for players(NOT BOTS) 0 = (disable) 1 = (enabled)
// -
// Default: "1"
// Minimum: "0.000000"
// Maximum: "1.000000"
l4d2_identity_fix "1"

// survivor set you wish to use, 0 = (use map default), 1 = (l4d1), 2 = (l4d2), 3 = (use both)
// -
// Default: "3"
// Minimum: "0.000000"
// Maximum: "3.000000"
l4d2_survivor_set "3"

// Should manage people aswell as bots? 0 = (disable) 1 = (enabled) (Will overwrite identityfix when taking over a bot)
// -
// Default: "0"
// Minimum: "0.000000"
// Maximum: "1.000000"
l4d2_manage_people "0" 
EOF
