#!/bin/bash

. ../common.sh

[[ -f ManiaPlanetBetaServer_latest.zip ]] || wget http://files.maniaplanet.com/ManiaPlanet3Beta/ManiaPlanetBetaServer_latest.zip

docker_build trackmania2
