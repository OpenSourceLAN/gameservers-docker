### Mumble

Work in progress.

Downloads and runs latest murmur.

Environment variables starting with `MUMBLE_` configure the murmur.ini file. If you want to have further configuration

* `SUPER_USER_PASSWORD` - sets super user password if the sqlite database doesn't already exist.
* `MUMBLE_PASSWORD` - sets the password to join the server
* `MUMBLE_USERS` - sets the max users
* `MUMBLE_USERSPERCHANNEL` - sets the max users per channel
* `MUMBLE_WELCOMETEXT` - sets the welcome text

Pass `MUMBLE_RELEASE` to `docker build` to use a specific mumble release instead of the latest.

