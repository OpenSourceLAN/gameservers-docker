#!/bin/bash

# This snippet taken from startserver.sh.
# startserver.sh doesn't use `exec` to call the child, so signals
# from docker don't get pased through, so we need to exec it ourselves.

PARAMS=$@
export LD_LIBRARY_PATH=.
exec ./7DaysToDieServer.x86_64 -logfile 7DaysToDieServer_Data/output_log__`date +%Y-%m-%d__%H-%M-%S`.txt -quit -batchmode -nographics -dedicated -configfile=serverconfig.xml $PARAMS