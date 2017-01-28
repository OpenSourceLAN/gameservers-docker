#!/bin/bash
[[ -z $TZ && -f /etc/timezone ]] && TZ=`cat /etc/timezone`
docker build -t base --build-arg TZ=$TZ .
