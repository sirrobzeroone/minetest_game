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
--                     V6 Ores                    --
----------------------------------------------------
------------------------------
-- Alias resolving/checking --
------------------------------
-- set variable/table name for alias resolving/checking,to help make name changes more 
-- future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases

-- Stone
local stone = minetest.registered_aliases["mtg_basic_env:stone"] or "mtg_basic_env:stone"
local stone_desert = minetest.registered_aliases["mtg_basic_env:stone_desert"] or "mtg_basic_env:stone_desert"

-- Ores
local coal_ore    = minetest.registered_aliases["mtg_basic_env:stone_coal_ore"] or "mtg_basic_env:stone_coal_ore"
local iron_ore    = minetest.registered_aliases["mtg_basic_env:stone_iron_ore"] or "mtg_basic_env:stone_iron_ore"
local tin_ore     = minetest.registered_aliases["mtg_basic_env:stone_tin_ore"] or "mtg_basic_env:stone_tin_ore"
local copper_ore  = minetest.registered_aliases["mtg_basic_env:stone_copper_ore"] or "mtg_basic_env:stone_copper_ore"
local silver_ore  = minetest.registered_aliases["mtg_basic_env:stone_silver_ore"] or "mtg_basic_env:stone_silver_ore"
local gold_ore    = minetest.registered_aliases["mtg_basic_env:stone_gold_ore"] or "mtg_basic_env:stone_gold_ore"       
local mese_ore    = minetest.registered_aliases["mtg_basic_env:stone_mese_ore"] or "mtg_basic_env:stone_mese_ore"
local diamond_ore = minetest.registered_aliases["mtg_basic_env:stone_diamond_ore"] or "mtg_basic_env:stone_diamond_ore"

-- Soft / Non-Stone
local dirt   = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
local clay   = minetest.registered_aliases["mtg_basic_env:clay"] or "mtg_basic_env:clay"
local sand   = minetest.registered_aliases["mtg_basic_env:sand"] or "mtg_basic_env:sand"
local gravel = minetest.registered_aliases["mtg_basic_env:gravel"] or "mtg_basic_env:gravel"

-- Block
-- sub mese_ore if basic_env_fab not present - contains mese.
local mese = minetest.registered_aliases["mtg_basic_env:stone_mese_ore"] or "mtg_basic_env:stone_mese_ore"

if mtg_mapgen.basic_env_fab == true then
	mese = minetest.registered_aliases["mtg_basic_env_fab:mese"] or "mtg_basic_env_fab:mese"
else
	
end

-------------------
-- Register Ores --
-------------------

	-- Blob ore
	-- These first to avoid other ores in blobs

	-- Clay
	-- This first to avoid clay in sand blobs

	minetest.register_ore({
		ore_type        = "blob",
		ore             = clay,
		wherein         = {sand},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 0,
		y_min           = -15,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = sand,
		wherein         = {stone, stone_desert},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 0,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Dirt

	minetest.register_ore({
		ore_type        = "blob",
		ore             = dirt,
		wherein         = {stone},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = gravel,
		wherein         = {stone},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Scatter ores

	-- Coal

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = coal_ore,
		wherein        = stone,
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 9,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = coal_ore,
		wherein        = stone,
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_max          = 64,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = coal_ore,
		wherein        = stone,
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = 0,
		y_min          = -31000,
	})

	-- Tin

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = tin_ore,
		wherein        = stone,
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = tin_ore,
		wherein        = stone,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -32,
		y_min          = -127,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = tin_ore,
		wherein        = stone,
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -31000,
	})

	-- Copper

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = copper_ore,
		wherein        = stone,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = copper_ore,
		wherein        = stone,
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -16,
		y_min          = -63,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = copper_ore,
		wherein        = stone,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -31000,
	})

	-- Iron

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = iron_ore,
		wherein        = stone,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = iron_ore,
		wherein        = stone,
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 0,
		y_min          = -31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = iron_ore,
		wherein        = stone,
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_max          = -64,
		y_min          = -31000,
	})
	
	-- Silver

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = silver_ore,
		wherein        = stone,
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = silver_ore,
		wherein        = stone,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -16,
		y_min          = -63,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = copper_ore,
		wherein        = stone,
		clust_scarcity = 11 * 11 * 11,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -64,
		y_min          = -31000,
	})
	
	-- Gold

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = gold_ore,
		wherein        = stone,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = gold_ore,
		wherein        = stone,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = gold_ore,
		wherein        = stone,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})

	-- Mese crystal

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = mese_ore,
		wherein        = stone,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = mese_ore,
		wherein        = stone,
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -64,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = mese_ore,
		wherein        = stone,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})

	-- Diamond

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = diamond_ore,
		wherein        = stone,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = diamond_ore,
		wherein        = stone,
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -128,
		y_min          = -255,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = diamond_ore,
		wherein        = stone,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -256,
		y_min          = -31000,
	})

	-- Mese block

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = mese,
		wherein        = stone,
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = 31000,
		y_min          = 1025,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = mese,
		wherein        = stone,
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = -1024,
		y_min          = -31000,
	})