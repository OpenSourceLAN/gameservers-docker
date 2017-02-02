#!/bin/bash

cd /mumble
mkdir -p /mumble/data

[[ ! -f murmur.sqlite && -n "$SUPER_USER_PASSWORD" ]] && ./murmur.x86 -supw $SUPER_USER_PASSWORD

exec ./murmur.x86 -fg -ini mumble.ini