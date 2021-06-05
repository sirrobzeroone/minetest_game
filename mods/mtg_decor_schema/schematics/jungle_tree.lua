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
--            Jungle Tree Schematic               --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local jungle_trunk =  minetest.registered_aliases["mtg_decor_schema:jungle_tree_trunk"] or "mtg_decor_schema:jungle_tree_trunk"
local jungle_leaves = minetest.registered_aliases["mtg_decor_schema:jungle_tree_leaves"] or "mtg_decor_schema:jungle_tree_leaves"

-- tree schematic
local _ = {name = "air", prob = 0}
local L = {name = jungle_leaves, prob = 255}
local N = {name = jungle_leaves, prob = 223}
local M = {name = jungle_leaves, prob = 191}
local B = {name = jungle_trunk, prob = 255, force_place = true}
local Y = {name = jungle_trunk, prob = 191, force_place = true}
local U = {name = jungle_trunk, prob = 127, force_place = true}
local I = {name = jungle_trunk, prob = 255}

path.jungle_tree = {
	size = {x = 5, y = 17, z = 5},
	yslice_prob = {
		{ypos=6, prob=191},
		{ypos=7, prob=191},
		{ypos=8, prob=191},
		{ypos=9, prob=191},
		{ypos=10, prob=191},
	},	
	data = {
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
		N, L, N, _, _,
		_, _, N, L, N,
		_, _, _, _, _,
		_, _, _, _, _,
		M, N, N, N, M,
		M, N, N, N, M,
		_, _, _, _, _,

		_, _, B, _, _,
		_, _, B, _, _,
		_, _, U, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		L, B, L, _, _,
		_, _, L, B, L,
		_, _, _, _, _,
		_, _, _, _, _,
		N, B, L, B, N,
		N, L, L, L, N,
		_, N, N, N, _,

		_, B, B, B, _,
		_, B, B, B, _,
		_, U, B, U, _,
		_, _, B, _, _,
		_, _, B, _, _,
		_, _, B, _, _,
		_, _, B, _, _,
		_, _, B, _, _,
		_, _, B, L, N,
		N, L, B, _, _,
		N, L, B, _, _,
		_, _, B, L, N,
		_, _, B, L, N,
		_, _, B, _, _,
		N, L, L, L, N,
		N, L, L, L, N,
		_, N, L, N, _,

		_, _, B, _, _,
		_, _, B, _, _,
		_, _, U, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, L, B, L,
		L, B, L, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, L, B, L,
		_, _, _, _, _,
		N, B, L, B, N,
		N, L, L, L, N,
		_, N, N, N, _,

		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, N, L, N,
		N, L, N, _, _,
		_, _, _, _, _,
		_, _, _, _, _,
		_, _, N, L, N,
		_, _, _, _, _,
		M, N, N, N, M,
		M, N, N, N, M,
		_, _, _, _, _,
	},
}
