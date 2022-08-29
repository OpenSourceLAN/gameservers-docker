#!/bin/bash

set -e
set -u

export CONFIG_DIR="/SCP Secret Laboratory/config/${SERVER_PORT}"

mkdir -p "${CONFIG_DIR}" \
  && cp -r config_gameplay.txt "${CONFIG_DIR}/config_gameplay.txt" \
  && cp -r config_remoteadmin.txt "${CONFIG_DIR}/config_remoteadmin.txt"

./LocalAdmin ${SERVER_PORT} -d
