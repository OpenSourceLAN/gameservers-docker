# ZDaemon

ZDaemon allows you to play multiplayer games using WAD files from original id Software and derivatives.

To run the ZDaemon server, you need to obtain some WAD files. Either freely available community made ones,
or commercial ones from original games. 

When you have the WAD files, place them inside the `wads` directory _before_ building the image.

### Useful Links

* http://www.zdaemon.org/ - main website
* http://hs.keystone.gr/zdmaps/ - WAD (maps) downloads

### Environment Variables

* HOSTNAME - server name as appears in server browser
* MOTD - message of the day
* RCON_PASSWORD - RCON password
* PASSWORD - Password to join server as a player
* LAN - Advertise on LAN (1) or internet (0)
* MAXPLAYERS - Max players that can join the server
* MAPS - comma separated list of maps to put in rotation

You can also export environment variabes prefixed with `CVAR_` and they will appear
in the configuration file. For example:

`-e "CVAR_timelimit=100`

will add to the config file:

`set timelimit 100`
