
Quick start:

`docker run -it --net=host --rm -e "SV_HOSTNAME=Some Quake Server" -e "RCON_PASSWORD=supersecret" -e "SV_PASSWORD=nonoobsallowed" -e "MAXPLAYERS=12" --restart=unless-stopped --name quake3  quake3`

Environment variables available:

* `MAXPLAYERS` 
* `SV_PASSWORD` - server client password
* `RCON_PASSWORD`
* `MAP` - first map
* `SV_HOSTNAME` - name server advertises itself with

If you set a server password, clients need to open the console and type
`\password YourPasswordHere` before joining the server



Useful links:

* [Server Setup Guide](http://www.3dgw.com/guides/q3a/index.php3?page=configs.htm)
* [Respawn Quake 3 config](http://respawn.com.au/forums/index.php?showtopic=1087&st=0&p=16113)

