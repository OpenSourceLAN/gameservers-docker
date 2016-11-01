
Quick start:

`docker run -it --net=host --rm -e "SV_HOSTNAME=Some Quake Server" -e "RCON_PASSWORD=supersecret" -e "SV_PASSWORD=nonoobsallowed" -e "MAXPLAYERS=12" --restart=unless-stopped --name quake3  quake3`

Environment variables available:

* `MAXPLAYERS` 
* `SV_PASSWORD` - server client password
* `RCON_PASSWORD`
* `MAP` - first map
* `SV_HOSTNAME` - name server advertises itself with

CPMA config has this:

```
// map rotation
set d1 "map pro-q3dm6; set nextmap vstr d2"
set d2 "map ztn3tourney1; set nextmap vstr d3"
set d3 "map pro-nodm9; set nextmap vstr d4"
set d4 "map ztn3tourney1; set nextmap vstr d5"
set d5 "map pro-q3tourney54; set nextmap vstr d1"
vstr d1
```

So in game, to switch to the second map, do...
```
\rconPassword YourPasswordHere
\rcon vstr d2

```

CPMA has a ready functionality, so both players will need to press `\``
to open the console, and then `\ready` to start the match


If you set a server password, clients need to open the console and type
`\password YourPasswordHere` before joining the server



Useful links:

* [Server Setup Guide](http://www.3dgw.com/guides/q3a/index.php3?page=configs.htm)
* [Respawn Quake 3 config](http://respawn.com.au/forums/index.php?showtopic=1087&st=0&p=16113)

