#!/bin/bash

NET="gameservers"
RESTART="unless-stopped"
DAEMON="-d"
[[ -n $NAME ]] && NAME="--name $NAME" || (echo "set NAME env var" && exit 1)

docker run $DAEMON --net=$NET --restart=$RESTART $NAME $@
