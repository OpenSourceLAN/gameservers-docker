# Counterstrike Source

Counterstrike Source server without plugins.

## Build notes
To catch updates since the original image was built, run:

 ```
docker build --build-arg CACHE_DATE="$(date)"
```

This will re-use the previously built image as a base instead of re-downloading everything again.

## Environment variables

The following configuration is available via setting environment variables:

```
hostname $SV_HOSTNAME
rcon_password $RCON_PASSWORD
sv_password $SV_PASSWORD
mp_friendlyfire $MP_FRIENDLYFIRE
mp_timelimit $MP_TIMELIMIT
mp_maxrounds $MP_MAXROUNDS
mp_roundtime $MP_ROUNDTIME
mp_autoteambalance $MP_AUTOTEAMBALANCE
bot_quota $BOT_QUOTA
bot_quota_mode $BOT_QUOTA_MODE
bot_join_after_player $BOT_JOIN_AFTER_PLAYER
bot_difficulty $BOT_DIFFICULTY
bot_prefix $BOT_PREFIX
bot_defer_to_human $BOT_DEFER_TO_HUMAN
bot_auto_vacate $BOT_AUTO_VACATE
bot_chatter $BOT_CHATTER
bot_allow_grenades $BOT_ALLOW_GRENADES
bot_allow_pistols $BOT_ALLOW_PISTOLS
bot_allow_rifles $BOT_ALLOW_RIFLES
bot_allow_rogues $BOT_ALLOW_ROGUES
bot_allow_shotguns $BOT_ALLOW_SHOTGUNS
bot_allow_snipers $BOT_ALLOW_SNIPERS
bot_allow_machine_guns $BOT_ALLOW_MACHINE_GUNS
bot_allow_sub_machine_guns $BOT_ALLOW_SUB_MACHINE_GUNS
```

