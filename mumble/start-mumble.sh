#!/bin/bash

RUN_CONFIG=mumble-run.ini

cd /mumble
mkdir -p /mumble/data

[[ ! -f murmur.sqlite && -n "$SUPER_USER_PASSWORD" ]] && ./murmur.x86 -supw $SUPER_USER_PASSWORD

cp mumble.ini $RUN_CONFIG

[[ -n "$MUMBLE_PASSWORD" ]] && echo "password=$MUMBLE_PASSWORD" >> $RUN_CONFIG
[[ -n "$MUMBLE_USERS" ]] && echo "users=$MUMBLE_USERS" >> $RUN_CONFIG
[[ -n "$MUMBLE_USERSPERCHANNEL" ]] && echo "usersperchannel=$MUMBLE_USERSPERCHANNEL" >> $RUN_CONFIG
[[ -n "$MUMBLE_WELCOMETEXT" ]] && echo "welcometext=$MUMBLE_WELCOMETEXT" >> $RUN_CONFIG

exec ./murmur.x86 -fg -ini $RUN_CONFIG