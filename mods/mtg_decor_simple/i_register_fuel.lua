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
--                     Fuel                       --
----------------------------------------------------

--Alias Check
local grass_1 = minetest.registered_aliases["mtg_decor_simple:grass_1"] or "mtg_decor_simple:grass_1"
local grass_dry_1 = minetest.registered_aliases["mtg_decor_simple:grass_dry_1"] or "mtg_decor_simple:grass_dry_1"
local grass_marram_1 = minetest.registered_aliases["mtg_decor_simple:grass_marram_1"] or "mtg_decor_simple:grass_marram_1"
local grass_jungle = minetest.registered_aliases["mtg_decor_simple:grass_jungle"] or "mtg_decor_simple:grass_jungle"
local fern_1 = minetest.registered_aliases["mtg_decor_simple:fern_1"] or "mtg_decor_simple:fern_1"
local shrub_dry = minetest.registered_aliases["mtg_decor_simple:shrub_dry"] or "mtg_decor_simple:shrub_dry"

---------------------
--  Register Fuel  --
---------------------
minetest.register_craft({
	type = "fuel",
	recipe = grass_1,
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = grass_dry_1,
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = grass_marram_1,
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = grass_jungle,
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = fern_1,
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = shrub_dry,
	burntime = 2,
})









