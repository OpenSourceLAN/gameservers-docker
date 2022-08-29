#!/bin/bash

export HOSTNAME="${HOSTNAME:-My L4D2 Server}"
export SV_CONTACT="${SV_CONTACT:-your@email.com}"
export LAN="${LAN:-0}"
export MP_GAMEMODE="${MP_GAMEMODE:-coop}"
export DIFFICULTY="${DIFFICULTY:-hard}"
export MAX_PLAYERS="${MAX_PLAYERS:-8}"
export PAUSABLE="${PAUSABLE:-0}"
export SV_VOICE_ENABLE="${SV_VOICE_ENABLE:-1}"

sed -i "s/hostname.\+/hostname ${HOSTNAME}/g" left4dead2/cfg/server.cfg
sed -i "s/sv_lan.\+/sv_lan ${LAN}/g" left4dead2/cfg/server.cfg
sed -i "s/sm_cvar mp_gamemode .\+/sm_cvar mp_gamemode ${MP_GAMEMODE}/g" left4dead2/cfg/server.cfg
sed -i "s/z_difficulty.\+/z_difficulty ${DIFFICULTY}/g" left4dead2/cfg/server.cfg

sed -i "s/^l4d_maxplayers.\+/l4d_maxplayers "${MAX_PLAYERS}"/g" left4dead2/cfg/server.cfg
sed -i "s/sv_maxplayers.\+/sv_maxplayers "${MAX_PLAYERS}"/g" left4dead2/cfg/server.cfg
sed -i "s/sm_cvar l4d_maxplayers.\+/sm_cvar l4d_maxplayers "${MAX_PLAYERS}"/g" left4dead2/cfg/server.cfg

sed -i "s/sm_cvar l4d_survivor_limit.\+/sm_cvar l4d_survivor_limit "${MAX_PLAYERS}"/g" left4dead2/cfg/server.cfg
sed -i "s/sv_pausable.\+/sv_pausable ${PAUSABLE}/g" left4dead2/cfg/server.cfg
sed -i "s/sv_voiceenable.\+/sv_voiceenable ${SV_VOICE_ENABLE}/g" left4dead2/cfg/server.cfg
