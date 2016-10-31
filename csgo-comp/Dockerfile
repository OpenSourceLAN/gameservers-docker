FROM csgo-warmod:latest

ADD PAXAUS2016/first_run/* /steam/csgo/csgo/

# Apparently warmod craps over files the first time it runs, so we 
# run csgo to get that out of its system and re-clobber ourselves
RUN timeout --preserve-status 15 ./srcds_run -game csgo  || true

ADD PAXAUS2016/second_run/cfg/ /steam/csgo/csgo/cfg/
ADD start-comp.sh /steam/csgo/