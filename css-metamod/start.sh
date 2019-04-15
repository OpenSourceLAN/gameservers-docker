#!/bin/bash

# local vars
[[ $LAN -ge 1 ]] && LAN="1" || LAN="0"
[[ -z "$MAP" ]] && MAP="de_dust"
[[ -z $MAXPLAYERS ]] && MAXPLAYERS="24"
[[ -z $SERVER_NUM ]] && SERVER_NUM="1"

# Config file
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="$RCON_PASSWORD"
[[ -n $SV_PASSWORD ]] && SV_PASSWORD="$SV_PASSWORD"
[[ -z $SV_HOSTNAME ]] && SV_HOSTNAME="Counterstrike Source (Metamod)"

# mp config
[[ -z $MP_FRIENDLYFIRE ]] && MP_FRIENDLYFIRE=0
[[ -z $MP_MAXROUNDS ]] && MP_MAXROUNDS=15
[[ -z $MP_ROUNDTIME ]] && MP_ROUNDTIME=3.5
[[ -z $MP_AUTOTEAMBALANCE ]] && MP_AUTOTEAMBALANCE=0

# bot config
# how many bots?
[[ -z $BOT_QUOTA ]] && BOT_QUOTA=0

# fill   = If a player joins, the Bot will be kicked
# normal = If a player joins, the Bot won´t be kicked
[[ -z $BOT_QUOTA_MODE ]] && BOT_QUOTA_MODE=normal

# bots populate after a player joins the server
# 0 = bots always present
# 1 = bots join after humans
[[ -z $BOT_JOIN_AFTER_PLAYER ]] && BOT_JOIN_AFTER_PLAYER=1

# 0 = easy
# 1 = normal
# 2 = hard
# 3 = extreme
[[ -z $BOT_DIFFICULTY ]] && BOT_DIFFICULTY=2

[[ -z $BOT_PREFIX ]] && BOT_PREFIX=[BOT]

# Bots defuse the bombs etc...
# 0 = Bots allowed
# 1 = Humans only)
[[ -z $BOT_DEFER_TO_HUMAN ]] && BOT_DEFER_TO_HUMAN=0

# kick bot when slots fill
# 0 = don't kick the bot
# 1 = kick the bot
[[ -z $BOT_AUTO_VACATE ]] && BOT_AUTO_VACATE=1

# on, off, radio, minimal, normal
[[ -z $BOT_CHATTER ]] && BOT_CHATTER=minimal

# bot weapon set
[[ -z $BOT_ALLOW_GRENADES ]] && BOT_ALLOW_GRENADES=1
[[ -z $BOT_ALLOW_PISTOLS ]] && BOT_ALLOW_PISTOLS=1
[[ -z $BOT_ALLOW_RIFLES ]] && BOT_ALLOW_RIFLES=1
[[ -z $BOT_ALLOW_ROGUES ]] && BOT_ALLOW_ROGUES=1
[[ -z $BOT_ALLOW_SHOTGUNS ]] && BOT_ALLOW_SHOTGUNS=1
[[ -z $BOT_ALLOW_SNIPERS ]] && BOT_ALLOW_SNIPERS=1
[[ -z $BOT_ALLOW_MACHINE_GUNS ]] && BOT_ALLOW_MACHINE_GUNS=1
[[ -z $BOT_ALLOW_SUB_MACHINE_GUNS ]] && BOT_ALLOW_SUB_MACHINE_GUNS=1

# Create config file
cat <<EOF >/steam/css/cstrike/cfg/server.cfg
hostname $SV_HOSTNAME
rcon_password $RCON_PASSWORD
sv_password $SV_PASSWORD
mp_friendlyfire $MP_FRIENDLYFIRE
mp_timelimit $MP_TIMELIMIT
mp_maxrounds $MP_MAXROUNDS
mp_roundtime $MP_ROUNDTIME
mp_autoteambalance $MP_AUTOTEAMBALANCE
bot_quota $BOT_QUOTA
bot_quota_mode $BOT_QUOTA_MODE
bot_join_after_player $BOT_JOIN_AFTER_PLAYER
bot_difficulty $BOT_DIFFICULTY
bot_prefix $BOT_PREFIX
bot_defer_to_human $BOT_DEFER_TO_HUMAN
bot_auto_vacate $BOT_AUTO_VACATE
bot_chatter $BOT_CHATTER
bot_allow_grenades $BOT_ALLOW_GRENADES
bot_allow_pistols $BOT_ALLOW_PISTOLS
bot_allow_rifles $BOT_ALLOW_RIFLES
bot_allow_rogues $BOT_ALLOW_ROGUES
bot_allow_shotguns $BOT_ALLOW_SHOTGUNS
bot_allow_snipers $BOT_ALLOW_SNIPERS
bot_allow_machine_guns $BOT_ALLOW_MACHINE_GUNS
bot_allow_sub_machine_guns $BOT_ALLOW_SUB_MACHINE_GUNS
EOF

echo '"$FULL_ADMINS" "@Full Admins"' > css/addons/sourcemod/configs/admins_simple.ini

exec ./srcds_run -game cstrike +sv_lan $LAN +ip 0.0.0.0 +map $MAP -usercon -port 27015 -maxplayers $MAXPLAYERS -secure $OTHER_ARGS $@
