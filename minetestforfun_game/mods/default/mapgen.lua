-- mods/default/mapgen.lua

--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_tree", "default:tree")
minetest.register_alias("mapgen_leaves", "default:leaves")
minetest.register_alias("mapgen_jungletree", "default:jungletree")
minetest.register_alias("mapgen_jungleleaves", "default:jungleleaves")
minetest.register_alias("mapgen_apple", "default:apple")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_gravel", "default:gravel")
minetest.register_alias("mapgen_clay", "default:clay")
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_cobble", "default:cobble")
minetest.register_alias("mapgen_mossycobble", "default:mossycobble")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
minetest.register_alias("mapgen_junglegrass", "default:junglegrass")
minetest.register_alias("mapgen_stone_with_coal", "default:stone_with_coal")
minetest.register_alias("mapgen_stone_with_iron", "default:stone_with_iron")
minetest.register_alias("mapgen_mese", "default:mese")
minetest.register_alias("mapgen_desert_sand", "default:desert_sand")
minetest.register_alias("mapgen_desert_stone", "default:desert_stone")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")

--
-- Ore generation
--

function default.register_ores()
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 8,
		clust_size     = 3,
		height_min     = -30000,
		height_max     = 64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_coal",
		wherein        = "default:desert_stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 10,
		clust_size     = 3,
		height_min     = 0,
		height_max     = 64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		height_min     = -30000,
		height_max     = 0,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = -15,
		height_max     = 2,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		height_min     = -63,
		height_max     = -16,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		height_min     = -30000,
		height_max     = -64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 25 * 25 * 25,
		clust_num_ores = 27,
		clust_size     = 6,
		height_min     = -30000,
		height_max     = -64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = -255,
		height_max     = -128,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		height_min     = -1024,
		height_max     = -256,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 20 * 20 * 20,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = -30000,
		height_max     = -1024,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 40 * 40 * 40,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = -1024,
		height_max     = 64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:meze",
		wherein        = "default:stone",
		clust_scarcity = 40 * 40 * 40,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = 0,
		height_max     = 64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:desert_stone",
		clust_scarcity = 40 * 40 * 40,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = -1024,
		height_max     = 64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:meze",
		wherein        = "default:desert_stone",
		clust_scarcity = 40 * 40 * 40,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = 0,
		height_max     = 64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "maptools:superapple",
		wherein        = "default:apple",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 5,
		clust_size     = 2,
		height_min     = 0,
		height_max     = 64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "maptools:superapple",
		wherein        = "default:jungleleaves",
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 5,
		clust_size     = 2,
		height_min     = 0,
		height_max     = 64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coin",
		wherein        = "default:stone",
		clust_scarcity = 26 * 26 * 26,
		clust_num_ores = 1,
		clust_size     = 1,
		height_min     = -30000,
		height_max     = 0,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = -255,
		height_max     = -64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		height_min     = -30000,
		height_max     = -256,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		height_min     = -512,
		height_max     = -256,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		height_min     = -30000,
		height_max     = -512,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		height_min     = -63,
		height_max     = -16,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_copper",
		wherein        = "default:desert_stone",
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 6,
		clust_size     = 3,
		height_min     = 0,
		height_max     = 64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_copper",
		wherein        = "default:stone",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		height_min     = -30000,
		height_max     = -64,
		flags          = "absheight",
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 40,
		clust_size     = 4,
		height_max     = 64,
		height_min     = -30000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 48 * 48 * 48,
		clust_num_ores = 40,
		clust_size     = 4,
		height_max     = 64,
		height_min     = -30000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 30 * 30 * 30,
		clust_num_ores = 64,
		clust_size     = 5,
		height_max     = -1024,
		height_min     = -30000,
	})

	if minetest.setting_get("mg_name") == "indev" then
		-- Floatlands and high mountains springs:
		minetest.register_ore({
			ore_type       = "scatter",
			ore            = "default:water_source",
			ore_param2     = 128,
			wherein        = "default:stone",
			clust_scarcity = 40 *40 *40,
			clust_num_ores = 8,
			clust_size     = 3,
			height_min     = 100,
			height_max     = 30000,
		})

		minetest.register_ore({
			ore_type       = "scatter",
			ore            = "default:lava_source",
			ore_param2     = 128,
			wherein        = "default:stone",
			clust_scarcity = 50 * 50 * 50,
			clust_num_ores = 5,
			clust_size     = 2,
			height_min     = 10000,
			height_max     = 30000,
		})

		minetest.register_ore({
			ore_type       = "scatter",
			ore            = "default:sand",
			wherein        = "default:stone",
			clust_scarcity = 20 * 20 * 20,
			clust_num_ores = 5 * 5 * 3,
			clust_size     = 5,
			height_min     = 500,
			height_max     = 30000,
		})
	end

	-- Underground springs:
		
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:water_source",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 20 * 20 * 20,
		clust_num_ores = 10,
		clust_size     = 4,
		height_min     = -10000,
		height_max     = -10,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:lava_source",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 5,
		clust_size     = 2,
		height_min     = -30000,
		height_max     = -100,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:dirt",
		wherein        = "default:stone",
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 64,
		clust_size     = 5,
		height_max     = 64,
		height_min     = -4096,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:gravel",
		wherein        = "default:stone",
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 64,
		clust_size     = 5,
		height_max     = 64,
		height_min     = -30000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:sand",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 32,
		clust_size     = 4,
		height_max     = 64,
		height_min     = -1024,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:clay",
		wherein        = "default:stone",
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 32,
		clust_size     = 4,
		height_max     = 64,
		height_min     = -1024,
	})


	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:cobble",
		wherein        = "default:stone",
		clust_scarcity = 40 * 40 * 40,
		clust_num_ores = 512,
		clust_size     = 9,
		height_max     = 64,
		height_min     = -4096,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_cobble",
		wherein        = "default:desert_stone",
		clust_scarcity = 40 * 40 * 40,
		clust_num_ores = 512,
		clust_size     = 9,
		height_max     = 64,
		height_min     = 0,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:clay",
		wherein        = "default:sand",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 64,
		clust_size     = 5,
		height_max     = 4,
		height_min     = -8,
	})

	-- Air rooms in dirt:

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "air",
		wherein        = "default:dirt",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 200,
		clust_size     = 7,
		height_min     = -30000,
		height_max     = 64,
	})

	-- Acid lakes in gravel:

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:acid_source",
		wherein        = "default:gravel",
		clust_scarcity = 20 * 20 * 20,
		clust_num_ores = 64,
		clust_size     = 5,
		height_min     = -30000,
		height_max     = 64,
	})

	-- Ice pools in stone:

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:ice",
		wherein        = "default:stone",
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 200,
		clust_size     = 6,
		height_min     = -30000,
		height_max     = 64,
	})
end

function default.generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, chunk_size, ore_per_chunk, height_min, height_max)
	minetest.log("action", "WARNING: default.generate_ore is deprecated")

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
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i= 1, num_chunks do
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y =y0, z=z0}
			for x1= 0,chunk_size - 1 do
			for y1= 0,chunk_size - 1 do
			for z1= 0,chunk_size - 1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y =y2, z=z2}
					if minetest.get_node(p2).name == wherein then
						minetest.set_node(p2, {name = name})
					end
				end
			end
			end
			end
		end
	end
	--print("generate_ore done")
end

function default.make_papyrus(pos, size)
	for y = 0, size - 1 do
		local p = {x= pos.x, y = pos.y + y, z= pos.z}
		local nn = minetest.get_node(p).name
		if minetest.registered_nodes[nn] and
			minetest.registered_nodes[nn].buildable_to then
			minetest.set_node(p, {name = "default:papyrus"})
		else
			return
		end
	end
end

function default.make_cactus(pos, size)
	for y = 0, size-1 do
		local p = {x= pos.x, y = pos.y + y, z= pos.z}
		local nn = minetest.get_node(p).name
		if minetest.registered_nodes[nn] and
			minetest.registered_nodes[nn].buildable_to then
			minetest.set_node(p, {name = "default:cactus"})
		else
			return
		end
	end
end

-- facedir: 0/1/2/3 (head node facedir value)
-- length: length of rainbow tail
function default.make_nyancat(pos, facedir, length)
	local tailvec = {x= 0, y = 0, z= 0}
	if facedir == 0 then
		tailvec.z = 1
	elseif facedir == 1 then
		tailvec.x = 1
	elseif facedir == 2 then
		tailvec.z = -1
	elseif facedir == 3 then
		tailvec.x = -1
	else
		--print("default.make_nyancat(): Invalid facedir: "+dump(facedir))
		facedir = 0
		tailvec.z = 1
	end
	local p = {x= pos.x, y = pos.y, z= pos.z}
	minetest.set_node(p, {name = "default:nyancat", param2 = facedir})
	-- minetest.log("action", "Generated a nyan cat at " .. minetest.pos_to_string(p) .. ".")
	for i= 1,length do
		p.x = p.x + tailvec.x
		p.z = p.z + tailvec.z
		minetest.set_node(p, {name = "default:nyancat_rainbow", param2 = facedir})
	end
end

function generate_nyancats(seed, minp, maxp)
	local height_min = -30000
	local height_max = 30000
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_nyancats = math.floor(volume / (15 * 15 * 15))
	for i= 1,max_num_nyancats do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x=x0, y =y0, z=z0}
			default.make_nyancat(p0, pr:next(0,3), 10)
		end
	end
end

minetest.register_on_generated(function(minp, maxp, seed)
	if maxp.y >= 2 and minp.y <= 0 then
		-- Generate papyrus
		local perlin1 = minetest.get_perlin(354, 3, 0.7, 100)
		-- Assume X and Z lengths are equal
		local divlen = 8
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx= 0, divs-1 do
		for divz= 0, divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine papyrus amount from perlin noise
			local papyrus_amount = math.floor(perlin1:get2d({x=x0, y =z0}) * 45 - 20)
			-- Find random positions for papyrus based on this random
			local pr = PseudoRandom(seed+1)
			for i= 0,papyrus_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				if minetest.get_node({x=x,y = 1,z=z}).name == "default:dirt_with_grass" and
						minetest.find_node_near({x=x,y = 1,z=z}, 1, "default:water_source") then
					default.make_papyrus({x=x,y = 2,z=z}, 4)
				end
			end
		end
		end
		-- Generate cactuses
		local perlin1 = minetest.get_perlin(230, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx= 0, divs-1 do
		for divz= 0, divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine cactus amount from perlin noise
			local cactus_amount = math.floor(perlin1:get2d({x=x0, y =z0}) * 6 - 3)
			-- Find random positions for cactus based on this random
			local pr = PseudoRandom(seed+1)
			for i= 0,cactus_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				for y = 30,0,-1 do
					if minetest.get_node({x=x,y =y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end
				-- If desert sand, make cactus
				if ground_y and minetest.get_node({x = x, y = ground_y, z = z}).name == "default:desert_sand" then
					default.make_cactus({x=x,y =ground_y+1,z=z}, 4)
				end
			end
		end
		end
		-- Generate grass
		local perlin1 = minetest.get_perlin(329, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx= 0, divs-1 do
		for divz= 0, divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine grass amount from perlin noise
			local grass_amount = math.floor(perlin1:get2d({x=x0, y =z0}) ^ 3 * 9)
			-- Find random positions for grass based on this random
			local pr = PseudoRandom(seed+1)
			for i= 0,grass_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				for y = 30,0,-1 do
					if minetest.get_node({x=x,y =y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end
				
				if ground_y then
					local p = {x=x,y =ground_y+1,z=z}
					local nn = minetest.get_node(p).name
					-- Check if the node can be replaced
					if minetest.registered_nodes[nn] and
						minetest.registered_nodes[nn].buildable_to then
						nn = minetest.get_node({x=x,y =ground_y,z=z}).name
						-- If desert sand, add dry shrub
						if nn == "default:desert_sand" then
							minetest.set_node(p,{name = "default:dry_shrub"})
							
						-- If dirt with grass, add grass
						elseif nn == "default:dirt_with_grass" then
							minetest.set_node(p,{name = "default:grass_" .. pr:next(1, 5)})
						end
					end
				end
				
			end
		end
		end
	end

	-- Generate nyan cats
	generate_nyancats(seed, minp, maxp)
end)

--
-- Register biomes
--

function default.register_biomes()
	minetest.clear_registered_biomes()

	minetest.register_biome({
		name = "grassland",
		node_top = "default:dirt_with_grass",
		node_shore_top = "default:sand",
		depth_top = 1,
		node_filler = "default:dirt",
		node_shore_filler = "default:sand",
		depth_filler = 2,
		height_shore = 3,
		node_underwater = "default:sand",
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_dust = "",
		y_min = -31000,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 50,
	})

	--
	-- Register decorations
	--

	-- Flowers

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "flowers:rose",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 19822,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "flowers:tulip",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 1220999,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "flowers:dandelion_yellow",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 36662,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "flowers:geranium",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 1133,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "flowers:viola",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 73133,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "flowers:dandelion_white",
	})

	-- Grasses

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.08,
			spread = {x=100, y=100, z=100},
			seed = 66440,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "default:grass_1",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.02,
			scale = 0.08,
			spread = {x=100, y=100, z=100},
			seed = 66440,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "default:grass_2",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.08,
			spread = {x=100, y=100, z=100},
			seed = 66440,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "default:grass_3",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.08,
			spread = {x=100, y=100, z=100},
			seed = 66440,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "default:grass_4",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.04,
			scale = 0.08,
			spread = {x=100, y=100, z=100},
			seed = 66440,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -31000,
		y_max = 31000,
		decoration = "default:grass_5",
	})
end

--
-- Register blob ore
--

function default.register_blobs()
	minetest.register_ore({ 
		ore_type         = "blob",
		ore              = "default:sand",
		wherein          = {"default:stone"},
		clust_scarcity   = 24*24*24,
		clust_size       = 7,
		y_min            = -63,
		y_max            = 4,
		noise_threshhold = 0,
		noise_params     = {
			offset=0.35,
			scale=0.2,
			spread={x=5, y=5, z=5},
			seed=2316,
			octaves=1,
			persist=0.5
		},
	})

	minetest.register_ore({
		ore_type         = "blob",
		ore              = "default:dirt",
		wherein          = {"default:stone"},
		clust_scarcity   = 24*24*24,
		clust_size       = 7,
		y_min            = -63,
		y_max            = 31000,
		noise_threshhold = 0,
		noise_params     = {
			offset=0.35,
			scale=0.2,
			spread={x=5, y=5, z=5},
			seed=17676,
			octaves=1,
			persist=0.5
		},
	})

	minetest.register_ore({
		ore_type         = "blob",
		ore              = "default:gravel",
		wherein          = {"default:stone"},
		clust_scarcity   = 24*24*24,
		clust_size       = 7,
		y_min            = -31000,
		y_max            = 31000,
		noise_threshhold = 0,
		noise_params     = {
			offset=0.35,
			scale=0.2,
			spread={x=5, y=5, z=5},
			seed=766,
			octaves=1,
			persist=0.5
		},
	})
end

--
-- Detect mapgen and select suitable biome code
--

local mg_params = minetest.get_mapgen_params()
if mg_params.mgname == "v5" then
	default.register_biomes()
	default.register_blobs()
	default.register_ores()
elseif mg_params.mgname == "v6" then
	minetest.register_on_generated(default.mgv6_ongen)
	default.register_ores()
elseif mg_params.mgname == "v7" then
	default.register_biomes()
	default.register_blobs()
	default.register_ores()
end

