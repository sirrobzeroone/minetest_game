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
--              Aspen Tree Schematic              --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local aspen_trunk =  minetest.registered_aliases["mtg_decor_schema:aspen_tree_trunk"] or "mtg_decor_schema:aspen_tree_trunk"
local aspen_leaves = minetest.registered_aliases["mtg_decor_schema:aspen_tree_leaves"] or "mtg_decor_schema:aspen_tree_leaves"

--tree schematic
local _ = {name = "air", prob = 0}
local T = {name = aspen_trunk, prob = 255, force_place = true}
local B = {name = aspen_trunk, prob = 255}
local L = {name = aspen_leaves, prob = 255}
local M = {name = aspen_leaves, prob = 223}
local N = {name = aspen_leaves, prob = 127}

path.aspen_tree = {
	size = {x = 5, y = 14, z = 5},
	yslice_prob = {
		{ypos = 2, prob = 127},
		{ypos = 3, prob = 127},
		{ypos = 4, prob = 127},
		{ypos = 8, prob = 127},
		{ypos = 10, prob = 127},
	},
	data = {
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		N, M, L, M, N,
		_, _, _, _, _,
		N, M, L, M, N,
		_, _, _, _, _,
		N, M, L, M, N,
		_, _, _, _, _,
		_, _, _, _, _,

		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, M, L, M, _,
		M, L, L, L, M,
		_, M, L, M, _,
		M, L, L, L, M,
		_, M, L, M, _,
		M, L, L, L, M,
		_, M, L, M, _,
		_, _, _, _, _,

		_, _, T, _, _,
		_, _, T, _, _,
		_, _, T, _, _,
		_, _, T, _, _,
		_, _, T, _, _,
		_, _, T, _, _,
		_, L, T, L, _,
		L, L, T, L, L,
		_, L, T, L, _,
		L, L, T, L, L,
		_, L, T, L, _,
		L, L, T, L, L,
		_, L, L, L, _,
		_, _, L, _, _,

		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, M, L, M, _,
		M, L, L, L, M,
		_, M, L, M, _,
		M, L, L, L, M,
		_, M, L, M, _,
		M, L, L, L, M,
		_, M, L, M, _,
		_, _, _, _, _,

		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		N, M, L, M, N,
		_, _, _, _, _,
		N, M, L, M, N,
		_, _, _, _, _,
		N, M, L, M, N,
		_, _, _, _, _,
		_, _, _, _, _,
	},
}
