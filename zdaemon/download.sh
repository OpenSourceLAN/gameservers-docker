#!/bin/bash

ls zserv*linux26.tgz >/dev/null || (
	URL=$(curl -s http://zdaemon.org/?CMD=downloads | grep -o 'http://.*linux26.tgz' | head -n 1)
	wget $URL
)

