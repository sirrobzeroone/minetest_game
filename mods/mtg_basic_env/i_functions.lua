----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
----------------------------------------------------
--             MTG Basic Environment              --
----------------------------------------------------
--                   Functions                    --
----------------------------------------------------

-- support for translation.
local S = mtg_basic_env.translator

-----------
-- Index --
-----------
	-- Line 22 - Lava cooling - ABM 

	-- Line 52 - Grass spreading - ABM
	
	-- Line 96 - Grasses removed in dark - ABM
	
	-- Line 125 - Grow moss on cobble - ABM

-----------------
-- Lavacooling --
-----------------

mtg_basic_env.cool_lava = function(pos, node)
	if node.name == "mtg_basic_env:lava_source" then
		minetest.set_node(pos, {name = "mtg_basic_env:obsidian"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "mtg_basic_env:stone"})
	end
	minetest.sound_play("default_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
end

if minetest.settings:get_bool("enable_lavacooling") ~= false then
	minetest.register_abm({
		label = "Lava cooling",
		nodenames = {"mtg_basic_env:lava_source", "mtg_basic_env:lava_flowing"},
		neighbors = {"group:cools_lava", "group:water"},
		interval = 2,
		chance = 2,
		catch_up = false,
		action = function(...)
			mtg_basic_env.cool_lava(...)
		end,
	})
end


---------------------------------------------------------------------
-- Convert mtg_basic_env:dirt to something that fits the environment --
-----------------------------------------------------------------------
minetest.register_abm({
	label = "Grass spread",
	nodenames = {"mtg_basic_env:dirt"},
	neighbors = {
		"air",
		"group:grass",
		"group:dry_grass",
		"mtg_basic_env:snow",
	},
	interval = 6,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		-- Check for darkness: night, shadow or under a light-blocking node
		-- Returns if ignore above
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for spreading dirt-type neighbours
		local p2 = minetest.find_node_near(pos, 1, "group:spreading_dirt_type")
		if p2 then
			local n3 = minetest.get_node(p2)
			minetest.set_node(pos, {name = n3.name})
			return
		end

		-- Else, any seeding nodes on top?
		local name = minetest.get_node(above).name
		-- Snow check is cheapest, so comes first
		if name == "mtg_basic_env:snow" then
			minetest.set_node(pos, {name = "mtg_basic_env:dirt_snow"})
		elseif minetest.get_item_group(name, "grass") ~= 0 then
			minetest.set_node(pos, {name = "mtg_basic_env:dirt_grass"})
		elseif minetest.get_item_group(name, "dry_grass") ~= 0 then
			minetest.set_node(pos, {name = "mtg_basic_env:dirt_grass_dry"})
		end
	end
})

---------------------------------------------
-- Grass and dry grass removed in darkness --
---------------------------------------------

minetest.register_abm({
	label = "Grass covered",
	nodenames = {"group:spreading_dirt_type", "mtg_basic_env:dirt_dry_grass_dry"},
	interval = 8,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			if node.name == "mtg_basic_env:dirt_dry_grass_dry" then
				minetest.set_node(pos, {name = "mtg_basic_env:dirt_dry"})
			else
				minetest.set_node(pos, {name = "mtg_basic_env:dirt"})
			end
		end
	end
})


--------------------------------------
-- Moss growth on cobble near water --
--------------------------------------

local moss_correspondences = {
	["mtg_basic_env:cobble"] = "mtg_basic_env:cobble_mossy",
	["stairs:slab_cobble"] = "stairs:slab_mossycobble",
	["stairs:stair_cobble"] = "stairs:stair_mossycobble",
	["stairs:stair_inner_cobble"] = "stairs:stair_inner_mossycobble",
	["stairs:stair_outer_cobble"] = "stairs:stair_outer_mossycobble",
	["walls:cobble"] = "walls:mossycobble",
}
minetest.register_abm({
	label = "Moss growth",
	nodenames = {"mtg_basic_env:cobble", "stairs:slab_cobble", "stairs:stair_cobble",
		"stairs:stair_inner_cobble", "stairs:stair_outer_cobble",
		"walls:cobble"},
	neighbors = {"group:water"},
	interval = 16,
	chance = 200,
	catch_up = false,
	action = function(pos, node)
		node.name = moss_correspondences[node.name]
		if node.name then
			minetest.set_node(pos, node)
		end
	end
})
