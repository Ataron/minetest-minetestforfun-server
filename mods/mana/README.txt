Mana mod [mana]
===============
Version: 1.0.1
Note: This mod uses semantic versioning, as defined by version 2.0.0 of the SemVer standard.
See: <http://semver.org/>

Description
===========
This mod adds basic support for mana to Minetest.

Each player will have an additional attribute: Mana. To be precise:

- Current mana reserves: How much mana the player currently has
- Maximum possible mana: How much mana the player can have at maximum
- Mana regeneration amont: How much mana will be generated each “mana tick” (default 0.2 seconds)

By default, each player spawns with 0/200 mana, and regenerates 1 mana per fifth of a second. All
these values can be configured with the server settings (`minetest.conf`) and it is highly advised to do
so if you plan to integrate this mod into a subgame.

The mana regeneration rate (the “mana tick”) is a global setting and is *not* configured on a
per-player basis.

The mod provides a simple API to set, get, add and subtract the mana (and maximum) mana of any player, and
for setting the regeneration amount. Note that this mod itself does *not* change the gameplay in a meaningful
way. You should install other mods which use the Mana mod as a dependency.

The API documentation is in the file API.md.

If the mod “HUD bars” [hudbars] is installed, a blue bar will be added to the HUD showing the player's mana reserves.
It currently only works with version 0.3.0 of this mod.

Otherwise, the mana is just shown as text.

Configuration
=============

This mod can be configured with minetest.conf! The following settings are accepted:

* `mana_default_max`: Initial max. mana given to new players. Default: `200`. This value must be non-negative.
* `mana_default_regen`: Initial regenerated mana per “mana tick”. Default: `1`. This value must be non-negative.
* `mana_regen_timer`: The length of a “mana tick” in seconds. Each player will get his/her mana increased by the current
  regen value per mana tick. Default: `0.2`. This value must be positive, also try to avoid very small values
  as those could probably stress your machine a lot.


License information
===================
* textures/mana_icon.png: CC-BY by Buch <http://opengameart.org/users/Buch>.
* textures/mana_bar.png: WTFPL by Wuzzy.
* Everything else: WTFPL.
