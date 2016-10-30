# Taken and updated for python3 with love from
# http://void7.net/advertising-linux-minecraft-servers-to-the-lan/

# TODO: give it some way of parsing the server name and config options
# out of the server.properties file

import time
import socket
 
servers = [
        ["Local Network - Survival Map", 25565],
]
 
BROADCAST_IP = "255.255.255.255"
BROADCAST_PORT = 4445
 
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
 
print("Broadcasting Minecraft servers to LAN")
 
while 1:
        for server in servers:
                msg = "[MOTD]%s[/MOTD][AD]%d[/AD]" % (server[0], server[1])
                sock.sendto(msg.encode('utf-8'), (BROADCAST_IP, BROADCAST_PORT))
        time.sleep(1.5)

