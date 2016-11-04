#!/bin/bash

export GAME_TYPE=1
export GAME_MODE=0
export OTHER_ARGS="+mapgroup mg_armsrace -tickrate 128"
export MAP="ar_shoots"
export MAXPLAYERS=32
exec ./start.sh 
