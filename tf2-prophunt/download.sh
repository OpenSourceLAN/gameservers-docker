#!/bin/bash

MMVERSION=$( curl http://www.metamodsource.net/downloads.php | grep -o "mmsource-[0-9\.]*-git[0-9]\+-linux.tar.gz" | head -n 1 )

MMMAJORVERSION=$(echo $MMVERSION | cut -d '-' -f 2 | cut -d '.' -f 1,2 )

curl -o $MMVERSION https://mms.alliedmods.net/mmsdrop/$MMMAJORVERSION/$MMVERSION

SMVERSION=$(  curl http://www.sourcemod.net/downloads.php?branch=stable | grep -Eo "sourcemod-.*?-linux.tar.gz" | head -n 1 )

SMMAJORVERSION=$( echo $SMVERSION | grep -Eo "\-[0-9]*\.[0-9]*" |  grep -Eo "[0-9]*\.[0-9]*")

echo $SMVERSION
echo $SMMAJORVERSION

SMURL="http://www.sourcemod.net/smdrop/$SMMAJORVERSION/$SMVERSION"
echo "Downloading sourcemod: $SMURL"
curl -o $SMVERSION $SMURL


TF2ITEMSFILENAME=$(   curl "https://builds.limetech.io/?p=tf2items" | grep -Eo "tf2items-.*?-linux.zip" | head -n 1)
TF2ITEMSURL=https://builds.limetech.io/files/$TF2ITEMSFILENAME
echo "Downloading TF2items: $TF2ITEMSURL"
curl -o $TF2ITEMSFILENAME $TF2ITEMSURL
