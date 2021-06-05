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
--           Apple Tree Log Schematic             --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local apple_trunk =  minetest.registered_aliases["mtg_decor_schema:apple_tree_trunk"] or "mtg_decor_schema:apple_tree_trunk"
local mushroom_brown = "air"

if mtg_decor_schema.flowers == true then
	mushroom_brown = minetest.registered_aliases["flowers:mushroom_brown"] or "flowers:mushroom_brown"
end

-- tree schematic

path.apple_tree_log = {
	size = {x = 4, y = 2, z = 1},
	data = {
		{name = apple_trunk, param2 = 12, prob = 127},
		{name = apple_trunk, param2 = 12},
		{name = apple_trunk, param2 = 12},
		{name = apple_trunk, param2 = 12},
		{name = "air", prob = 0},
		{name = mushroom_brown, prob = 63},
		{name = "air", prob = 0},
		{name = "air", prob = 0},
	},
}