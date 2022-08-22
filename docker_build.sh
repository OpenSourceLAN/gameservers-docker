#!/bin/bash

set -e

BASE_DIR=$(pwd)

mkdir -p .cache

if [[ -z $1 ]]; then
    echo Specify containers to run 'docker build . -t ARG --build-arg CACHE_DATE=$(date)' against/
    echo e.g. 'docker_build.sh tf2,l4d2'
    exit 1
fi

for i in $(echo $1 | sed "s/,/ /g")
do
    echo "Building ${i}..."
    cd ${i}
    if [[ -f ".cache-info" ]]; then
        echo "Found '.cache-info'!"
        CACHE_DIR="${BASE_DIR}/.cache"
        GAME_CACHE_DIR="${CACHE_DIR}/${i}"
        if [[ -d "${GAME_CACHE_DIR}" ]]; then
            echo "Moving existing master '.cache' for ${i}."
            rm -fr .cache
            mv "${GAME_CACHE_DIR}" .cache
        else
            echo "No existing master '.cache' for ${i} found."
        fi
        docker build --progress=plain . -t ${i} || exit 1
        SHORT_UUID=$(uuidgen)
        SHORT_UUID=${SHORT_UUID%%-*}
        BUILD_ID="$i-build-${SHORT_UUID}"
        docker run -id --name "${BUILD_ID}" --entrypoint=/bin/bash $i \
            -c "read" || exit 1
        DIRECTORY_TO_CACHE=$(head -n 1 .cache-info)
        echo "Caching contents of ${DIRECTORY_TO_CACHE}..."
        docker cp "${BUILD_ID}":${DIRECTORY_TO_CACHE} "${CACHE_DIR}" || exit 1
        rm -fr .cache
        echo "Killing build image..."
        docker kill "${BUILD_ID}" || exit 1
        docker rm "${BUILD_ID}" || exit 1
    else
        echo "No '.cache-info' found. Consider adding one to cache the contents of the image built to re-use later."
        echo "Using CACHE_DATE in case new version needs created for the old way of trying to re-use existing images..."
        docker build . --build-arg CACHE_DATE="$(date)" -t ${i}
    fi
    cd ${BASE_DIR}
done

echo "Done! Bye for now!"
