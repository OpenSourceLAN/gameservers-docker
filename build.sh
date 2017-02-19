#!/bin/bash

NAME=$1
[[ -z $NAME ]] && echo "No image name given" && exit 1

. ./common.sh

docker_build $NAME