#!/bin/bash

. ../common.sh


if [[ ! `ls mmsource-*-linux.tar.gz` ]]
then

	MMVERSION=$( curl http://www.metamodsource.net/downloads.php | grep -o "mmsource-[0-9\.]*-git[0-9]\+-linux.tar.gz" | head -n 1 )
	MMMAJORVERSION=$(echo $MMVERSION | cut -d '-' -f 2 | cut -d '.' -f 1,2 )

	curl -o $MMVERSION https://mms.alliedmods.net/mmsdrop/$MMMAJORVERSION/$MMVERSION

fi

if [[ ! `ls sourcemod-*-linux.tar.gz` ]]
then
	SMVERSION=$(  curl http://www.sourcemod.net/downloads.php?branch=stable | grep -Eo "sourcemod-.*?-linux.tar.gz" | head -n 1 )

	SMMAJORVERSION=$( echo $SMVERSION | grep -Eo "\-[0-9]*\.[0-9]*" |  grep -Eo "[0-9]*\.[0-9]*")

	echo $SMVERSION
	echo $SMMAJORVERSION

	SMURL="http://www.sourcemod.net/smdrop/$SMMAJORVERSION/$SMVERSION"
	echo "Downloading sourcemod: $SMURL"
	curl -o $SMVERSION $SMURL
fi


if [[ ! `ls tf2items-*-linux.zip` ]]
then
	TF2ITEMSFILENAME=$(   curl "https://builds.limetech.io/?p=tf2items" | grep -Eo "tf2items-.*?-linux.zip" | head -n 1)
	TF2ITEMSURL=https://builds.limetech.io/files/$TF2ITEMSFILENAME
	echo "Downloading TF2items: $TF2ITEMSURL"
	curl -o $TF2ITEMSFILENAME $TF2ITEMSURL
fi

[[ -f prophuntredux.zip ]] || curl -o prophuntredux.zip "https://forums.alliedmods.net/attachment.php?attachmentid=146505&d=1441898056" || (echo "Coudln't download prophunt" && exit 1)
[[ -f sm_observerpoint.smx ]] || curl -o sm_observerpoint.smx "http://www.sourcemod.net/vbcompiler.php?file_id=34433" || (echo "Coudln't download observerpoint" && exit 1)

[[ -f PHMapEssentialsBZ2.7z ]] || curl -L -o PHMapEssentialsBZ2.7z "https://github.com/powerlord/sourcemod-prophunt/releases/download/maps/PHMapEssentialsBZ2.7z" || (echo "Coudln't download prophunt maps" && exit 1)

docker_build tf2-prophunt
