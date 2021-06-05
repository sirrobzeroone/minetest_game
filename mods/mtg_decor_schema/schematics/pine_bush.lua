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
--                   Pine Bush                    --
----------------------------------------------------

--Shortened path to schematic table
local path = mtg_decor_schema.schematic

-- Check for Aliases 
-- helps future proof name changes so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local pine_bush_stem =  minetest.registered_aliases["mtg_decor_schema:pine_bush_stem"] or "mtg_decor_schema:pine_bush_stem"
local pine_bush_leaves =  minetest.registered_aliases["mtg_decor_schema:pine_bush_leaves"] or "mtg_decor_schema:pine_bush_leaves"


-- tree schematic
local _ = {name = "air", prob = 0}
local L = {name = pine_bush_leaves, prob = 255}
local M = {name = pine_bush_leaves, prob = 191}
local N = {name = pine_bush_leaves, prob = 127}
local S = {name = pine_bush_stem, prob = 255, force_place = true}

path.pine_bush = {
	size = {x = 3, y = 3, z = 3},
	data = {
		_, _, _,
		M, L, M,
		N, M, N,

		_, _, _,
		L, S, L,
		M, L, M,

		_, _, _,
		M, L, M,
		N, M, N,
	},
}