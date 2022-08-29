#!/bin/bash

# for more see https://wiki.openttd.org/Openttd.cfg

# [network]
[[ -z $SERVER_NAME ]] && SERVER_NAME="OpenTTD Server"
[[ -n $SERVER_PASSWORD ]] && SERVER_PASSWORD=""
[[ -n $RCON_PASSWORD ]] && RCON_PASSWORD="changeme"
[[ -n $ADMIN_PASSWORD ]] && ADMIN_PASSWORD="changeme"
[[ -z $MIN_ACTIVE_CLIENTS ]] && MIN_ACTIVE_CLIENTS=1

# [vehicle]
[[ -z $MAX_TRAINS ]] && MAX_TRAINS=5000
[[ -z $MAX_ROADVEH ]] && MAX_ROADVEH=5000
[[ -z $MAX_AIRCRAFT ]] && MAX_AIRCRAFT=5000
[[ -z $MAX_SHIPS ]] && MAX_SHIPS=5000
[[ -z $ROAD_SIDE ]] && ROAD_SIDE=right
[[ -z $ROADVEH_ACCELERATION_MODEL ]] && ROADVEH_ACCELERATION_MODEL=1
[[ -z $TRAIN_ACCELERATION_MODEL ]] && TRAIN_ACCELERATION_MODEL=1

# [economy]
[[ -z $FOUND_TOWN ]] && FOUND_TOWN=1
[[ -z $LARGER_TOWNS ]] && LARGER_TOWNS=1
[[ -z $MULTIPLE_INDUSTRY_PER_TOWN ]] && MULTIPLE_INDUSTRY_PER_TOWN=true

# [linkgraph]
[[ -z $DISTRIBUTION_PAX ]] && DISTRIBUTION_PAX=1
[[ -z $DISTRIBUTION_MAIL ]] && DISTRIBUTION_MAIL=1
[[ -z $DISTRIBUTION_ARMOURED ]] && DISTRIBUTION_ARMOURED=1
[[ -z $DISTRIBUTION_DEFAULT ]] && DISTRIBUTION_DEFAULT=1

# [locale]
[[ -z $CURRENCY ]] && CURRENCY=EUR

# [difficulty]
[[ -z $DISASTERS ]] && DISASTERS=false
[[ -z $INDUSTRY_DENSITY ]] && INDUSTRY_DENSITY=3
[[ -z $NUMBER_INDUSTRIES ]] && NUMBER_INDUSTRIES=3
[[ -z $NUMBER_TOWNS ]] && NUMBER_TOWNS=2
[[ -z $QUANTITY_SEA_LAKES ]] && QUANTITY_SEA_LAKES=2
[[ -z $TERRAIN_TYPE ]] && TERRAIN_TYPE=2
[[ -z $MAX_NO_COMPETITORS ]] && MAX_NO_COMPETITORS=0

# [game_creation]
[[ -z $MAP_X ]] && MAP_X=9
[[ -z $MAP_Y ]] && MAP_Y=9
[[ -z $STARTING_YEAR ]] && STARTING_YEAR=1970
[[ -z $LANDSCAPE ]] && LANDSCAPE=temperate
[[ -z $TOWN_NAME ]] && TOWN_NAME=german

# [gui]
[[ -z $AUTOSAVE ]] && AUTOSAVE=yearly

mkdir -p /home/openttd/.openttd/
cat <<EOF >/home/openttd/.openttd/openttd.cfg
[network]
server_name = $SERVER_NAME
server_password = $SERVER_PASSWORD
rcon_password = $RCON_PASSWORD
admin_password = $ADMIN_PASSWORD
min_active_clients = $MIN_ACTIVE_CLIENTS

[vehicle]
max_trains = $MAX_TRAINS
max_roadveh = $MAX_ROADVEH
max_aircraft = $MAX_AIRCRAFT
max_ships = $MAX_SHIPS
road_side = $ROAD_SIDE
roadveh_acceleration_model = $ROADVEH_ACCELERATION_MODEL
train_acceleration_model = $TRAIN_ACCELERATION_MODEL

[economy]
found_town = $FOUND_TOWN
larger_towns = $LARGER_TOWNS
multiple_industry_per_town = $MULTIPLE_INDUSTRY_PER_TOWN

[linkgraph]
distribution_pax = $DISTRIBUTION_PAX
distribution_mail = $DISTRIBUTION_MAIL
distribution_armoured = $DISTRIBUTION_ARMOURED
distribution_default = $DISTRIBUTION_DEFAULT

[locale]
currency = $CURRENCY

[difficulty]
disasters = $DISASTERS
terrain_type = $TERRAIN_TYPE
industry_density = $INDUSTRY_DENSITY
number_industries = $NUMBER_INDUSTRIES
number_towns = $NUMBER_TOWNS
quantity_sea_lakes = $QUANTITY_SEA_LAKES
max_no_competitors = $MAX_NO_COMPETITORS

[game_creation]
landscape = $LANDSCAPE
map_x = $MAP_X
map_y = $MAP_Y
starting_year = $STARTING_YEAR
town_name = $TOWN_NAME

[gui]
autosave = $AUTOSAVE
EOF

exec ./openttd -D
