#!/bin/bash

. ../common.sh

download() {
	wget -O factorio_headless.tar.xz https://factorio.com/get-download/stable/headless/linux64
}


[[ ! `ls factorio_headless*.tar.xz` ]] && download


docker_build factorio
