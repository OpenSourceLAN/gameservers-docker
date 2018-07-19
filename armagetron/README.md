# Armagetron Advanced

Tron bike game

### Useful links

* http://www.armagetronad.org/downloads.php


### Environment Variables

* `SERVER_NAME` - Sets name of server
* `RCON_PASSWORD` - Sets RCON password

TODO: add more configuration options :) Current config is fine for FFA up to 16 players per server

### Using RCON

While connected to the game, press `T` to open chat. Backspace everything and type
`/login your_password_here`. Then, type `/admin command goes here` to execute
commands on the server. For example: `/admin start_new_match`

### Useful commands

* `start_new_match` - Start a new match from Round 1 at the end of this round
* `TEAM_MAX_PLAYERS 1` - how many players on a team. More than 1 makes it a team game.
* `CENTER_MESSAGE somemessage` - Prominently display somemessage to all connected clients
* `SAY somemessage` - Send somemessage to all clients as a normal chat message

