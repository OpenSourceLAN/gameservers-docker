#!/bin/bash

. ../common.sh

[[ -z $VERSION ]] && VERSION=1.11.2

[[ -f minecraft_server.$VERSION.jar ]]  || wget https://s3.amazonaws.com/Minecraft.Download/versions/$VERSION/minecraft_server.$VERSION.jar

docker_build minecraft
