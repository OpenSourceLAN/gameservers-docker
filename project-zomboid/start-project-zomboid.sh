#!/bin/bash

if [[ -z "${SERVER_NAME}" ]]; then
    exec ./start-server.sh -servername $SERVER_NAME
else
    exec ./start-server.sh
fi