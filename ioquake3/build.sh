#!/bin/bash

. ../common.sh

ls baseq3/*pk3 >/dev/null || (echo "Please put your quake 3 pk3 files in baseq3 folder" && exit 1)

docker_build ioquake3

