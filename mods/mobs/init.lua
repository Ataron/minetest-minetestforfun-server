-- Mob Api

dofile(minetest.get_modpath("mobs").."/api.lua")

-- Animals inc. Krupnovpavel's warthog/bee, JKmurray's chicken, ExeterDad's bunny

dofile(minetest.get_modpath("mobs").."/chicken.lua")
dofile(minetest.get_modpath("mobs").."/cow.lua")
dofile(minetest.get_modpath("mobs").."/rat.lua")
dofile(minetest.get_modpath("mobs").."/sheep.lua")
dofile(minetest.get_modpath("mobs").."/warthog.lua")
dofile(minetest.get_modpath("mobs").."/bee.lua")
dofile(minetest.get_modpath("mobs").."/bunny.lua")

-- Animals/Kittens from Jordach BFD subgame
dofile(minetest.get_modpath("mobs").."/kitten.lua")

-- Monsters

dofile(minetest.get_modpath("mobs").."/dirtmonster.lua")
dofile(minetest.get_modpath("mobs").."/dungeonmaster.lua")
dofile(minetest.get_modpath("mobs").."/oerkki.lua")
dofile(minetest.get_modpath("mobs").."/sandmonster.lua")
dofile(minetest.get_modpath("mobs").."/stonemonster.lua")
dofile(minetest.get_modpath("mobs").."/treemonster.lua")
dofile(minetest.get_modpath("mobs").."/wolf.lua")

-- Zmobs by Zeg9

dofile(minetest.get_modpath("mobs").."/lava_flan.lua")
dofile(minetest.get_modpath("mobs").."/mese_monster.lua")

-- Spider from Lord of the Test - https://forum.minetest.net/viewtopic.php?pid=127538

dofile(minetest.get_modpath("mobs").."/spider.lua")

-- NPC
dofile(minetest.get_modpath("mobs").."/npc.lua")

-- Creeper (fast impl by davedevils)

dofile(minetest.get_modpath("mobs").."/creeper.lua")

-- Meat & Cooked Meat

minetest.register_craftitem("mobs:meat_raw", {
	description = "Raw Meat",
	inventory_image = "mobs_meat_raw.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("mobs:meat", {
	description = "Meat",
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "mobs:meat_raw",
	cooktime = 5,
})

if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs loaded")
end
