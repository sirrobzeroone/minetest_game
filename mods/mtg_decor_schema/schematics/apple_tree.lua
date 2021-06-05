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
--            Cactus Large Schematic              --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local apple_trunk =  minetest.registered_aliases["mtg_decor_schema:apple_tree_trunk"] or "mtg_decor_schema:apple_tree_trunk"
local apple_leaves = minetest.registered_aliases["mtg_decor_schema:apple_tree_leaves"] or "mtg_decor_schema:apple_tree_leaves"
local apple =        minetest.registered_aliases["mtg_decor_schema:apple_tree_apple"] or "mtg_decor_schema:apple_tree_apple"

-- tree schematic
local _ = {name = "air", prob = 0}
local M = {name = apple_leaves, prob = 255}
local N = {name = apple_leaves, prob = 223}
local F = {name = apple, prob = 63}
local Y = {name = apple_trunk, prob = 255, force_place = true}

path.apple_tree = {
	size = {x = 7, y = 8, z = 7},
	yslice_prob = {
		{ypos = 2, prob = 127},
	},
	data = {
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, N, M, N, _, _,
		_, _, _, N, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,

		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, M, M, F, M, M, _,
		_, N, M, M, M, N, _,
		_, _, N, M, N, _, _,
		_, _, _, _, _, _, _,

		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		N, M, Y, _, _, M, N,
		_, M, M, _, Y, M, _,
		_, N, M, M, M, N, _,
		_, _, _, N, _, _, _,

		_, _, _, Y, _, _, _,
		_, _, _, Y, _, _, _,
		_, _, _, Y, _, _, _,
		_, _, _, Y, _, _, _,
		M, F, _, Y, _, F, M,
		N, M, _, _, _, M, N,
		_, M, M, M, M, M, _,
		_, _, N, M, N, _, _,

		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		N, M, _, _, Y, M, N,
		_, M, Y, _, M, M, _,
		_, N, M, M, M, N, _,
		_, _, _, N, _, _, _,

		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, M, M, F, M, M, _,
		_, N, M, M, M, N, _,
		_, _, N, M, N, _, _,
		_, _, _, _, _, _, _,

		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
		_, _, N, M, N, _, _,
		_, _, _, N, _, _, _,
		_, _, _, _, _, _, _,
		_, _, _, _, _, _, _,
	},
}
