#!/bin/bash

set -e

BASE_DIR=$(pwd)

mkdir -p .cache

if [[ -z $1 ]]; then
    echo Specify containers to run 'docker build . -t ARG --build-arg CACHE_DATE=$(date)' against/
    echo e.g. 'docker_build.sh base,steamcmd,l4d2,l4d2-metamod'
    exit 1
fi

for i in $(echo $1 | sed "s/,/ /g")
do
    echo "Building ${i}..."
    cd ${i}
    echo "Using CACHE_DATE in case updates have been made..."
    docker build . --build-arg CACHE_DATE="$(date)" -t ${i}
    cd ${BASE_DIR}
done

echo "Done! Bye for now!"
