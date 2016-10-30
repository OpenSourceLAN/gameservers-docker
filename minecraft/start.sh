#!/bin/bash

# Start server advertiser

python3 advertise.py "Some server here" &

# Start server itself

exec  java -Xms4G -Xmx4G -jar minecraft_server*.jar nogui