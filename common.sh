#!/bin/bash

gettimestamp() {
	date +%Y%m%d-%H%M%S
}

docker_build() {
	NAME=$1
	[[ -z $NAME ]] && echo "No name provided for docker build" && exit 1
	docker build -t $NAME -t $NAME:$(gettimestamp) .
}