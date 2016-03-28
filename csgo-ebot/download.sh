#!/bin/bash

apt-get install -y curl unzip

curl -o /tmp/ebot.zip http://www.esport-tools.net/download/CSay-CSGO.zip
unzip /tmp/ebot.zip -d csgo/

chown -R steam:steam csgo/addons
