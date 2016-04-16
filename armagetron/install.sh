#!/usr/bin/env bash

mkdir  -p /tron/server/config
mkdir  -p /tron/server/var
mkdir -p /tron/src
cd /tron/src
curl -sSL -o tron.tar.gz https://launchpad.net/armagetronad/0.2.8/0.2.8.3.x/+download/armagetronad-0.2.8.3.3.src.tar.gz

tar -xf tron.tar.gz
cd armagetron*
./configure --enable-dedicated
make -j 8 
make install

rm -rf /tron/src
cp /etc/armagetronad-dedicated/* /tron/server/config/ || true 
