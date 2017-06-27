# Minetest: Registered Players

A mod and web API to prevent player spamming accounts.

Any game server can register associate with any registry.

Any players that are banned via `registered_players` mod can also be marked as banned in the web registry; any other servers can query the registry to know if a player is banned on another server, by name.

## Player registration

Players register on the web site where the Web API modules are enabled.

It is up to the web site to determine when a player's account is created and confirmed.

The default modules to be available will include

* tethering against a Minetest forum identity
* tethering against a GitHub account

In both cases, the prospective player will need to prove ownership of the account.

Iin future, an API for adding custom tethering plugins should eb available.

## Requirements

Minetest:

* 0.4.* series
	* for 0.4.15+, `registered_players` must be added to the `secure.trusted_mods` list, as it makes web calls

Web API Host:

* web server
* php5+
