-- mods/default/Legacy.lua

-- Horrible crap to support old code,
-- don't use this and never do what this does, it's completely wrong!
-- (more specifically, the client and the C++ code doesn't get the group).
function default.register_falling_node(nodename, texture)
	minetest.log("error", debug.traceback())
	minetest.log("error", "WARNING: default.register_falling_node is deprecated.")
	if minetest.registered_nodes[nodename] then
		minetest.registered_nodes[nodename].groups.falling_node = 1
	end
end

function default.spawn_falling_node(p, nodename)
	spawn_falling_node(p, nodename)
end

-- Liquids
WATER_ALPHA = minetest.registered_nodes["default:water_source"].alpha
WATER_ALPHA = minetest.registered_nodes["default:water_source"].liquid_viscosity
WATER_ALPHA = minetest.registered_nodes["default:lava_source"].liquid_viscosity
LIGHT_MAX = default.LIGHT_MAX

-- Formspecs
default.gui_survival_form = default.gui_survival_form