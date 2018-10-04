# Unreal Tournament 2004

To download the server, visit find [a random download site on the internet](http://www.fileplanet.com/146417/download/Unreal-Tournament-2004-Server-v3339-+-Bonus-Pack).
You want to find version 3339 I think. 

Unzip that server zip file so that there is a `gameservers-docker/ut2004/server_files` 
directory that contains the UT2004 installation (eg, the `System` and `Maps` folders).

`//TODO: validate that link works`

### Environment Variables

Image supports these environment variables - 
* `SV_HOSTNAME` - what shows up in the server browser
* `SV_PASSWORD` - password to join game
* `RCON_PASSWORD` - password for rcon and web interface
* `MAP` - first map
* `MAXPLAYERS`
* `INSTAGIB` - enables the Instagib mutator
* `MUTATORS` - specify custom mutators, comma separated values from [this list](http://wiki.unrealadmin.org/Mutator_List_%28UT2004%29)
* `OTHER_OPTS` - Pass more custom [command line options](http://wiki.unrealadmin.org/Commandline_Parameters_%28UT2004%29)

Log in to RCON using `AdminLogin YourPasswordHere` inside the game client console (`~`)

Then use `admin map dm-deck17` to change maps

### Useful Links

* [Mutator list](http://wiki.unrealadmin.org/Mutator_List_%28UT2004%29)
* [Command line option list](http://wiki.unrealadmin.org/Commandline_Parameters_%28UT2004%29)
* [Server setup tutorial](http://wiki.unrealadmin.org/Server_Setup_%28UT2004%29)