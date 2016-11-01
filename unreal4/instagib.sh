#!/bin/bash

[[ -z $MAP ]] && export MAP="DM-Spacer"
[[ -z $MAXPLAYERS ]] && export MAXPLAYERS=64

exec ./start.sh ?Game=DM?Mutator=Instagib
