#!/bin/bash

ls baseq3/*pk3 >/dev/null || (echo "Please put your quake 3 pk3 files in baseq3 folder" && exit 1)
ls *.zip >/dev/null || (echo "Please put CPMA zip file in this directory" && exit 2)

docker build -t quake3 .

