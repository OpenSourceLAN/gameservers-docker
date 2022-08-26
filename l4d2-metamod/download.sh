#!/bin/bash

set -e

source zip-utils.sh

MMVERSION=$( curl https://www.sourcemm.net/downloads.php/?branch=stable | grep -o "mmsource-[0-9\.]*-git[0-9]\+-linux.tar.gz" | head -n 1 )
MMMAJORVERSION=$(echo $MMVERSION | cut -d '-' -f 2 | cut -d '.' -f 1,2 )
echo "Downloading metamod ${MMMAJORVERSION}.${MMVERSION}..."
curl -o $MMVERSION "https://mms.alliedmods.net/mmsdrop/$MMMAJORVERSION/$MMVERSION"
tar -xf mm*.tar.gz -C "${LEFT4DEAD2_DIR}/"

SMVERSION=$( curl http://www.sourcemod.net/downloads.php?branch=stable | grep -Eo "sourcemod-.*?-linux.tar.gz" | head -n 1 )
SMMAJORVERSION=$( echo $SMVERSION | grep -Eo "\-[0-9]*\.[0-9]*" |  grep -Eo "[0-9]*\.[0-9]*")
echo "Downloading metamod ${SMMAJORVERSION}.${SMVERSION}..."
curl -o $SMVERSION "http://www.sourcemod.net/smdrop/$SMMAJORVERSION/$SMVERSION"
tar -xf sourcemod*.tar.gz -C "${LEFT4DEAD2_DIR}/"

# http://www.bailopan.net/stripper/
# http://www.bailopan.net/stripper/files/stripper-1.2.2-linux.tar.gz
curl -o stripper.tar.gz 'http://www.bailopan.net/stripper/files/stripper-1.2.2-linux.tar.gz'
tar -xf stripper.tar.gz -C "${LEFT4DEAD2_DIR}/"

# Source Scramble (memory patching and allocation natives)
# https://forums.alliedmods.net/showthread.php?p=2657347
curl -L https://github.com/nosoop/SMExt-SourceScramble/releases/download/0.7.0/package.tar.gz > SourceScramble.tar.gz
tar -xf SourceScramble.tar.gz -C "${LEFT4DEAD2_DIR}/"

# [L4D1&2] Scene Processor 
# https://forums.alliedmods.net/showpost.php?p=2766130&postcount=59
curl -o sceneprocessor.zip 'https://forums.alliedmods.net/attachment.php?attachmentid=192668&d=1639588615'
unzipAndMoveToDir sceneprocessor.zip "${LEFT4DEAD2_DIR}/"
