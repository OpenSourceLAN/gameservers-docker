#!/usr/bin/env bash
set -e

mkdir  -p /tron/server/config
mkdir  -p /tron/server/var
mkdir -p /tron/src

cd /armagetron*
echo "Configuring"

./configure --enable-dedicated

echo "Making"
make -j 8 

echo "installing"
make install

rm -rf /tron/src
cp /etc/armagetronad-dedicated/* /tron/server/config/ || true 
