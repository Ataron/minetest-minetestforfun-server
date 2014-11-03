-- NODES


minetest.register_node("seagravel:seagravel", {
	description = "Sea gravel",
	tiles = {"seagravel_seagravel.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_node("seagravel:seagravel_cyan", {
	description = "Sea gravel cyan",
	tiles = {"seagravel_seagravel_cyan.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_node("seagravel:seagravel_magenta", {
	description = "Sea gravel magenta",
	tiles = {"seagravel_seagravel_magenta.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_node("seagravel:seagravel_lime", {
	description = "Sea gravel lime",
	tiles = {"seagravel_seagravel_lime.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_node("seagravel:seagravel_aqua", {
	description = "Sea gravel aqua",
	tiles = {"seagravel_seagravel_aqua.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_node("seagravel:seagravel_skyblue", {
	description = "Sea gravel skyblue",
	tiles = {"seagravel_seagravel_skyblue.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_node("seagravel:seagravel_redviolet", {
	description = "Sea gravel redviolet",
	tiles = {"seagravel_seagravel_redviolet.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})


-- STAIRS


stairs.register_stair_and_slab("seagravel", "seagravel:seagravel",
		{crumbly=2, falling_node=1},
		{"seagravel_seagravel.png"},
		"Seagravel stair",
		"Seagravel slab",
		default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
			on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
}))

stairs.register_stair_and_slab("seagravel_cyan", "seagravel:seagravel_cyan",
		{crumbly=2, falling_node=1},
		{"seagravel_seagravel_cyan.png"},
		"Seagravel stair cyan",
		"Seagravel slab cyan",
		default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
			on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
}))

stairs.register_stair_and_slab("seagravel_magenta", "seagravel:seagravel_magenta",
		{crumbly=2, falling_node=1},
		{"seagravel_seagravel_magenta.png"},
		"Seagravel stair magenta",
		"Seagravel slab magenta",
		default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
			on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
}))

stairs.register_stair_and_slab("seagravel_lime", "seagravel:seagravel_lime",
		{cracky=3, stone=2},
		{"seagravel_seagravel_lime.png"},
		"Seagravel stair lime",
		"Seagravel slab lime",
		default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
			on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
}))

stairs.register_stair_and_slab("seagravel_aqua", "seagravel:seagravel_aqua",
		{crumbly=2, falling_node=1},
		{"seagravel_seagravel_aqua.png"},
		"Seagravel stair aqua",
		"Seagravel slab aqua",
		default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
			on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
}))

stairs.register_stair_and_slab("seagravel_skyblue", "seagravel:seagravel_skyblue",
		{crumbly=2, falling_node=1},
		{"seagravel_seagravel_skyblue.png"},
		"Seagravel stair skyblue ",
		"Seagravel slab skyblue",
		default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
			on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
}))

stairs.register_stair_and_slab("seagravel_redviolet", "seagravel:seagravel_redviolet",
		{crumbly=2, falling_node=1},
		{"seagravel_seagravel_redviolet.png"},
		"Seagravel stair redviolet",
		"Seagravel slab redviolet",
		default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
			on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.env:add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.env:get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
}))


-- CRAFTING


local register_seagravel_craft = function(output,recipe)
    minetest.register_craft({
        type = 'shapeless',
        output = output,
        recipe = recipe,
	})
end

register_seagravel_craft("seagravel:seagravel", {'clams:crushedwhite', 'default:gravel'})

register_seagravel_craft("seagravel:seagravel_cyan", {'seagravel:seagravel', 'dye:cyan'})
register_seagravel_craft("seagravel:seagravel_magenta", {'seagravel:seagravel', 'dye:magenta'})
register_seagravel_craft("seagravel:seagravel_lime", {'seagravel:seagravel', 'dye:lime'})
register_seagravel_craft("seagravel:seagravel_aqua", {'seagravel:seagravel', 'dye:aqua'})
register_seagravel_craft("seagravel:seagravel_skyblue", {'seagravel:seagravel', 'dye:skyblue'})
register_seagravel_craft("seagravel:seagravel_redviolet", {'seagravel:seagravel', 'dye:redviolet'})

register_seagravel_craft("seagravel:seagravel_cyan", {'clams:crushedwhite', 'default:gravel','dye:cyan'})
register_seagravel_craft("seagravel:seagravel_magenta", {'clams:crushedwhite', 'default:gravel','dye:magenta'})
register_seagravel_craft("seagravel:seagravel_lime", {'clams:crushedwhite', 'default:gravel','dye:lime'})
register_seagravel_craft("seagravel:seagravel_aqua", {'clams:crushedwhite', 'default:gravel','dye:aqua'})
register_seagravel_craft("seagravel:seagravel_skyblue", {'clams:crushedwhite', 'default:gravel','dye:skyblue'})
register_seagravel_craft("seagravel:seagravel_redviolet", {'clams:crushedwhite', 'default:gravel','dye:redviolet'})
