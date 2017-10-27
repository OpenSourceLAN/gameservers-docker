#!/bin/bash

[[ -z $MAP ]] && export MAP="DM-Spacer"
[[ -z $MAXPLAYERS ]] && export MAXPLAYERS=64

exec ./start-unreal4.sh Game=DM?Mutator=Instagib?timelimit=0?goalscore=100
