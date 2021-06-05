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
--                     Fuel                       --
----------------------------------------------------

-- Alias Check
local cactus = minetest.registered_aliases["mtg_decor_schema:cactus"] or "mtg_decor_schema:cactus"
local cactus_sap = minetest.registered_aliases["mtg_decor_schema:cactus_sapling_large"] or "mtg_decor_schema:cactus_sapling_large"
local papyrus = minetest.registered_aliases["mtg_decor_schema:papyrus"] or "mtg_decor_schema:papyrus"
local bush_stem = minetest.registered_aliases["mtg_decor_schema:bush_stem"] or "mtg_decor_schema:bush_stem"
local bush_sap = minetest.registered_aliases["mtg_decor_schema:bush_sapling"] or "mtg_decor_schema:bush_sapling"
local acacia_bush_stem = minetest.registered_aliases["mtg_decor_schema:acacia_bush_stem"] or "mtg_decor_schema:acacia_bush_stem"
local acacia_bush_sap = minetest.registered_aliases["mtg_decor_schema:acacia_bush_sapling"] or  "mtg_decor_schema:acacia_bush_sapling"
local pine_bush_stem = minetest.registered_aliases["mtg_decor_schema:pine_bush_stem"] or "mtg_decor_schema:pine_bush_stem"
local pine_bush_sap = minetest.registered_aliases["mtg_decor_schema:pine_bush_sapling"] or  "mtg_decor_schema:pine_bush_sapling"

local acacia_sap = minetest.registered_aliases["mtg_decor_schema:acacia_tree_sapling"] or "mtg_decor_schema:acacia_tree_sapling"
local aspen_sap = minetest.registered_aliases["mtg_decor_schema:aspen_tree_sapling"] or "mtg_decor_schema:aspen_tree_sapling"
local pine_sap = minetest.registered_aliases["mtg_decor_schema:pine_tree_sapling"] or "mtg_decor_schema:pine_tree_sapling"
local jungle_sap = minetest.registered_aliases["mtg_decor_schema:jungle_tree_sapling"] or "mtg_decor_schema:jungle_tree_sapling"
local jungle_sap_em = minetest.registered_aliases["mtg_decor_schema:jungle_tree_sapling_emergant"] or "mtg_decor_schema:jungle_tree_sapling_emergant"

local acacia_trunk = minetest.registered_aliases["mtg_decor_schema:acacia_tree_trunk"] or "mtg_decor_schema:acacia_tree_trunk"
local aspen_trunk = minetest.registered_aliases["mtg_decor_schema:aspen_tree_trunk"] or "mtg_decor_schema:aspen_tree_trunk"
local pine_trunk = minetest.registered_aliases["mtg_decor_schema:pine_tree_trunk"] or "mtg_decor_schema:pine_tree_trunk" 
local jungle_trunk = minetest.registered_aliases["mtg_decor_schema:jungle_tree_trunk"] or "mtg_decor_schema:jungle_tree_trunk"

local acacia_wood = minetest.registered_aliases["mtg_decor_schema:acacia_tree_wood"] or "mtg_decor_schema:acacia_tree_wood"
local aspen_wood = minetest.registered_aliases["mtg_decor_schema:aspen_tree_wood"] or "mtg_decor_schema:aspen_tree_wood"
local pine_wood = minetest.registered_aliases["mtg_decor_schema:pine_tree_wood"] or "mtg_decor_schema:pine_tree_wood" 
local jungle_wood = minetest.registered_aliases["mtg_decor_schema:jungle_tree_wood"] or "mtg_decor_schema:jungle_tree_wood"
-----------------------
-- Fuel Registration --
-----------------------
minetest.register_craft({
	type = "fuel",
	recipe = cactus,
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = cactus_sap,
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = papyrus,
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = bush_stem,
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = acacia_bush_stem,
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = pine_bush_stem,
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = bush_sap,
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = acacia_bush_sap,
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = pine_bush_sap,
	burntime = 2,
})

-- Trees

-- groups
minetest.register_craft({
	type = "fuel",
	recipe = "group:stick",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 4,
})


-- saplings
minetest.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = acacia_sap,
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = aspen_sap,
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = pine_sap,
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = jungle_sap,
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = jungle_sap_em,
	burntime = 7,
})


-- Trunk/log
-- Burn time for all woods are in order of wood density,
-- which is also the order of wood colour darkness:
-- aspen, pine, apple, acacia, jungle

minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = aspen_trunk,
	burntime = 22,
})

minetest.register_craft({
	type = "fuel",
	recipe = pine_trunk,
	burntime = 26,
})

minetest.register_craft({
	type = "fuel",
	recipe = acacia_trunk,
	burntime = 34,
})

minetest.register_craft({
	type = "fuel",
	recipe = jungle_trunk,
	burntime = 38,
})


-- Wood
-- Support use of group:wood, includes default:wood which has the same burn time
minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = aspen_wood,
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = pine_wood,
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = acacia_wood,
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = jungle_wood,
	burntime = 9,
})
