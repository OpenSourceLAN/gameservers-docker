#!/bin/bash

echo "$FULL_ADMINS" "@Full Admins" > css/addons/sourcemod/configs/admins_simple.ini

./configure.sh
./launch.sh
