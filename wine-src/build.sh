#!/bin/bash
. ../common.sh

download() {
	wget -O wine-2.0.tar.bz2 http://dl.winehq.org/wine/source/2.0/wine-2.0.tar.bz2
}


[[ -f wine-2.0.tar.bz2 ]] || download

docker_build wine-src