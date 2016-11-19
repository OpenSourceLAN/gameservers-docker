#!/bin/bash

download() {
	DOMAIN="https://www.factorio.com"
	URL=$(curl $DOMAIN/download-headless/stable | egrep -o '/get-download/.+/headless/linux64' | head -n 1)
	[[ -z $URL ]] && (echo "Coudln't download factorio. Please download factorio_headless manually " && exit 1)
	wget -O factorio_headless.tar.gz $DOMAIN$URL
}


[[ ! `ls factorio_headless*.tar.gz` ]] && download


docker build -t factorio .