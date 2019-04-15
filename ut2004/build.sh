#!/bin/bash

. ../common.sh

[[ -d server_files ]] || (
	echo "Download UT2004 server from http://www.fileplanet.com/146417/download/Unreal-Tournament-2004-Server-v3339-+-Bonus-Pack. Then unzip to server_files directory."; exit 1
	)

docker_build ut2004
