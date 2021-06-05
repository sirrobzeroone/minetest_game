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
--                Papyrus on Dirt                 --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local papyrus =  minetest.registered_aliases["mtg_decor_schema:papyrus"] or "mtg_decor_schema:papyrus"
local dirt =  minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"

-- tree schematic

path.papyrus_dirt = {
	size = {x = 1, y = 7, z = 1},
	yslice_prob = {
		{ypos = 2, prob = 127},
		{ypos = 3, prob = 127},
	},
	data = {
		{name = dirt, prob = 255, force_place = true},
		{name = dirt, prob = 255, force_place = true},
		{name = papyrus, prob = 255},
		{name = papyrus, prob = 255},
		{name = papyrus, prob = 255},
		{name = papyrus, prob = 255},
		{name = papyrus, prob = 255},
	},
}