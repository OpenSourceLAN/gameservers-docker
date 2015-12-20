
I'm sure there's already a bunch of Dockerfiles and images out there that do 
exactly this, but I'm doing it myself because I can. Putting game servers in 
Docker containers. 

I will only ever use these when I am operating on a LAN, so for simplicity I 
have not included any ports in these. Instead, you should spawn each container
with the option `--net=host` set so that each container gets a direct 
connection to the internal LAN. This means that things like LAN server 
broadcast discovery will work. 

All srcds based images depend on the steamcmd docker image, so this needs 
to be built first. For example, to build the HL2DM images:

```
cd steamcmd
docker build -t steamcmd .
cd ../hl2dm
docker built -t hl2dm .
```

In all cases, dependences (eg, steamcmd, sourcemod, etc) are fetched directly
from the maintainer's websites - this repository contains no binaries. 


## Contributions 
Contributions are welcome. Submit a pull request or open an issue. 

All additions should follow these suggestions:
* Set up for LAN by default - eg, call +sv_lan 1 in srcds games, but optionally disabling that by runtime var is fine
* Include a start script that is added to the container, so anyone using the Dockerfile can easily customise their server

