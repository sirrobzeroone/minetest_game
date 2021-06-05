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
--            Register Decorations v6             --
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

local dirt_grass =     minetest.registered_aliases["mtg_basic_env:dirt_grass"] or "mtg_basic_env:dirt_grass"
local dirt_snow =      minetest.registered_aliases["mtg_basic_env:dirt_snow"] or "mtg_basic_env:dirt_snow"
local sand_desert =    minetest.registered_aliases["mtg_basic_env:sand_desert"] or "mtg_basic_env:sand_desert"
local shrub_dry =      minetest.registered_aliases["mtg_decor_simple:shrub_dry"] or "mtg_decor_simple:shrub_dry"
local grass_y =        minetest.registered_aliases["mtg_decor_simple:grass_1"] or "mtg_decor_simple:grass_1"
local grass_x =        string.sub(tostring(grass_y),1,-2)

----------
-- Mgv6 --
----------
	-- Long grasses

	for length = 1, 5 do
		minetest.register_decoration({
			name = "mtg_decor_simple:grass_"..length,
			deco_type = "simple",
			place_on = {dirt_grass},
			sidelen = 16,
			noise_params = {
				offset = 0,
				scale = 0.007,
				spread = {x = 100, y = 100, z = 100},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			y_max = 30,
			y_min = 1,
			decoration = grass_x..length,
		})
	end

	-- Dry shrubs

	minetest.register_decoration({
		name = "mtg_decor_simple:dry_shrub",
		deco_type = "simple",
		place_on = {sand_desert, dirt_snow},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 30,
		y_min = 1,
		decoration = shrub_dry,
		param2 = 4,
	})
