# Reflex Arena sersver

Reflex Arena is a quake-esque game. It has a windows only dedicated server,
so naturally we try and run it on Linux via wine. 

Reflex Arena requires a recent version of wine-staging, otherwise it crashes
shortly after launch.

### Environment variables

* `PORT` - Sets both sv_gameport
* `SERVERNAME` - sets server name
* `PASSWORD` - sets password to join server
* `REFPASSWORD` - sets the referee (RCON) password
* `MAXPLAYERS` - sets maximum clients
* `PUBLIC` - show your server in the server browsers (sv_public and sv_steam)
* `TIMELIMIT` - sets timelimit
* `ROUND_TIMELIMIT` - sets round timelimit
* `MAP` - sets start map
* `ENABLE_REPLAY_RECORDING` - Recordings are saved _inside_ the container. Don't delete the container!

### Useful links
* http://wiki.reflexfiles.com/index.php?title=Dedicated_Server
