----------------------------------------------------
--    _____                                       --
--   /     \ _____  ______   ____   ____   ____   --
--  /  \ /  \\__  \ \____ \ / ___\_/ __ \ /    \  --
-- /    Y    \/ __ \|  |_> > /_/  >  ___/|   |  \ --
-- \____|__  (____  /   __/\___  / \___  >___|  / --
--         \/     \/|__|  /_____/      \/     \/  --
----------------------------------------------------
--                   MTG Mapgen                   --
----------------------------------------------------
--              Biomes - Not Mapgenv6             --
----------------------------------------------------
-------------------------
-- Index/Base settings --
-------------------------
--[[
name,                        heat,    humidity,    ymin,     ymax
cold_desert,                  40,         0,         4,      31000             
cold_desert_ocean,            40,         0,       -255,       3
cold_desert_under,            40,         0,      -31000,    -256
coniferous_forest,            45,        70,         6,      31000
coniferous_forest_dunes,      45,        70,         4,        5
coniferous_forest_ocean,      45,        70,       -255,       3
coniferous_forest_under,      45,        70,      -31000,    -256
deciduous_forest,             60,        68,         1,      31000   
deciduous_forest_shore,       60,        68,        -1,        0
deciduous_forest_ocean,       60,        68,       -255,      -2       
deciduous_forest_under,       60,        68,      -31000,    -256
desert,                       92,        16,         4,      31000
desert_ocean,                 92,        16,       -255,       3
desert_under,                 92,        16,      -31000,    -256       
grassland,                    50,        35,         6,      31000
grassland_dunes,              50,        35,         4,        5  
grassland_ocean,              50,        35,       -255,       3
grassland_under,              50,        35,      -31000,    -256
icesheet,                      0,        73,        -8,      31000
icesheet_ocean,                0,        73,       -255,      -9
icesheet_under,                0,        73,      -31000,    -256
rainforest,                   86,        65,         1,      31000
rainforest_swamp,             86,        65,        -1,        0
rainforest_ocean,             86,        65,       -255,      -2
rainforest_under,             86,        65,      -31000,    -256
sandstone_desert,             60,         0,         4,      31000
sandstone_desert_ocean,       60,         0,       -255,       3
sandstone_desert_under,       60,         0,      -31000,    -256
savanna,                      89,        42,         1,      31000
savanna_shore,                89,        42,        -1,        0
savanna_ocean,                89,        42,       -255,      -2
savanna_under,                89,        42,      -31000,    -256
snowy_grassland,              20,        35,         4,      31000
snowy_grassland_ocean,        20,        35,       -255,       3
snowy_grassland_under,        20,        35,      -31000,    -256
taiga,                        25,        70,         4,      31000
taiga_ocean,                  25,        70,       -255,       3
taiga_under,                  25,        70,      -31000,    -256
tundra_highland,               0,        40,        47,      31000
tundra,                        0,        40,         2,       46
tundra_beach,                  0,        40,        -3,        1       
tundra_ocean,                  0,        40,       -255,      -4
tundra_under,                  0,        40,      -31000,    -256
--]]

------------------------------
-- Alias resolving/checking --
------------------------------
-- set variable/table name for alias resolving/checking,to help make name changes more 
-- future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases

 -- Stone
local stone = minetest.registered_aliases["mtg_basic_env:stone"] or "mtg_basic_env:stone"
local stone_desert = minetest.registered_aliases["mtg_basic_env:stone_desert"] or "mtg_basic_env:stone_desert"
local sandstone = minetest.registered_aliases["mtg_basic_env:sandstone"] or "mtg_basic_env:sandstone"
local sandstone_desert = minetest.registered_aliases["mtg_basic_env:sandstone_desert"] or "mtg_basic_env:sandstone_desert"
local sandstone_silver = minetest.registered_aliases["mtg_basic_env:sandstone_silver"] or "mtg_basic_env:sandstone_silver"
local cobble = minetest.registered_aliases["mtg_basic_env:cobble"] or "mtg_basic_env:cobble"
local cobble_mossy = minetest.registered_aliases["mtg_basic_env:cobble_mossy"] or "mtg_basic_env:cobble_mossy"

-- Soft / Non-Stone
local dirt = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
local dirt_dry = minetest.registered_aliases["mtg_basic_env:dirt_dry"] or "mtg_basic_env:dirt_dry"
local dirt_snow = minetest.registered_aliases["mtg_basic_env:dirt_snow"] or "mtg_basic_env:dirt_snow"
local dirt_grass = minetest.registered_aliases["mtg_basic_env:dirt_grass"] or "mtg_basic_env:dirt_grass"
local dirt_dry_grass_dry = minetest.registered_aliases["mtg_basic_env:dirt_dry_grass_dry"] or "mtg_basic_env:dirt_dry_grass_dry"
local clay = minetest.registered_aliases["mtg_basic_env:clay"] or "mtg_basic_env:clay"
local gravel = minetest.registered_aliases["mtg_basic_env:gravel"] or "mtg_basic_env:gravel"

local permafrost = minetest.registered_aliases["mtg_basic_env:permafrost"] or "mtg_basic_env:permafrost"
local permafrost_stones = minetest.registered_aliases["mtg_basic_env:permafrost_stones"] or "mtg_basic_env:permafrost_stones"

local sand = minetest.registered_aliases["mtg_basic_env:sand"] or "mtg_basic_env:sand"
local sand_desert = minetest.registered_aliases["mtg_basic_env:sand_desert"] or "mtg_basic_env:sand_desert"
local sand_silver = minetest.registered_aliases["mtg_basic_env:sand_silver"] or "mtg_basic_env:sand_silver"

local snow = minetest.registered_aliases["mtg_basic_env:snow"] or "mtg_basic_env:snow"
local snow_block = minetest.registered_aliases["mtg_basic_env:snow_block"] or "mtg_basic_env:snow_block"
local ice = minetest.registered_aliases["mtg_basic_env:ice"] or "mtg_basic_env:ice"
local ice_cave = minetest.registered_aliases["mtg_basic_env:ice_cave"] or "mtg_basic_env:ice_cave"

--Liquids
local water_s = minetest.registered_aliases["mtg_basic_env:water_source"] or "mtg_basic_env:water_source"
local lava_s = minetest.registered_aliases["mtg_basic_env:lava_source"] or "mtg_basic_env:lava_source"

----------------------------------------------------------------------------------------
-- Substituations to allow mapgen to run with just mtg_basic_sounds and mtg_basic_env --
----------------------------------------------------------------------------------------
-- sub brick/block for base block if mtg_base_env_fab not present.
local sandstone_brick = minetest.registered_aliases["mtg_basic_env:sandstone"] or "mtg_basic_env:sandstone"	

	if mtg_mapgen.basic_env_fab == true then
		sandstone_brick = minetest.registered_aliases["mtg_basic_env_fab:sandstone_brick"] or "mtg_basic_env_fab:sandstone_brick"
	end

-- sub litter for dirt if mtg_dec_schema not present.
local dirt_con_lit = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
local dirt_ran_lit = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"

	if mtg_mapgen.dec_schem == true then
		dirt_con_lit = minetest.registered_aliases["mtg_decor_schema:dirt_coniferous_litter"] or "mtg_decor_schema:dirt_coniferous_litter"
		dirt_ran_lit = minetest.registered_aliases["mtg_decor_schema:dirt_rainforest_litter"] or "mtg_decor_schema:dirt_rainforest_litter"
	end

-- sub stairs for base block if stairs mod not present.
local cobble_stairs = minetest.registered_aliases["mtg_basic_env:cobble"] or "mtg_basic_env:cobble"
local stone_desert_stairs = minetest.registered_aliases["mtg_basic_env:stone_desert"] or "mtg_basic_env:stone_desert"
local ice_stairs = minetest.registered_aliases["mtg_basic_env:ice"] or "mtg_basic_env:ice"	
local sandstone_stairs = minetest.registered_aliases["mtg_basic_env:sandstone"] or "mtg_basic_env:sandstone"	
	
	if mtg_mapgen.stairs == true then
		cobble_stairs = minetest.registered_aliases["stairs:stair_cobble"] or "stairs:stair_cobble"
		stone_desert_stairs = minetest.registered_aliases["stairs:stair_desert_stone"] or "stairs:stair_desert_stone"
		ice_stairs = minetest.registered_aliases["stairs:stair_ice"] or "stairs:stair_ice"
		sandstone_stairs = minetest.registered_aliases["stairs:stair_sandstone_block"] or "stairs:stair_sandstone_block"	
	end
---------------------
-- Register biomes --
---------------------

	-- Cold desert

	minetest.register_biome({
		name = "cold_desert",
		node_top = sand_silver,
		depth_top = 1,
		node_filler = sand_silver,
		depth_filler = 1,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 4,
		heat_point = 40,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "cold_desert_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 40,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "cold_desert_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 40,
		humidity_point = 0,
	})

	-- Coniferous forest

	minetest.register_biome({
		name = "coniferous_forest",
		node_top = dirt_con_lit,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 6,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_dunes",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 3,
		y_min = -255,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 45,
		humidity_point = 70,
	})

	-- Deciduous forest

	minetest.register_biome({
		name = "deciduous_forest",
		node_top = dirt_grass,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 1,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_shore",
		node_top = dirt,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 0,
		y_min = -1,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 60,
		humidity_point = 68,
	})

	-- Desert

	minetest.register_biome({
		name = "desert",
		node_top = sand_desert,
		depth_top = 1,
		node_filler = sand_desert,
		depth_filler = 1,
		node_stone = stone_desert,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = stone_desert,
		node_dungeon_stair = stone_desert_stairs,
		y_max = 31000,
		y_min = 4,
		heat_point = 92,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "desert_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_stone = stone_desert,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = stone_desert,
		node_dungeon_stair = stone_desert_stairs,
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 92,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "desert_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 92,
		humidity_point = 16,
	})

	-- Grassland

	minetest.register_biome({
		name = "grassland",
		node_top = dirt_grass,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 1,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 6,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_dunes",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 2,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 3,
		y_min = -255,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 50,
		humidity_point = 35,
	})
	
	-- Icesheet

	minetest.register_biome({
		name = "icesheet",
		node_dust = snow_block,
		node_top = snow_block,
		depth_top = 1,
		node_filler = snow_block,
		depth_filler = 3,
		node_stone = ice_cave,
		node_water_top = ice,
		depth_water_top = 10,
		node_river_water = ice,
		node_riverbed = gravel,
		depth_riverbed = 2,
		node_dungeon = ice,
		node_dungeon_stair = ice_stairs,
		y_max = 31000,
		y_min = -8,
		heat_point = 0,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "icesheet_ocean",
		node_dust = snow_block,
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_water_top = ice,
		depth_water_top = 10,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -9,
		y_min = -255,
		heat_point = 0,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "icesheet_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 0,
		humidity_point = 73,
	})

-- Rainforest

	minetest.register_biome({
		name = "rainforest",
		node_top = dirt_ran_lit,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 1,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_swamp",
		node_top = dirt,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 0,
		y_min = -1,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 86,
		humidity_point = 65,
	})

-- Sandstone desert

	minetest.register_biome({
		name = "sandstone_desert",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 1,
		node_stone = sandstone,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = sandstone_brick,
		node_dungeon_stair = sandstone_stairs,
		y_max = 31000,
		y_min = 4,
		heat_point = 60,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "sandstone_desert_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_stone = sandstone,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = sandstone_brick,
		node_dungeon_stair = sandstone_stairs,
		y_max = 3,
		y_min = -255,
		heat_point = 60,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "sandstone_desert_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 60,
		humidity_point = 0,
	})

-- Savanna

	minetest.register_biome({
		name = "savanna",
		node_top = dirt_dry_grass_dry,
		depth_top = 1,
		node_filler = dirt_dry,
		depth_filler = 1,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 1,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_shore",
		node_top = dirt_dry,
		depth_top = 1,
		node_filler = dirt_dry,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 0,
		y_min = -1,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 89,
		humidity_point = 42,
	})

	-- Snowy grassland

	minetest.register_biome({
		name = "snowy_grassland",
		node_dust = snow,
		node_top = dirt_snow,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 1,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 4,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_ocean",
		node_dust = snow,
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 20,
		humidity_point = 35,
	})

	-- Taiga

	minetest.register_biome({
		name = "taiga",
		node_dust = snow,
		node_top = dirt_snow,
		depth_top = 1,
		node_filler = dirt,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 4,
		heat_point = 25,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_ocean",
		node_dust = snow,
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = sand,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = 3,
		y_min = -255,
		heat_point = 25,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 25,
		humidity_point = 70,
	})
	
	-- Tundra

	minetest.register_biome({
		name = "tundra_highland",
		node_dust = snow,
		node_riverbed = gravel,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = 31000,
		y_min = 47,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra",
		node_top = permafrost_stones,
		depth_top = 1,
		node_filler = permafrost,
		depth_filler = 1,
		node_riverbed = gravel,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 4,
		y_max = 46,
		y_min = 2,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_beach",
		node_top = gravel,
		depth_top = 1,
		node_filler = gravel,
		depth_filler = 2,
		node_riverbed = gravel,
		depth_riverbed = 2,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = 1,
		y_min = -3,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_ocean",
		node_top = sand,
		depth_top = 1,
		node_filler = sand,
		depth_filler = 3,
		node_riverbed = gravel,
		depth_riverbed = 2,
		node_cave_liquid = water_s,
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		vertical_blend = 1,
		y_max = -4,
		y_min = -255,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_under",
		node_cave_liquid = {water_s, lava_s},
		node_dungeon = cobble,
		node_dungeon_alt = cobble_mossy,
		node_dungeon_stair = cobble_stairs,
		y_max = -256,
		y_min = -31000,
		heat_point = 0,
		humidity_point = 40,
	})
