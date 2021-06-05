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
--                 Blueberry Bush                 --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local bb_leaves =  minetest.registered_aliases["mtg_decor_schema:blueberry_bush_leaves_berries"] or "mtg_decor_schema:blueberry_bush_leaves_berries"

-- tree schematic
local _ = {name = "air", prob = 0}
local L = {name = bb_leaves, prob = 255, force_place = true}
local M = {name = bb_leaves, prob = 223}
local N = {name = bb_leaves, prob = 95}

path.blueberry_bush = {
	size = {x = 3, y = 1, z = 3},
	data = {
		N, M, N,

		M, L, M,

		N, M, N,
	},
}