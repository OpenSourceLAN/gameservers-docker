#!/bin/bash

[[ -z $SERVER_NAME ]] && SERVER_NAME="Wreckfest server"
[[ -z $WELCOME_MESSAGE ]] && WELCOME_MESSAGE="Wreck them all"
#[[ -z $GAME_PASSWORD ]] && GAME_PASSWORD=
[[ -z $MAX_PLAYERS ]] && MAX_PLAYERS="32"
[[ -z $TRACK ]] && TRACK="bigstadium_demolition_arena"
[[ -z $GAME_MODE ]] && GAME_MODE="derby"
[[ -z $LAPS ]] && LAPS="3"
[[ -z $TIME_LIMIT ]] && TIME_LIMIT="20"
# set this to 0 and the first person to join gets admin on server
[[ -z $OWNER_DISABLED ]] && OWNER_DISABLED=1
[[ -z $WEATHER ]] && WEATHER="0"

cat <<EOF > /steam/wreckfest/server_config.cfg
# Note: You can also set server parameters from the command line with -server_set PARAM=VALUE PARAM=VALUE ...
# Example: server\Wreckfest.exe -s server_config=server_config.cfg -server_set server_name=myserver max_players=12 password=secret

# Set basic server info
# Character limits: server_name (63), welcome_message (254), password (31)
server_name=$SERVER_NAME
welcome_message=$WELCOME_MESSAGE
password=$GAME_PASSWORD
max_players=$MAX_PLAYERS

# Clear previous user privileges every time when executing start_server_initial.bat
# 0 = keep, 1 = clear
clear_users=1

# Give host privileges to the first user who joins (for example yourself)
# 0 = first to join receives owner privileges, 1 = doesn't receive owner privileges
owner_disabled=$OWNER_DISABLED

# Comma separated list of Steam IDs (steamID64) of users that will be auto-granted admin privileges
#admin_steam_ids=12345678912345678

# Setup server for local area network play only
# 0 = use Steam, 1 = without Steam
lan=0

# Set server ports
# Only used when lan=0
# Server is visible in LAN search only for query ports 27015-27020 and 26900-26905.
steam_port=27015
game_port=33540
query_port=27016

# Set track, list available track names with command: tracks
track=$TRACK

# Set game mode, list available game modes with command: gamemodes
gamemode=$GAME_MODE

# Prepopulate server with bots, 0-24
bots=0

# Number of teams in team game modes, 2-4
num_teams=2

# Amount of laps in race game modes, 1-60
laps=$LAPS

# Deathmatch time limit in minutes
time_limit=$TIME_LIMIT

# Elimination interval time for elimination race: 0, 20, 30, 45, 60, 90, 120
# (0 means elimination each lap, others are seconds)
elimination_interval=0

# Set vehicle damage to normal or realistic
vehicle_damage=normal

# Allow only vehicles with a maximum class of a, b, c or d
car_class_restriction=a

# Allow only one specific car, list available cars with command: cars
car_restriction=

# Disallow use of special vehicles
special_vehicles_disabled=$SPECIAL_VEHICLE_DISABLED

# Disable car resets
car_reset_disabled=0

# Set car reset delay to 0 (no delay) or 1-20 seconds
car_reset_delay=0

# Disable speed limit for players that drive the wrong way
wrong_way_limiter_disabled=0

# Set event weather, list available weather names with command: weathers
weather=$WEATHER

# Set server update frequency to low or high
frequency=high

# Enable mod(s) on the server, mod folder names in a comma separated list
#mods=example,my_mod

# Save server messages to Log File
log=

# Event Loop (el) settings.
#-------------------------------------------------------------------------------
#  If enabled, server will automatically rotate pre-configured events.
#  Using "el_add=trackname" you can add as many events to the rotation as you wish.
#  Note that "el_*" parameters override corresponding global settings for the event.
#  Remove the first # from setup parameters to enable.
#  Use the console command /eventloop to enable/disable rotation.

## Add first event to Loop
#el_add=gravel1_main_loop
#el_gamemode="racing"
#el_laps=3
#el_car_reset_disabled=0
#el_wrong_way_limitel_disabled=0
#el_car_class_restriction=a
#el_car_restriction=
#el_weather=

## Add second event to Loop
#el_add=tarmac1_main_circuit
#el_gamemode="team race"
#el_num_teams=2
#el_laps=3
#el_car_reset_disabled=0
#el_wrong_way_limitel_disabled=0
#el_car_class_restriction=a
#el_car_restriction=
#el_weather=

## Add third event to Loop
#el_add=speedway2_demolition_arena
#el_gamemode="derby"
#el_car_reset_disabled=0
#el_car_class_restriction=a
#el_car_restriction=
#el_weather=

EOF

exec wine Wreckfest.exe -s server_config=server_config.cfg
