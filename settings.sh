
# If you have set up a docker network for game servers to use (see advanced
# section of the README) then put its name here
[[ -z $NETWORK ]] && (docker network inspect gameservers 2>/dev/null >/dev/null ) && NETWORK="gameservers"
[[ -z $NETWORK ]] && NETWORK="host"

# The docker container restart policy. Usually always, unless-stopped, or
# blank for never
[[ -z $RESTART ]] && RESTART="unless-stopped"

[[ -z $OTHER_DOCKER_OPTS ]] && OTHER_DOCKER_OPTS="--detach"


