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
--               Crafting/Recieps                 --
----------------------------------------------------

--[[-------------
--  Index/Key  --
-----------------
-------------
--  Trees  --
-------------
All Wood Recipes:
	Tree
		Recipe: "mtg_decor_schema:<material>_trunk (1) to mtg_decor_schema::<material>_wood (4)
		Recipe Example: "mtg_decor_schema:apple_tree_trunk" (1) to mtg_decor_schema:apple_tree_wood (4)
		
		Recipe: "mtg_decor_schema:<material>_wood (1) to mtg_decor_schema:stick (4)
		Recipe Example: "mtg_decor_schema:apple_tree_wood" (1) to mtg_decor_schema:stick (4)
	
	Bush
		Recipe: "mtg_decor_schema:<material>_stem (1) to mtg_decor_schema:<material>_wood (1)
		Recipe Example: "mtg_decor_schema:bush_stem" (1) to mtg_decor_schema:apple_tree_wood (1)		

--]]

-- Assign recipe ingredients to variables/tables to check for aliases this will
-- help make ingredient name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local stick =        minetest.registered_aliases["mtg_decor_schema:stick"] or "mtg_decor_schema:stick"
local apple_trunk =  minetest.registered_aliases["mtg_decor_schema:apple_tree_trunk"] or "mtg_decor_schema:apple_tree_trunk"
local apple_wood =   minetest.registered_aliases["mtg_decor_schema:apple_tree_wood"] or "mtg_decor_schema:apple_tree_wood"
local jungle_trunk = minetest.registered_aliases["mtg_decor_schema:jungle_tree_trunk"] or "mtg_decor_schema:jungle_tree_trunk"
local jungle_wood =  minetest.registered_aliases["mtg_decor_schema:jungle_tree_wood"] or "mtg_decor_schema:jungle_tree_wood"
local pine_trunk =   minetest.registered_aliases["mtg_decor_schema:pine_tree_trunk"] or "mtg_decor_schema:pine_tree_trunk"
local pine_wood =    minetest.registered_aliases["mtg_decor_schema:pine_tree_wood"] or "mtg_decor_schema:pine_tree_wood"
local acacia_trunk = minetest.registered_aliases["mtg_decor_schema:acacia_tree_trunk"] or "mtg_decor_schema:acacia_tree_trunk"
local acacia_wood =  minetest.registered_aliases["mtg_decor_schema:acacia_tree_wood"] or "mtg_decor_schema:acacia_tree_wood"
local aspen_trunk =  minetest.registered_aliases["mtg_decor_schema:aspen_tree_trunk"] or "mtg_decor_schema:aspen_tree_trunk"
local aspen_wood =   minetest.registered_aliases["mtg_decor_schema:aspen_tree_wood"] or "mtg_decor_schema:aspen_tree_wood"

local bush_stem =        minetest.registered_aliases["mtg_decor_schema:bush_stem"] or "mtg_decor_schema:bush_stem"
local acacia_bush_stem = minetest.registered_aliases["mtg_decor_schema:acacia_bush_stem"] or "mtg_decor_schema:acacia_bush_stem"
local pine_bush_stem =   minetest.registered_aliases["mtg_decor_schema:pine_bush_stem"] or "mtg_decor_schema:pine_bush_stem"

-------------
--  Trees  --
-------------
minetest.register_craft({
	output = stick.." 4",
	recipe = {
		{"group:wood"},
	}
})

minetest.register_craft({
	output = apple_wood.." 4",
	recipe = {
		{apple_trunk},
	}
})

minetest.register_craft({
	output = jungle_wood.." 4",
	recipe = {
		{jungle_trunk},
	}
})

minetest.register_craft({
	output = pine_wood.." 4",
	recipe = {
		{pine_trunk},
	}
})

minetest.register_craft({
	output = acacia_wood.." 4",
	recipe = {
		{acacia_trunk},
	}
})

minetest.register_craft({
	output = aspen_wood.." 4",
	recipe = {
		{aspen_trunk},
	}
})

minetest.register_craft({
	output = apple_wood,
	recipe = {
		{bush_stem},
	}
})

minetest.register_craft({
	output = acacia_wood,
	recipe = {
		{acacia_bush_stem},
	}
})

minetest.register_craft({
	output = pine_wood,
	recipe = {
		{pine_bush_stem},
	}
})