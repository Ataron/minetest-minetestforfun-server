-- NODES


minetest.register_node("seawrecks:woodship", {
	description = "Sand for the wooden ship",
	tiles = {"default_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, soil=1, not_in_creative_inventory=1},
	sounds = default.node_sound_sand_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
     		if not pointed_thing.type == "node" then
			return itemstack
		end
		local pn = placer:get_player_name()
		if minetest.is_protected(pointed_thing.above, pn) then
			return itemstack
		end
		minetest.add_node(pointed_thing.above, {name=itemstack:get_name()})
		local meta = minetest.get_meta(pointed_thing.above)
		meta:set_string("owner", pn)
		nodeupdate(pointed_thing.above)
		if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_node("seawrecks:uboot", {
	description = "Dirt for the U-boot",
	tiles = {"default_dirt.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1, not_in_creative_inventory=1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("seawrecks:woodshipchest", {
	description = "Wooden ship chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=1},
	drop = 'default:chest',
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]"..
			"list[current_name;main;0,0;8,4;]"..
			"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Woodship chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
meta:from_table({
	inventory = {
	main = {[1] = "default:tree 99", [2] = "default:jungletree 99", [3] = "default:wood 99", [4] = "default:junglewood 99", [5] = "default:sapling 99", [6] = "default:junglesapling 99", [7] = "default:grass_1 99", [8] = "default:junglegrass 99", [32] = ""}
	},
	fields = {
	formspec = "size[8,9;]list[context;main;0,0;8,4;]list[current_player;main;0,5;8,4;]",
	infotext = "Normal chest"
	}
})
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_node("seawrecks:ubootchest", {
	description = "U-boot chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=1},
	drop = 'default:chest',
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		
		local kind_of_price = math.floor(math.random()*2)
    local amount_of_price = math.floor(math.random()*20)+1
    local ingot_price = {"default:steel_ingot","default:copper_ingot","default:gold_ingot","moreores:tin_ingot","moreores:silver_ingot"}
    local price_group = {"",""}
    local choosen_ingot = math.floor(math.random()*10)+1
    price_group[1] = ingot_price[choosen_ingot].." "..amount_of_price
    if (kind_of_price == 0) then -- Ingots AND mese
      price_group[2] = "default:mese_crystal "..math.floor(math.random()*6)+1
    elseif (kind_of_price == 1) then -- Ingots AND diamond
      price_group[2] = "default:diamond "..math.floor(math.random()*4)+1
    else
      price_group[2] = ""
    end
 
		meta:set_string("formspec",
			"size[8,9]"..
			"list[current_name;main;0,0;8,4;]"..
			"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "U-boot chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
meta:from_table({
	inventory = {
	main = {[1] = price_group[1], [2] = price_group[2], [32] = ""}
	--main = {[1] = "default:wood", [2] = "default:tree", [32] = ""}
	},
	fields = {
	formspec = "size[8,9;]list[context;main;0,0;8,4;]list[current_player;main;0,5;8,4;]",
	infotext = "Normal chest"
	}
})
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})


-- WRECK GENERATION


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "seawrecks:woodship",
	wherein        = "default:sand",
	clust_scarcity = 30*30*30,
	clust_num_ores = 1,
	clust_size     = 12,
	height_max     = -4,
	height_min     = -31000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "seawrecks:uboot",
	wherein        = "default:dirt",
	clust_scarcity = 30*30*30,
	clust_num_ores = 1,
	clust_size     = 12,
	height_max     = -8,
	height_min     = -31000,
})

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, chunk_size, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	if chunk_size >= y_max - y_min + 1 then
		return
	end
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	for i=1,num_chunks do
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.get_node(p2).name == wherein then
						minetest.set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
end


-- ABM'S


minetest.register_abm({
nodenames = {"seawrecks:woodship"},
interval = 1,
chance = 1,
action = function(pos, node, active_object_count, active_object_count_wider)
local yp = {x = pos.x, y = pos.y + 3, z = pos.z}
	if minetest.get_node(pos).name == "seawrecks:woodship" and 
	(minetest.get_node(yp).name == "default:water_source" or
	minetest.get_node(yp).name == "noairblocks:water_sourcex") then
		minetest.add_node(pos, {name = "default:sand"})

		pos.y = pos.y + 1
		pos.x = pos.x - 6

		for a = 1, 11 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:tree"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x - 10

		for a = 1, 9 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:tree"})
		end

		pos.z = pos.z - 2
		pos.x = pos.x - 9

		for a = 1, 9 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:tree"})
		end


		pos.y = pos.y + 1
		pos.x = pos.x - 8
		pos.z = pos.z - 1

		for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:tree"})
		end

		pos.z = pos.z + 4
		pos.x = pos.x - 7

		for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:tree"})
		end

		pos.z = pos.z - 1
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z - 1
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:tree"})

		pos.z = pos.z - 1
		pos.x = pos.x - 2
		minetest.add_node(pos, {name = "default:tree"})

		pos.z = pos.z + 2
		pos.x = pos.x - 8
		minetest.add_node(pos, {name = "default:tree"})

		pos.z = pos.z - 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:tree"})

		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:tree"})

		pos.z = pos.z - 1
		pos.x = pos.x + 2
		minetest.add_node(pos, {name = "default:tree"})


		pos.y = pos.y + 1
		pos.z = pos.z - 1

		for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.z = pos.z + 4
		pos.x = pos.x - 7

		for a = 1, 7 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.z = pos.z - 1
		pos.x = pos.x + 1	
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z - 1
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z - 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z + 2
		pos.x = pos.x - 8
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z - 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})

		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.z = pos.z - 1
		pos.x = pos.x + 4
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z + 1
		pos.x = pos.x + 3
		minetest.add_node(pos, {name = "default:wood"})

		pos.y = pos.y + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.y = pos.y - 2
		minetest.add_node(pos, {name = "default:wood"})

		pos.y = pos.y + 3
		pos.z = pos.z - 4

		for a = 1, 7 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.z = pos.z - 3

		for a = 1, 2 do
		pos.y = pos.y + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.y = pos.y + 1
		pos.z = pos.z - 3

		for a = 1, 5 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.y = pos.y + 1
		pos.z = pos.z - 2
		minetest.add_node(pos, {name = "default:wood"})

		pos.y = pos.y - 7
		pos.z = pos.z + 1
		pos.x = pos.x - 2
		minetest.add_node(pos, {name = "seawrecks:woodshipchest"})

	else
		return
	end
end
})

minetest.register_abm({
nodenames = {"seawrecks:uboot"},
interval = 1,
chance = 1,
action = function(pos, node, active_object_count, active_object_count_wider)
local yp = {x = pos.x, y = pos.y + 8, z = pos.z}
	if minetest.get_node(pos).name == "seawrecks:uboot" and 
	(minetest.get_node(yp).name == "default:water_source" or
	minetest.get_node(yp).name == "noairblocks:water_sourcex") then
		minetest.add_node(pos, {name = "default:dirt"})

		pos.y = pos.y + 1
		pos.x = pos.x - 15

		for a = 1, 31 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:cobble"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x + 1

		for a = 1, 31 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:cobble"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x +1

		for a = 1, 27 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z - 3
		pos.x = pos.x + 1

		for a = 1, 27 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z - 1
		pos.x = pos.x + 2

		for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z + 5
		pos.x = pos.x + 1

		for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.y = pos.y + 1
		pos.z = pos.z + 1
		pos.x = pos.x - 1

		for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z - 7
		pos.x = pos.x + 1

		for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 24
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 5
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 22
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z - 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 29
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z - 3
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 28
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 32
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 32
		minetest.add_node(pos, {name = "default:stone"})

		pos.y = pos.y + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.x = pos.x + 32
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.x = pos.x - 32
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z - 1
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.x = pos.x + 28
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z + 3
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.x = pos.x - 28
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z + 1
		pos.x = pos.x + 2
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.x = pos.x + 22
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z + 1
		pos.x = pos.x - 2
		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})

		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})

		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})

		for a = 1, 9 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.z = pos.z - 6
		pos.x = pos.x - 3
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.x = pos.x + 22
		minetest.add_node(pos, {name = "default:wood"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})

		pos.z = pos.z - 1
		pos.x = pos.x - 2

		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})

		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})

		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:obsidian_glass"})

		for a = 1, 9 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.y = pos.y + 1
		pos.z = pos.z + 7
		pos.x = pos.x - 1
		for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z - 7
		pos.x = pos.x + 1

		for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 24
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 5
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 22
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z - 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 29
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z - 3
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 28
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 1
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 32
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 32
		minetest.add_node(pos, {name = "default:stone"})

		pos.y = pos.y + 1
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 28
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 28
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z - 1
		pos.x = pos.x + 2
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x + 22
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 3
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.x = pos.x - 22
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})

		pos.z = pos.z + 1
		pos.x = pos.x + 2
		for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z - 5
		pos.x = pos.x + 1
		for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.y = pos.y + 1
		pos.z = pos.z + 2
		pos.x = pos.x - 4
		for a = 1, 3 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.x = pos.x + 21
		for a = 1, 3 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x + 1
		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.x = pos.x - 21
		for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z + 2
		pos.x = pos.x + 3
		for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z - 1
		pos.x = pos.x + 1
		for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.x = pos.x + 6
		for a = 1, 13 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z - 3
		pos.x = pos.x + 1
		for a = 1, 13 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:stone"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x - 1
		for a = 1, 13 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:tree"})
		end

		pos.z = pos.z + 1
		pos.x = pos.x + 1
		for a = 1, 13 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:tree"})
		end

		pos.z = pos.z - 3
		for a = 1, 6 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.z = pos.z + 5
		pos.x = pos.x - 1
		for a = 1, 6 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.y = pos.y + 1
		for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 5
		pos.z = pos.z - 1
		for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		for a = 1, 4 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x + 1
		pos.z = pos.z - 3
		for a = 1, 4 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.y = pos.y + 1
		pos.x = pos.x - 1
		pos.z = pos.z - 1
		for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x + 5
		pos.z = pos.z + 1
		for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		for a = 1, 4 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		pos.z = pos.z + 3
		for a = 1, 4 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.y = pos.y + 1
		pos.x = pos.x - 1
		pos.z = pos.z - 1
		for a = 1, 2 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.x = pos.x - 1
		pos.z = pos.z - 1
		for a = 1, 2 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "default:wood"})
		end

		pos.y = pos.y - 7
		pos.x = pos.x +16
		pos.z = pos.z +3
		minetest.set_node(pos, {name = "seawrecks:ubootchest"})

	else
		return
	end
end
})
