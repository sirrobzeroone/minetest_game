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
--  Pine Tree Small from Sapling Snowy Schematic  --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local pine_trunk =  minetest.registered_aliases["mtg_decor_schema:pine_tree_trunk"] or "mtg_decor_schema:pine_tree_trunk"
local pine_leaves = minetest.registered_aliases["mtg_decor_schema:pine_tree_leaves"] or "mtg_decor_schema:pine_tree_leaves"
local snow = minetest.registered_aliases["mtg_basic_env:snow"] or "mtg_basic_env:snow" 

--tree schematic
local _ = {name = "air", prob = 0}
local L = {name = pine_leaves, prob = 255}
local M = {name = pine_leaves, prob = 223}
local N = {name = pine_leaves, prob = 191}
local T = {name = pine_trunk, prob = 255, force_place = true}
local B = {name = pine_trunk, prob = 255}
local S = {name = snow, prob = 255}


path.pine_tree_small_sapling_snowy = {
	size = {x = 5, y = 13, z = 5},
	yslice_prob = {
		{ypos = 2, prob = 127},
		{ypos = 3, prob = 127},
	},
	data = {
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, L, L, L, _,
		_, S, L, S, _,
		_, _, S, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,

		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		L, L, _, L, L,
		S, L, L, L, S,
		_, L, L, L, _,
		_, L, L, L, _,
		_, S, L, S, _,
		_, _, L, _, _,
		_, _, S, _, _,
		_, _, _, _, _,
		_, _, _, _, _,

		_, _, B, _, _,
		_, _, T, _, _,
		_, _, B, _, _,
		_, _, B, _, _,
		L, _, B, _, L,
		L, L, B, L, L,
		S, L, B, L, S,
		_, L, B, L, _,
		_, L, B, L, _,
		_, L, L, L, _,
		_, S, L, S, _,
		_, _, L, _, _,
		_, _, S, _, _,

		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		L, L, _, L, L,
		S, L, L, L, S,
		_, L, L, L, _,
		_, L, L, L, _,
		_, S, L, S, _,
		_, _, L, _, _,
		_, _, S, _, _,
		_, _, _, _, _,
		_, _, _, _, _,

		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, L, L, L, _,
		_, S, L, S, _,
		_, _, S, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
	},
}