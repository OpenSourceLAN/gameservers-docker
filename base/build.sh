#!/bin/bash
. ../common.sh

[[ -z $TZ && -f /etc/timezone ]] && TZ=`cat /etc/timezone`
docker_build base  Dockerfile "--build-arg TZ=$TZ"
