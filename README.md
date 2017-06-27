# Minetest: Registered Players

A mod and web API to prevent player spamming accounts.

Any game server can register associate with any registry.

Any players that are banned via `registered_players` mod can also be marked as banned in the web registry; any other servers can query the registry to know if a player is banned on another server, by name.

## Requirements

Minetest:

* 0.4.* series
	* for 0.4.15+, `registered_players` must be added to the `secure.trusted_mods` list, as it makes web calls

Web API Host:

* web server
* php5+
