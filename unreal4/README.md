# Unreal Tournament 4

To download the server, visit [the announcements section of the forums](https://www.epicgames.com/unrealtournament/forums/unreal-tournament-discussion/announcements).
Go to the latest version release and click on the "Release notes" link at the bottom.
On the release notes page, you will find a "Linux Server" download link. If you can't
see it there, try the previous version release.

If server doesn't show up in server browser, use `open 10.0.0.1` in the console

### Environment Variables

Image supports these environment variables - 
* `SV_HOSTNAME`
* `SV_PASSWORD` - password to join game
* `RCON_PASSWORD`
* `MAP` - first map
* `MAXPLAYERS`


Log in to RCON using `RconAuth YourPasswordHere` inside the game client

Then use `RconMap DM-Spacer` to change maps

`RconExec AddBots 4` to add bots, and `RconExec killbots 4` to remove

There are two startup scripts for Unreal - `deathmatch.sh` and `instagib.sh`.

### Useful links:

* [Unreal Engine Wiki](https://wiki.unrealengine.com/Servers_%28Unreal_Tournament%29)
* [MultiPlayer Forums tutorial](https://multiplayerforums.com/topic/4156-setup-an-pre-alpha-server/)
* [Console commands](https://www.reddit.com/r/unrealtournament/comments/37lwjb/ingame_ut4_console_commands/)
* [Instagib server](https://www.reddit.com/r/unrealtournament/comments/3daxpu/how_to_make_an_instagib_dm_server/)

