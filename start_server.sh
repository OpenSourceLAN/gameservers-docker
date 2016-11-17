#!/bin/bash

select_name() {
   for i in `seq 1 1000`
   do
      docker inspect "$1_$i" >/dev/null 2>/dev/null
      [[ $? -eq 1 ]] && echo "$1_$i" && return
   done
     
   echo ""
}

ask_type() {
  
  while true; 
  do
    echo "Please select from one of the following images, or ctrl+c to exit:"
    # how to list directory? ls -d would be nice, but nope!
    find .  -maxdepth  1 -type d  | egrep -v -e '^.$' -e '.git' | sed 's/\.\///' | sort
    read -p "Image: " TYPE
    ls $TYPE >/dev/null 2>/dev/null && return 0
    echo "Invalid type: $TYPE, try again! :)"
  done

}

[[ -n $1 ]] && TYPE=$1 && shift
[[ -z $TYPE ]] && ask_type

. settings.sh

[[ -z $NAME ]] && NAME=`select_name $TYPE`
[[ -n $NAME ]] && NAME="--name $NAME"
[[ -n $NETWORK ]] && NETWORK="--net $NETWORK"
[[ -n $RESTART ]] && RESTART="--restart=$RESTART"



docker run $NETWORK $RESTART $NAME $OTHER_DOCKER_OPTS $TYPE $@
