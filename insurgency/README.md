# Insurgency

Insurgency server with some out-of-the-box configuration.

## Build notes

To catch updates since the original image was built, run:

```
docker build --build-arg CACHE_DATE="$(date)"
```

This will re-use the previously built image as a base instead of re-downloading everything again.

## Environment variables

Supports the following default configurations by setting environment variable `GAME_MODE`:

* ambush
* checkpoint
* conquer
* firefight
* flashpoint
* hunt
* infiltrate
* occupy
* outpost
* push
* skirmish
* strike
* survival

Other configurable environment variables:

* `SV_HOSTNAME`
* `SV_PASSWORD`
* `RCON_PASSWORD`
* `LAN` (0 is not, 1 is LAN)
* `MAXPLAYERS` (humans + bots)
* `MAPCYCLEFILE` (look at your local steamapps\common\insurgency2\insurgency)
* `SERVER_CFG` (look at your local steamapps\common\insurgency2\insurgency\cfg)
* `MAP` (map gametype e.g. market skirmish)
* `TICKRATE`
