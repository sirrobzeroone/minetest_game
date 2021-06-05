----------------------------------------------------
--              ___ _            _                --
--             / __(_)_ __  _ __| |___            --
--             \__ \ | '  \| '_ \ / -_)           --
--             |___/_|_|_|_| .__/_\___|           --
--   ___                 |_|  _   _               --
--  |   \ ___ __ ___ _ _ __ _| |_(_)___ _ _  ___  --
--  | |) / -_) _/ _ \ '_/ _` |  _| / _ \ ' \(_-<  --
--  |___/\___\__\___/_| \__,_|\__|_\___/_||_/__/  --
----------------------------------------------------
--            MTG Decorations Simple              --
----------------------------------------------------
--             Register Decorations               --
----------------------------------------------------

--[[ To increase modularity I have included decoration registerations for the items 
contained inside this mod below, although this does make mapgen module slightly more
complex as changes need to be done across multiple modules.

--]]

------------------------------
-- Alias resolving/checking --
------------------------------
-- set variable/table name for alias resolving/checking,to help make name changes more 
-- future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases

local stone =          minetest.registered_aliases["mtg_basic_env:stone"] or "mtg_basic_env:stone"
local gravel =         minetest.registered_aliases["mtg_basic_env:gravel"] or "mtg_basic_env:gravel"
local dirt =           minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
local dirt_dry =       minetest.registered_aliases["mtg_basic_env:dirt_dry"] or "mtg_basic_env:dirt_dry"
local dirt_grass =     minetest.registered_aliases["mtg_basic_env:dirt_grass"] or "mtg_basic_env:dirt_grass"
local dirt_g_d =       minetest.registered_aliases["mtg_basic_env:dirt_grass_dry"] or "mtg_basic_env:dirt_grass_dry"
local dirt_d_g_d =     minetest.registered_aliases["mtg_basic_env:dirt_dry_grass_dry"] or "mtg_basic_env:dirt_dry_grass_dry" 
local dirt_snow =      minetest.registered_aliases["mtg_basic_env:dirt_snow"] or "mtg_basic_env:dirt_snow"
local grass_jungle =   minetest.registered_aliases["mtg_decor_simple:grass_jungle"] or "mtg_decor_simple:grass_jungle"
local pf_stone =       minetest.registered_aliases["mtg_basic_env:permafrost_stones"] or "mtg_basic_env:permafrost_stones"
local pf_moss =        minetest.registered_aliases["mtg_basic_env:permafrost_mossy"] or "mtg_basic_env:permafrost_mossy"
local sand =           minetest.registered_aliases["mtg_basic_env:sand"] or "mtg_basic_env:sand"
local sand_desert =    minetest.registered_aliases["mtg_basic_env:sand_desert"] or "mtg_basic_env:sand_desert"
local sand_silver =    minetest.registered_aliases["mtg_basic_env:sand_silver"] or "mtg_basic_env:sand_silver"
local snow =           minetest.registered_aliases["mtg_basic_env:snow"] or "mtg_basic_env:snow"
local w_source =       minetest.registered_aliases["mtg_basic_env:water_source"] or "mtg_basic_env:water_source"
local shrub_dry =      minetest.registered_aliases["mtg_decor_simple:shrub_dry"] or "mtg_decor_simple:shrub_dry"
local marram_grass_1 = minetest.registered_aliases["mtg_decor_simple:grass_marram_1"] or "mtg_decor_simple:grass_marram_1"
local marram_grass_2 = minetest.registered_aliases["mtg_decor_simple:grass_marram_2"] or "mtg_decor_simple:grass_marram_2"
local marram_grass_3 = minetest.registered_aliases["mtg_decor_simple:grass_marram_3"] or "mtg_decor_simple:grass_marram_3"
local coral_green =    minetest.registered_aliases["mtg_decor_simple:coral_green"] or "mtg_decor_simple:coral_green" 
local coral_pink =     minetest.registered_aliases["mtg_decor_simple:coral_pink"] or "mtg_decor_simple:coral_pink"
local coral_cyan =     minetest.registered_aliases["mtg_decor_simple:coral_cyan"] or "mtg_decor_simple:coral_cyan" 
local coral_brown =    minetest.registered_aliases["mtg_decor_simple:coral_brown"] or "mtg_decor_simple:coral_brown"
local coral_orange =   minetest.registered_aliases["mtg_decor_simple:coral_orange"] or "mtg_decor_simple:coral_orange" 
local coral_skeleton = minetest.registered_aliases["mtg_decor_simple:coral_skeleton"] or "mtg_decor_simple:coral_skeleton"
local sand_kelp =      minetest.registered_aliases["mtg_decor_simple:sand_kelp"] or "mtg_decor_simple:sand_kelp"

local grass_y =        minetest.registered_aliases["mtg_decor_simple:grass_1"] or "mtg_decor_simple:grass_1"
local grass_x =        string.sub(tostring(grass_y),1,-2)
local grass_dry_y =    minetest.registered_aliases["mtg_decor_simple:grass_dry_1"] or "mtg_decor_simple:grass_dry_1"
local grass_dry_x =    string.sub(tostring(grass_dry_y),1,-2)
local fern_y =         minetest.registered_aliases["mtg_decor_simple:fern_1"] or "mtg_decor_simple:fern_1"
local fern_x =         string.sub(tostring(fern_y),1,-2)


-- Allows mod to run without mtg_basic_dec_schematic 
-- and decorations will still be placed

local dirt_con_lit = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
local dirt_ran_lit = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"

	if mtg_decor_simple.dec_schema == true then
		dirt_con_lit = minetest.registered_aliases["mtg_decor_schem:dirt_coniferous_litter"] or "mtg_decor_schem:dirt_coniferous_litter"
		dirt_ran_lit = minetest.registered_aliases["mtg_decor_schem:dirt_rainforest_litter"] or "mtg_decor_schem:dirt_rainforest_litter"
	end
-----------------------------
-- All mapgens except mgv6 --
-----------------------------
-----------------
-- Biome Names --
-----------------
local grassland = "grassland"
local savanna = "savanna"
local rainforest = "rainforest"
local deciduous_forest = "deciduous_forest"
local coniferous_forest = "coniferous_forest"
local desert = "desert"
local sandstone_desert = "sandstone_desert"
local cold_desert = "cold_desert"
local coniferous_forest_dunes = "coniferous_forest_dunes"
local grassland_dunes = "grassland_dunes"
local tundra = "tundra"
local tundra_beach = "tundra_beach"
local desert_ocean = "desert_ocean"
local savanna_ocean = "savanna_ocean"
local rainforest_ocean = "rainforest_ocean"
local taiga_ocean =	"taiga_ocean"
local snowy_grassland_ocean ="snowy_grassland_ocean"
local grassland_ocean = "grassland_ocean"
local coniferous_forest_ocean = "coniferous_forest_ocean"
local deciduous_forest_ocean = "deciduous_forest_ocean"
local sandstone_desert_ocean = "sandstone_desert_ocean"
local cold_desert_ocean = "cold_desert_ocean"
 
----------------------------------------------------------
-- Long grass green (mtg_decor_simple:grass_1 to 5) --
----------------------------------------------------------
local function register_grass_decoration(offset, scale, length, biomes)
	minetest.register_decoration({
		name = "mtg_decor_simple:grass_" .. length,
		deco_type = "simple",
		place_on = {dirt_grass},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = biomes,
		y_max = 31000,
		y_min = 1,
		decoration = grass_x..length,
	})
end

-- Register mtg_decor_simple:grass_1 to 5
	register_grass_decoration(-0.03,  0.09,  5, {grassland, deciduous_forest})
	register_grass_decoration(-0.015, 0.075, 4, {grassland, deciduous_forest})
	register_grass_decoration(0,      0.06,  3, {grassland, deciduous_forest})
	register_grass_decoration(0.015,  0.045, 2, {grassland, deciduous_forest})
	register_grass_decoration(0.03,   0.03,  1, {grassland, deciduous_forest})
	
-------------------------------------------------------------------	
-- Long grass dry/yellow (mtg_decor_simple:grass_dry_1 to 5) --
-------------------------------------------------------------------
local function register_dry_grass_decoration(offset, scale, length, biomes)
	minetest.register_decoration({
		name = "mtg_decor_simple:dry_grass_" .. length,
		deco_type = "simple",
		place_on = {dirt_d_g_d},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = biomes,
		y_max = 31000,
		y_min = 1,
		decoration = grass_dry_x..length,
	})
end

-- Register mtg_decor_simple:grass_dry_1 to 5
	register_dry_grass_decoration(0.01, 0.05,  5, {savanna})
	register_dry_grass_decoration(0.03, 0.03,  4, {savanna})
	register_dry_grass_decoration(0.05, 0.01,  3, {savanna})
	register_dry_grass_decoration(0.07, -0.01, 2, {savanna})
	register_dry_grass_decoration(0.09, -0.03, 1, {savanna})


----------------------------------------------------	
-- Small ferns (mtg_decor_simple:fern_1 to 3) --
----------------------------------------------------
local function register_fern_decoration(seed, length, biomes)
	minetest.register_decoration({
		name = "mtg_decor_simple:fern_" .. length,
		deco_type = "simple",
		place_on = {dirt_con_lit},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.2,
			spread = {x = 100, y = 100, z = 100},
			seed = seed,
			octaves = 3,
			persist = 0.7
		},
		biomes = biomes,
		y_max = 31000,
		y_min = 6,
		decoration = fern_x..length,
	})
end

-- Register mtg_decor_simple:fern_1 to 3
	register_fern_decoration(14936, 3, {coniferous_forest})
	register_fern_decoration(801,   2, {coniferous_forest})
	register_fern_decoration(5,     1, {coniferous_forest})




	-- Savanna bare dirt patches.
	-- Must come before all savanna decorations that are placed on dry grass.
	-- Noise is similar to long dry grass noise, but scale inverted, to appear
	-- where long dry grass is least dense and shortest.

	minetest.register_decoration({
		name = "mtg_decor_simple:dry_dirt",
		deco_type = "simple",
		place_on = {dirt_d_g_d},
		sidelen = 4,
		noise_params = {
			offset = -1.5,
			scale = -1.5,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 4,
			persist = 1.0
		},
		biomes = {savanna},
		y_max = 31000,
		y_min = 1,
		decoration = dirt_dry,
		place_offset_y = -1,
		flags = "force_placement",
	})


	minetest.register_decoration({
		name = "mtg_decor_simple:junglegrass",
		deco_type = "simple",
		place_on = {dirt_ran_lit},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {rainforest},
		y_max = 31000,
		y_min = 1,
		decoration = grass_jungle,
	})

	-- Dry shrub

	minetest.register_decoration({
		name = "mtg_decor_simple:shrub_dry",
		deco_type = "simple",
		place_on = {sand, sand_desert, sand_silver},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {desert, sandstone_desert, cold_desert},
		y_max = 31000,
		y_min = 2,
		decoration = shrub_dry,
		param2 = 4,
	})

	-- Marram grass

	minetest.register_decoration({
		name = "mtg_decor_simple:marram_grass",
		deco_type = "simple",
		place_on = {sand},
		sidelen = 4,
		noise_params = {
			offset = -0.7,
			scale = 4.0,
			spread = {x = 16, y = 16, z = 16},
			seed = 513337,
			octaves = 1,
			persist = 0.0,
			flags = "absvalue, eased"
		},
		biomes = {coniferous_forest_dunes, grassland_dunes},
		y_max = 6,
		y_min = 4,
		decoration = {
			marram_grass_1,
			marram_grass_2,
			marram_grass_3,
		},
	})

	-- Tundra moss

	minetest.register_decoration({
		name = "mtg_decor_simple:tundra_moss",
		deco_type = "simple",
		place_on = {pf_stone},
		sidelen = 4,
		noise_params = {
			offset = -0.8,
			scale = 2.0,
			spread = {x = 100, y = 100, z = 100},
			seed = 53995,
			octaves = 3,
			persist = 1.0
		},
		biomes = {tundra},
		y_max = 50,
		y_min = 2,
		decoration = pf_moss,
		place_offset_y = -1,
		flags = "force_placement",
	})

	-- Tundra patchy snow

	minetest.register_decoration({
		name = "mtg_decor_simple:tundra_patch_snow",
		deco_type = "simple",
		place_on = {pf_stone,pf_moss,stone,gravel},
		sidelen = 4,
		noise_params = {
			offset = 0,
			scale = 1.0,
			spread = {x = 100, y = 100, z = 100},
			seed = 172555,
			octaves = 3,
			persist = 1.0
		},
		biomes = {"tundra", "tundra_beach"},
		y_max = 50,
		y_min = 1,
		decoration = snow,
	})

	-- Coral reef

	minetest.register_decoration({
		name = "mtg_decor_simple:corals",
		deco_type = "simple",
		place_on = {sand},
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			desert_ocean,
			savanna_ocean,
			rainforest_ocean,
		},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = {
			coral_green, coral_pink,
			coral_cyan, coral_brown,
			coral_orange, coral_skeleton
		},
	})

	-- Kelp

	minetest.register_decoration({
		name = "mtg_decor_simple:kelp",
		deco_type = "simple",
		place_on = {sand},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -0.04,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 87112,
			octaves = 3,
			persist = 0.7
		},
		biomes = {
			taiga_ocean,
			snowy_grassland_ocean,
			grassland_ocean,
			coniferous_forest_ocean,
			deciduous_forest_ocean,
			sandstone_desert_ocean,
			cold_desert_ocean},
		y_max = -5,
		y_min = -10,
		flags = "force_placement",
		decoration = sand_kelp,
		param2 = 48,
		param2_max = 96,
	})
