
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


## Tutorial

There is a [tutorial on the Open Source LAN website](http://opensourcelan.com/blog/2017/01/28/containing-your-game-servers/)
which will step you through building and using the images.

## Contributions 
Contributions are welcome. Submit a pull request or open an issue. 

All additions should follow these suggestions:
* Set up for LAN by default - eg, call +sv_lan 1 in srcds games, but optionally disabling that by runtime var is fine
* Include a start script that is added to the container, so anyone using the Dockerfile can easily customise their server


## Advanced networking stuff

We want to expose all game servers directly to our LAN, and the `--host` option
means we will get port conflicts. There is an alternative approach which uses
the ipvlan docker network driver.

```
# Creates a docker network that's bridge with your layer 2 network
# Subnet should match the IP range and subnet of your network.
# ip-range is the CIDR block of IP addresses to assign to containers
# parent is the name of the interface you'd like to bridge containers to

docker network create -d ipvlan --subnet=10.0.0.0/24 -o parent=eth0 --ip-range 10.0.0.16/28 --gateway 10.0.0.1  gameservers

# Starts your game server inside the layer 2 network
docker run -it --rm --net=gameservers csgo /steam/csgo/srcds_run -game csgo +sv_lan 1 +map cs_office
```

You can now see the CSGO server from another server on your network.


## Running game servers on Docker Swarm

[These are the instructions for building a swarm](https://docs.docker.com/swarm/install-manual/).

In addition to the swarm, one also needs a docker registry (I think). 

These are the following gotchas that you need to be aware of:

* If using ipvlan, you need _experimental_, not main release docker (as at version 1.12)
* The ipvlan network is local scoped. This means you need to create the network on every
host individually. You should ensure the assigned IP ranges for each host do not overlap,
as there does not appear to be any shared state about IP addresses assigned. The name of
the networks should be identical on every host.
* The tutorial only has you set up a single consul instance. It will change IP addresses
every time the container restarts, and this will cause consul to fail because it cannot
elect itself leader, since it thinks another instance exists at a different IP address.
Make sure to hard code an IP for it.
* Using ubuntu 14.04, you'll need to update `/etc/defaults/docker` to contain: `DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"`
* If not using a secured docker registry, also add to the `DOCKER_OPTS` value: `--insecure-registry=registry-hostname:5000`
* Consul, docker node and docker masters can all be on the same host (I think - it works for me at least)
* To get a container to failover between hosts in the case of an outage, you need to run the container with these args: ` -e reschedule:on-node-failure`
(todo: figure out why the container doesn't get auto-started on the new host).
Also note that a race condition exists - when the host comes back up, it will start the old container, and when 
the docker swarm manager container starts, it will detect the container was moved and kill it.

### Setting up multiple consul hosts

Run the master like this:

```
docker run -d  -v /mnt:/data --name consul \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 53:53/udp \
    progrium/consul -server -advertise 10.0.0.167 -bootstrap-expect 3
```

and the other two like this:
```
    docker run -d -v /mnt:/data --name consul \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 53:53/udp \
    progrium/consul -server -advertise 10.0.0.197 -join 10.0.0.167
```

Double check all 3 are present in cluster by doing `curl http://localhost:8500/v1/status/peers`.


### TODO

Ensure every instance has:

* A README covering available options, startup scripts, etc
* Auto-mount point support where appropriate (eg, for saves, demos)
* Config options for at least:
  * The name of the server (what it shows as in server browsers)
  * Server password
  * RCON password (where RCON exists)
  * LAN or internet
* Has dockerfile configured with default ports it exposes (not that the suggested configuration uses these)
* Has a way to easily RCON or remote control
* Does not require user to manually download everything (with exceptions for some large and customisable downloads)
* Fix the thing where the auto mounts always have permission problems because conatiners

Make the easy start script support passing environment variables to the container

Make an easy way to import config files in to the servers (eg mounting cfg directories)

Add more games

### LICENSE

This project is licensed under GPL 3.0. See LICENSE for more information.