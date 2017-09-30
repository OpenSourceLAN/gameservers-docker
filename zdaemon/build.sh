#!/bin/bash
. ../common.sh

# Find all wad files that don't have lower case file extension and warn about it
ls wads/ | grep -i '.wad$' | grep -v wad && echo "WARNING: you have upper case .wad files. zdaemon might not find them!"
[[ $(ls wads/ | grep -i '.wad$' | wc -l) -eq 0 ]] && echo "ERROR: no wads exist in the wad folder. ZDaemon needs some WAD files to run!" && exit 1

docker_build zdaemon