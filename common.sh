#!/bin/bash

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

gettimestamp() {
	date +%Y%m%d-%H%M%S
}

# Builds container with given name, and any dependencies
docker_build() {
	local NAME=$1
        local DOCKERFILE=$2
        local CACHE=""

	[[ -z $NAME ]] && echo "No name provided for docker build" && exit 1
        [[ -z $DOCKERFILE ]] && DOCKERFILE="-f Dockerfile" || DOCKERFILE="-f ${DOCKERFILE}"

	local PARENT="$(get_docker_parent $NAME)"
	[[ -n $PARENT ]] && docker_build_if_needed $PARENT
        [[ -n $NOCACHE ]] && CACHE="--no-cache"
	(cd $BASE_DIR/$NAME && docker build $DOCKERFILE $CACHE -t $NAME -t $NAME:$(gettimestamp) . )
}

# Builds a container if it doesn't already have a latest
docker_build_if_needed() {
	local NAME=$1
	[[ "$(docker images --quiet $NAME:latest)" == "" ]] && docker_build $NAME
}

get_docker_parent() {
	local CHILD=$1
	[[ $CHILD == "base" ]] && exit 0
	grep -i  "^FROM" $BASE_DIR/$CHILD/Dockerfile  | awk '{print $2}' | cut -d: -f1
}
