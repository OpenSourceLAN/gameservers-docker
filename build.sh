#!/bin/bash

NAME=$1
[[ -z $NAME ]] && echo "No image name given" && exit 1

[[ -f $NAME/build.sh ]] || (echo "Build file doesn't exist for $NAME/build.sh :( " && exit 1)
[[ -f $NAME/build.sh ]] && (cd $NAME && ./build.sh )
