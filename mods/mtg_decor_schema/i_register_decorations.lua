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
--             Register Decorations               --
----------------------------------------------------

--[[ To increase modularity I have included decoration registerations for the items 
contained inside this mod below, although this does make mapgen module slightly more
complex as changes need to be done across multiple modules.

I have moved Mapgen V6 to the bottom of the document as these are less changable.
See specific api documentation around Mapgen V6
--]]

------------------------------
-- Alias resolving/checking --
------------------------------
-- set variable/table name for alias resolving/checking,to help make name changes more 
-- future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases


local dirt = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
local dirt_dry = minetest.registered_aliases["mtg_basic_env:dirt_dry"] or "mtg_basic_env:dirt_dry"
local dirt_grass = minetest.registered_aliases["mtg_basic_env:dirt_grass"] or "mtg_basic_env:dirt_grass"
local dirt_snow = minetest.registered_aliases["mtg_basic_env:dirt_snow"] or "mtg_basic_env:dirt_snow"	 
local dirt_d_g_d = minetest.registered_aliases["mtg_basic_env:dirt_dry_grass_dry"] or "mtg_basic_env:dirt_dry_grass_dry" 
local sand_desert = minetest.registered_aliases["mtg_basic_env:sand_desert"] or "mtg_basic_env:sand_desert"
local water_source = minetest.registered_aliases["mtg_basic_env:water_source"] or "mtg_basic_env:water_source"
local dirt_con_lit = minetest.registered_aliases["mtg_decor_schema:dirt_coniferous_litter"] or "mtg_decor_schema:dirt_coniferous_litter"
local dirt_ran_lit = minetest.registered_aliases["mtg_decor_schema:dirt_rainforest_litter"] or "mtg_decor_schema:dirt_rainforest_litter"

-----------------------------
-- All mapgens except mgv6 --
-----------------------------
-----------------
-- Biome Names --
-----------------
local grassland = "grassland"
local snowy_grassland ="snowy_grassland"
local savanna = "savanna"
local savanna_shore = "savanna_shore"
local deciduous_forest = "deciduous_forest"
local coniferous_forest = "coniferous_forest"
local taiga = "taiga"
local desert = "desert"
local rainforest = "rainforest"
local rainforest_swamp ="rainforest_swamp"
 
------------------------
-- Cactus and Papyrus --
------------------------ 
 	-- Large cactus

	minetest.register_decoration({
		name = "mtg_decor_schema:cactus_large",
		deco_type = "schematic",
		place_on = {sand_desert},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {desert},
		y_max = 31000,
		y_min = 4,
		schematic = mtg_decor_schema.schematic.cactus_large,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Cactus

	minetest.register_decoration({
		name = "mtg_decor_schema:cactus",
		deco_type = "simple",
		place_on = {sand_desert},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {desert},
		y_max = 31000,
		y_min = 4,
		decoration = "mtg_decor_schema:cactus",
		height = 2,
		height_max = 5,
	})

	-- Papyrus

	-- Dirt version for rainforest swamp

	minetest.register_decoration({
		name = "mtg_decor_schema:papyrus_dirt",
		deco_type = "schematic",
		place_on = {dirt},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {rainforest_swamp},
		y_max = 0,
		y_min = 0,
		schematic = mtg_decor_schema.schematic.papyrus_dirt,
	})

	-- Dry dirt version for savanna shore

	minetest.register_decoration({
		name = "mtg_decor_schema:papyrus_dirt_dry",
		deco_type = "schematic",
		place_on = {dirt_dry},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {savanna_shore},
		y_max = 0,
		y_min = 0,
		schematic = mtg_decor_schema.schematic.papyrus_dirt_dry,
	})

-------------------
--    Bushes     --
-------------------
	-- Bush

	minetest.register_decoration({
		name = "mtg_decor_schema:bush",
		deco_type = "schematic",
		place_on = {dirt_grass},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {grassland, deciduous_forest},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.bush,
		flags = "place_center_x, place_center_z",
	})

	-- Blueberry bush

	minetest.register_decoration({
		name = "mtg_decor_schema:blueberry_bush",
		deco_type = "schematic",
		place_on = {dirt_grass,dirt_snow},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {grassland, snowy_grassland},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = mtg_decor_schema.schematic.blueberry_bush,
		flags = "place_center_x, place_center_z",
	})

	-- Acacia bush

	minetest.register_decoration({
		name = "mtg_decor_schema:acacia_bush",
		deco_type = "schematic",
		place_on = {dirt_d_g_d},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 90155,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {savanna},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.acacia_bush,
		flags = "place_center_x, place_center_z",
	})

	-- Pine bush

	minetest.register_decoration({
		name = "mtg_decor_schema:pine_bush",
		deco_type = "schematic",
		place_on = {dirt_snow},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {taiga, snowy_grassland},
		y_max = 31000,
		y_min = 4,
		schematic = mtg_decor_schema.schematic.pine_bush,
		flags = "place_center_x, place_center_z",
	})

--------------------
-- Trees and Logs --
--------------------
-- Acacia tree and log

	minetest.register_decoration({
		name = "mtg_decor_schema:acacia_tree",
		deco_type = "schematic",
		place_on = {dirt_d_g_d},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {savanna},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.acacia_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "mtg_decor_schema:acacia_tree_log",
		deco_type = "schematic",
		place_on = {dirt_d_g_d},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {savanna},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.acacia_tree_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = dirt_d_g_d,
		num_spawn_by = 8,
	})


-- Apple tree and log
	minetest.register_decoration({
		name = "mtg_decor_schema:apple_tree",
		deco_type = "schematic",
		place_on = {dirt_grass},
		sidelen = 16,
		noise_params = {
			offset = 0.024,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {deciduous_forest},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.apple_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "mtg_decor_schema:apple_tree_log",
		deco_type = "schematic",
		place_on = {dirt_grass},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {deciduous_forest},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.apple_tree_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = dirt_grass,
		num_spawn_by = 8,
	})


-- Aspen tree and log

	minetest.register_decoration({
		name = "mtg_decor_schema:aspen_tree",
		deco_type = "schematic",
		place_on = {dirt_grass},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {deciduous_forest},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.aspen_tree,
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "mtg_decor_schema:aspen_tree_log",
		deco_type = "schematic",
		place_on = {dirt_grass},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.0008,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {deciduous_forest},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.aspen_tree_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = dirt_grass,
		num_spawn_by = 8,
	})


-- Jungle tree and log

	-- jungle tree emergant
	-- Due to 32 node height, altitude is limited and prescence depends on chunksize

	local chunksize = tonumber(minetest.get_mapgen_setting("chunksize"))
	if chunksize >= 5 then
		minetest.register_decoration({
			name = "mtg_decor_schema:jungle_tree_emergent",
			deco_type = "schematic",
			place_on = {dirt_ran_lit},
			sidelen = 80,
			noise_params = {
				offset = 0.0,
				scale = 0.0025,
				spread = {x = 250, y = 250, z = 250},
				seed = 2685,
				octaves = 3,
				persist = 0.7
			},
			biomes = {rainforest},
			y_max = 32,
			y_min = 1,
			schematic = mtg_decor_schema.schematic.jungle_tree_emergent,
			flags = "place_center_x, place_center_z",
			rotation = "random",
			place_offset_y = -4,
		})
	end


	minetest.register_decoration({
		name = "mtg_decor_schema:jungle_tree",
		deco_type = "schematic",
		place_on = {dirt_ran_lit},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {rainforest},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.jungle_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Swamp jungle trees

	minetest.register_decoration({
		name = "mtg_decor_schema:jungle_tree_swamp",
		deco_type = "schematic",
		place_on = {dirt},
		sidelen = 16,
		-- Noise tuned to place swamp trees where papyrus is absent
		noise_params = {
			offset = 0.0,
			scale = -0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 1,
			persist = 0.5
		},
		biomes = {rainforest_swamp},
		y_max = 0,
		y_min = -1,
		schematic = mtg_decor_schema.schematic.jungle_tree,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "mtg_decor_schema:jungle_log",
		deco_type = "schematic",
		place_on = {dirt_ran_lit},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.005,
		biomes = {"rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = mtg_decor_schema.schematic.jungle_tree_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = dirt_ran_lit,
		num_spawn_by = 8,
	})


-- Pine tree and log

	minetest.register_decoration({
		name = "mtg_decor_schema:pine_tree",
		deco_type = "schematic",
		place_on = {dirt_snow, dirt_con_lit},
		sidelen = 16,
		noise_params = {
			offset = 0.010,
			scale = 0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {taiga, coniferous_forest},
		y_max = 31000,
		y_min = 4,
		schematic = mtg_decor_schema.schematic.pine_tree,
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "mtg_decor_schema:pine_tree_small",
		deco_type = "schematic",
		place_on = {dirt_snow, dirt_con_lit},
		sidelen = 16,
		noise_params = {
			offset = 0.010,
			scale = -0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {taiga, coniferous_forest},
		y_max = 31000,
		y_min = 4,
		schematic = mtg_decor_schema.schematic.pine_tree_small,
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "mtg_decor_schema:pine_tree_log",
		deco_type = "schematic",
		place_on = {dirt_snow, dirt_con_lit},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0018,
		biomes = {taiga, coniferous_forest},
		y_max = 31000,
		y_min = 4,
		schematic = mtg_decor_schema.schematic.pine_tree_log,
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {dirt_snow, dirt_con_lit},
		num_spawn_by = 8,
	})
	
----------
-- Mgv6 --
----------
-- Papyrus

	minetest.register_decoration({
		name = "mtg_decor_schema:papyrus",
		deco_type = "simple",
		place_on = {dirt_grass},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_max = 1,
		y_min = 1,
		decoration = "mtg_decor_schema:papyrus",
		height = 2,
		height_max = 4,
		spawn_by = water_source,
		num_spawn_by = 1,
	})

	-- Cacti

	minetest.register_decoration({
		name = "mtg_decor_schema:cactus",
		deco_type = "simple",
		place_on = {sand_desert},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		y_max = 30,
		y_min = 1,
		decoration = "mtg_decor_schema:cactus",
		height = 3,
	        height_max = 4,
	})