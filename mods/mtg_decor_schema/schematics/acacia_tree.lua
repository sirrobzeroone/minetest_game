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
--             Acacia Tree Schematic              --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local acacia_trunk =  minetest.registered_aliases["mtg_decor_schema:acacia_tree_trunk"] or "mtg_decor_schema:acacia_tree_trunk"
local acacia_leaves = minetest.registered_aliases["mtg_decor_schema:acacia_tree_leaves"] or "mtg_decor_schema:acacia_tree_leaves"

--tree schematic
local _ = {name = "air", prob = 0}
local L = {name = acacia_leaves, prob = 255}
local M = {name = acacia_leaves, prob = 223}
local T = {name = acacia_trunk, prob = 255, force_place = true}

path.acacia_tree = {
	size = {x = 9, y = 9, z = 9},
	yslice_prob = {
		{ypos = 2, prob = 127},
		{ypos = 3, prob = 127},
		{ypos = 4, prob = 127},
	},
	data = {
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		M, M, M, M, _, _, _, _, _,
		_, _, _, _, M, M, M, M, M,

		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		M, L, L, M, _, _, _, _, _,
		_, _, _, _, M, L, L, L, M,

		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, T, _, _, _, _, _, _,
		M, L, L, M, _, _, T, _, _,
		_, _, _, _, M, L, L, L, M,

		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, T, _, _, _, _, _,
		_, _, _, _, _, T, _, _, _,
		M, M, M, M, _, _, _, _, _,
		_, _, _, _, M, L, L, L, M,

		_, _, _, _, T, _, _, _, _,
		_, _, _, _, T, _, _, _, _,
		_, _, _, _, T, _, _, _, _,
		_, _, _, _, T, _, _, _, _,
		_, _, _, _, T, _, _, _, _,
		_, _, _, _, T, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		M, M, M, M, M, M, M, M, M,

		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, T, _, _, _,
		_, _, _, T, _, _, _, _, _,
		_, _, _, _, _, M, M, M, M,
		M, L, L, L, M, _, _, _, _,

		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, T, _, _,
		_, _, T, _, _, M, L, L, M,
		M, L, L, L, M, _, _, _, _,

		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, M, L, L, M,
		M, L, L, L, M, _, _, _, _,

		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, _, _, _, _,
		_, _, _, _, _, M, M, M, M,
		M, M, M, M, M, _, _, _, _,
	},
}