#!/bin/bash

. ../common.sh

# TODO: if user specifies a version, ensure that it is *that* version that is checked to exist in local dir

# Pass a version number in $MUMBLE_RELEASE to build that version
# eg MUMBLE_RELEASE="1.2.19"
[[ -n "$MUMBLE_RELEASE" ]] && MUMBLE_RELEASE="tags/$MUMBLE_RELEASE"
[[ -z "$MUMBLE_RELEASE" ]] && MUMBLE_RELEASE="latest"

if [[ ! `ls murmur-static*.tar.bz2 2>/dev/null` ]]
then
	echo "No mumble archive found; downloading $MUMBLE_RELEASE"
	FILEPATH=$(curl -sSL https://github.com/mumble-voip/mumble/releases/latest | grep -Po '/mumble-voip/mumble/releases/download/[0-9]+\.[0-9]+\.[0-9]+/murmur-static_x86-[0-9]+\.[0-9]+\.[0-9]+.tar.bz2' | head -n 1)
	FILENAME=$(echo $FILEPATH | grep -Po 'murmur-static_x86-[0-9]+\.[0-9]+\.[0-9]+.tar.bz2')
	[[ -z $FILENAME ]] && echo "Could not download mumble for some reason" && exit 1

	URL="https://github.com$FILEPATH"
	echo "Downloading: $URL"
	curl -sSLo $FILENAME $URL
else
	echo "Found $(ls ls murmur-static*.tar.bz2 2>/dev/null) - not downloading new"
fi

docker_build mumble