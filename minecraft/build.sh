#!/bin/bash

VERSION=1.10.2

[[ -f minecraft_server.$VERSION.jar ]]  || wget https://s3.amazonaws.com/Minecraft.Download/versions/$VERSION/minecraft_server.$VERSION.jar

docker build -t minecraft .
