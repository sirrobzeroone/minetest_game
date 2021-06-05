----------------------------------------------------
--      ___     _                   _   _         --
--     / __| __| |_  ___ _ __  __ _| |_(_)__      --
--     \__ \/ _| ' \/ -_) '  \/ _` |  _| / _|     --
--     |___/\__|_||_\___|_|_|_\__,_|\__|_\__|     --
--   ___                      _   _               --
--  |   \ ___ __ ___ _ _ __ _| |_(_)___ _ _  ___  --
--  | |) / -_) _/ _ \ '_/ _` |  _| / _ \ ' \(_-<  --
--  |___/\___\__\___/_| \__,_|\__|_\___/_||_/__/  --
----------------------------------------------------
--           MTG Decorations Schematic            --
----------------------------------------------------
--                   Functions                    --
----------------------------------------------------

-- support for translation.
local S = mtg_decor_schema.translator

-----------
-- Index --
-----------
	-- line 26 - Grow trees from saplings - mtg_decor_schema.grow_sapling(pos)
		-- line 31 - Can grow (check light, soil below)
		-- line 50 - Snow nearby
		-- line 57 - Grow Sapling

	-- line 128 - Tree Placement/Growth - mtg_decor_schema.grow_new_<tree_name>(pos)
		-- line 129 to 212 - Trees
		-- line 217 to 264 - Bushes/Cactus
		
	-- line 270 - On place sapling protection check
		-- mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,sapling_name, minp_relative, maxp_relative, interval)
		
	-- line 340 - Leaf decay - mtg_decor_schema.register_leafdecay(def)
	
	-- line 436 - Papyrus and Cactus growing - ABM
	
	-- line 543 - Dig Up - used by mtg_decor_schema:papyrus
	
------------------------------
-- Grow trees from saplings --
------------------------------
local random = math.random

-- 'can grow' function

function mtg_decor_schema.can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	if minetest.get_item_group(node_under.name, "soil") == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end


-- 'is snow nearby' function

local function is_snow_nearby(pos)
	return minetest.find_node_near(pos, 1, {"group:snowy"})
end


-- Grow sapling

function mtg_decor_schema.grow_sapling(pos)
	if not mtg_decor_schema.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	end

	local mg_name = minetest.get_mapgen_setting("mg_name")
	local node = minetest.get_node(pos)
	if node.name == "mtg_decor_schema:apple_tree_sapling" then
		minetest.log("action", "A sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		if mg_name == "v6" then
			mtg_decor_schema.grow_tree(pos, random(1, 4) == 1)
		else
			mtg_decor_schema.grow_new_apple_tree(pos)
		end
	elseif node.name == "mtg_decor_schema:jungle_tree_sapling" then
		minetest.log("action", "A jungle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		if mg_name == "v6" then
			mtg_decor_schema.grow_jungle_tree(pos)
		else
			mtg_decor_schema.grow_new_jungle_tree(pos)
		end
	elseif node.name == "mtg_decor_schema:pine_tree_sapling" then
		minetest.log("action", "A pine sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		local snow = is_snow_nearby(pos)
		if mg_name == "v6" then
			mtg_decor_schema.grow_pine_tree(pos, snow)
		elseif snow then
			mtg_decor_schema.grow_new_snowy_pine_tree(pos)
		else
			mtg_decor_schema.grow_new_pine_tree(pos)
		end
	elseif node.name == "mtg_decor_schema:acacia_tree_sapling" then
		minetest.log("action", "An acacia sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		mtg_decor_schema.grow_new_acacia_tree(pos)
	elseif node.name == "mtg_decor_schema:aspen_tree_sapling" then
		minetest.log("action", "An aspen sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		mtg_decor_schema.grow_new_aspen_tree(pos)
	elseif node.name == "mtg_decor_schema:bush_sapling" then
		minetest.log("action", "A bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		mtg_decor_schema.grow_bush(pos)
	elseif node.name == "mtg_decor_schema:blueberry_bush_sapling" then
		minetest.log("action", "A blueberry bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		mtg_decor_schema.grow_blueberry_bush(pos)
	elseif node.name == "mtg_decor_schema:acacia_bush_sapling" then
		minetest.log("action", "An acacia bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		mtg_decor_schema.grow_acacia_bush(pos)
	elseif node.name == "mtg_decor_schema:pine_bush_sapling" then
		minetest.log("action", "A pine bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		mtg_decor_schema.grow_pine_bush(pos)
	elseif node.name == "mtg_decor_schema:jungle_tree_sapling_emergent" then
		minetest.log("action", "An emergent jungle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		mtg_decor_schema.grow_new_emergent_jungle_tree(pos)
	end
end

---------------------------
-- Tree Placement/Growth --
---------------------------

-- New apple tree

function mtg_decor_schema.grow_new_apple_tree(pos)
	local path = mtg_decor_schema.schematics.apple_tree_sapling
	minetest.place_schematic({x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},
		path, "random", nil, false)
end


-- New jungle tree

function mtg_decor_schema.grow_new_jungle_tree(pos)
	local path = mtg_decor_schema.schematics.jungle_tree_sapling
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New emergent jungle tree

function mtg_decor_schema.grow_new_emergent_jungle_tree(pos)
	local path = mtg_decor_schema.schematics.jungle_tree_emergent_sapling
	minetest.place_schematic({x = pos.x - 3, y = pos.y - 5, z = pos.z - 3},
		path, "random", nil, false)
end


-- New pine tree

function mtg_decor_schema.grow_new_pine_tree(pos)
	local path
	if math.random() > 0.5 then
		path = mtg_decor_schema.schematics.pine_tree_sapling
	else
		path = mtg_decor_schema.schematics.pine_tree_small_sapling
	end
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, false)
end


-- New snowy pine tree

function mtg_decor_schema.grow_new_snowy_pine_tree(pos)
	local path
	if math.random() > 0.5 then
		path = mtg_decor_schema.schematics.pine_tree_sapling_snowy
	else
		path = mtg_decor_schema.schematics.pine_tree_small_sapling_snowy
	end
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New acacia tree

function mtg_decor_schema.grow_new_acacia_tree(pos)
	local path = mtg_decor_schema.schematics.acacia_tree_sapling
	minetest.place_schematic({x = pos.x - 4, y = pos.y - 1, z = pos.z - 4},
		path, "random", nil, false)
end


-- New aspen tree

function mtg_decor_schema.grow_new_aspen_tree(pos)
	local path = mtg_decor_schema.schematics.aspen_tree_sapling
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, false)
end


-- Bushes do not need 'from sapling' schematic variants because
-- only the stem node is force-placed in the schematic.

-- Bush

function mtg_decor_schema.grow_bush(pos)
	local path = mtg_decor_schema.schematics.bush
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end

-- Blueberry bush

function mtg_decor_schema.grow_blueberry_bush(pos)
	local path = mtg_decor_schema.schematics.blueberry_bush
	minetest.place_schematic({x = pos.x - 1, y = pos.y, z = pos.z - 1},
		path, "0", nil, false)
end


-- Acacia bush

function mtg_decor_schema.grow_acacia_bush(pos)
	local path = mtg_decor_schema.schematics.acacia_bush
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end


-- Pine bush

function mtg_decor_schema.grow_pine_bush(pos)
	local path = mtg_decor_schema.schematics.pine_bush
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end


-- Large cactus

function mtg_decor_schema.grow_large_cactus(pos)
	local path = mtg_decor_schema.schematics.cactus_large
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


---------------------------------------------------------------------------------------
-- Sapling 'on place' function to check protection of node and resulting tree volume --
---------------------------------------------------------------------------------------

function mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
		sapling_name, minp_relative, maxp_relative, interval)
	-- Position of sapling
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local pdef = node and minetest.registered_nodes[node.name]

	if pdef and pdef.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
	end

	if not pdef or not pdef.buildable_to then
		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		pdef = node and minetest.registered_nodes[node.name]
		if not pdef or not pdef.buildable_to then
			return itemstack
		end
	end

	local player_name = placer and placer:get_player_name() or ""
	-- Check sapling position for protection
	if minetest.is_protected(pos, player_name) then
		minetest.record_protection_violation(pos, player_name)
		return itemstack
	end
	-- Check tree volume for protection
	if minetest.is_area_protected(
			vector.add(pos, minp_relative),
			vector.add(pos, maxp_relative),
			player_name,
			interval) then
		minetest.record_protection_violation(pos, player_name)
		-- Print extra information to explain
--		minetest.chat_send_player(player_name,
--			itemstack:get_definition().description .. " will intersect protection " ..
--			"on growth")
		minetest.chat_send_player(player_name,
		    S("@1 will intersect protection on growth.",
			itemstack:get_definition().description))
		return itemstack
	end

	minetest.log("action", player_name .. " places node "
			.. sapling_name .. " at " .. minetest.pos_to_string(pos))

	local take_item = not (creative and creative.is_enabled_for
		and creative.is_enabled_for(player_name))
	local newnode = {name = sapling_name}
	local ndef = minetest.registered_nodes[sapling_name]
	minetest.set_node(pos, newnode)

	-- Run callback
	if ndef and ndef.after_place_node then
		-- Deepcopy place_to and pointed_thing because callback can modify it
		if ndef.after_place_node(table.copy(pos), placer,
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	-- Run script hook
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Deepcopy pos, node and pointed_thing because callback can modify them
		if callback(table.copy(pos), table.copy(newnode),
				placer, table.copy(node or {}),
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	if take_item then
		itemstack:take_item()
	end

	return itemstack
end

---------------
-- Leafdecay --
--------------

-- Prevent decay of placed leaves

mtg_decor_schema.after_place_leaves = function(pos, placer, itemstack, pointed_thing)
	if placer and placer:is_player() then
		local node = minetest.get_node(pos)
		node.param2 = 1
		minetest.set_node(pos, node)
	end
end

-- Leafdecay
local function leafdecay_after_destruct(pos, oldnode, def)
	for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, def.radius),
			vector.add(pos, def.radius), def.leaves)) do
		local node = minetest.get_node(v)
		local timer = minetest.get_node_timer(v)
		if node.param2 ~= 1 and not timer:is_started() then
			timer:start(math.random(20, 120) / 10)
		end
	end
end

local movement_gravity = tonumber(
	minetest.settings:get("movement_gravity")) or 9.81

local function leafdecay_on_timer(pos, def)
	if minetest.find_node_near(pos, def.radius, def.trunks) then
		return false
	end

	local node = minetest.get_node(pos)
	local drops = minetest.get_node_drops(node.name)
	for _, item in ipairs(drops) do
		local is_leaf
		for _, v in pairs(def.leaves) do
			if v == item then
				is_leaf = true
			end
		end
		if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
				not is_leaf then
			minetest.add_item({
				x = pos.x - 0.5 + math.random(),
				y = pos.y - 0.5 + math.random(),
				z = pos.z - 0.5 + math.random(),
			}, item)
		end
	end

	minetest.remove_node(pos)
	minetest.check_for_falling(pos)

	-- spawn a few particles for the removed node
	minetest.add_particlespawner({
		amount = 8,
		time = 0.001,
		minpos = vector.subtract(pos, {x=0.5, y=0.5, z=0.5}),
		maxpos = vector.add(pos, {x=0.5, y=0.5, z=0.5}),
		minvel = vector.new(-0.5, -1, -0.5),
		maxvel = vector.new(0.5, 0, 0.5),
		minacc = vector.new(0, -movement_gravity, 0),
		maxacc = vector.new(0, -movement_gravity, 0),
		minsize = 0,
		maxsize = 0,
		node = node,
	})
end

function mtg_decor_schema.register_leafdecay(def)
	assert(def.leaves)
	assert(def.trunks)
	assert(def.radius)
	for _, v in pairs(def.trunks) do
		minetest.override_item(v, {
			after_destruct = function(pos, oldnode)
				leafdecay_after_destruct(pos, oldnode, def)
			end,
		})
	end
	for _, v in pairs(def.leaves) do
		minetest.override_item(v, {
			on_timer = function(pos)
				leafdecay_on_timer(pos, def)
			end,
		})
	end
end

--------------------------------
-- Papyrus and Cactus growing --
--------------------------------

-- Wrapping the functions in ABM action is necessary to make overriding them possible

function mtg_decor_schema.grow_cactus(pos, node)
	if node.param2 >= 4 then
		return
	end
	pos.y = pos.y - 1
	if minetest.get_item_group(minetest.get_node(pos).name, "sand") == 0 then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "mtg_decor_schema:cactus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "mtg_decor_schema:cactus"})
	return true
end

function mtg_decor_schema.grow_papyrus(pos, node)
	--alias check
	local dirt = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
	local dirt_dry = minetest.registered_aliases["mtg_basic_env:dirt_dry"] or "mtg_basic_env:dirt_dry"
	local dirt_grass = minetest.registered_aliases["mtg_basic_env:dirt_grass"] or "mtg_basic_env:dirt_grass"
	local dirt_grass_dry = minetest.registered_aliases["mtg_basic_env:dirt_grass_dry"] or "mtg_basic_env:dirt_grass_dry"
	local dirt_dry_grass_dry = minetest.registered_aliases["mtg_basic_env:dirt_dry_grass_dry"] or "mtg_basic_env:dirt_dry_grass_dry"
	local dirt_rain_lit = minetest.registered_aliases["mtg_basic_env:dirt_rainforest_litter"] or "mtg_basic_env:dirt_rainforest_litter"
	

	pos.y = pos.y - 1
	local name = minetest.get_node(pos).name
	if name ~= dirt and
			name ~= dirt_grass and
			name ~= dirt_grass_dry and
			name ~= dirt_rain_lit and
			name ~= dirt_dry and
			name ~= dirt_dry_grass_dry then
		return
	end
	if not minetest.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "mtg_decor_schema:papyrus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "mtg_decor_schema:papyrus"})
	return true
end

minetest.register_abm({
	label = "Grow cactus",
	nodenames = {"mtg_decor_schema:cactus"},
	neighbors = {"group:sand"},
	interval = 12,
	chance = 83,
	action = function(...)
		mtg_decor_schema.grow_cactus(...)
	end
})

minetest.register_abm({
	label = "Grow papyrus",
	nodenames = {"mtg_decor_schema:papyrus"},
	-- Grows on the dirt and surface dirt nodes of the biomes papyrus appears in,
	-- including the old savanna nodes.
	-- 'default:dirt_with_grass' is here only because it was allowed before.
	neighbors = {
		minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt",
		minetest.registered_aliases["mtg_basic_env:dirt_grass"] or "mtg_basic_env:dirt_grass",
		minetest.registered_aliases["mtg_basic_env:dirt_grass_dry"] or "mtg_basic_env:dirt_grass_dry",
		minetest.registered_aliases["mtg_basic_env:dirt_rainforest_litter"] or "mtg_basic_env:dirt_rainforest_litter",
		minetest.registered_aliases["mtg_basic_env:dirt_dry"] or "mtg_basic_env:dirt_dry",
		minetest.registered_aliases["mtg_basic_env:dirt_dry_grass_dry"] or "mtg_basic_env:dirt_dry_grass_dry",
	},
	interval = 14,
	chance = 71,
	action = function(...)
		mtg_decor_schema.grow_papyrus(...)
	end
})

-----------------
-- Dig upwards --
-----------------
-- used by mtg_decor_schema:papyrus
function mtg_decor_schema.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end