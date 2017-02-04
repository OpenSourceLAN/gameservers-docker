#!/bin/bash
. ../common.sh

[[ -z $TZ && -f /etc/timezone ]] && TZ=`cat /etc/timezone`
docker build -t base -t base:$(gettimestamp) --build-arg TZ=$TZ .
