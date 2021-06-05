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

----------------------
-- Default settings --
----------------------
-- setup mod global table 
mtg_decor_schema = {}

-- setup table to store schematics
mtg_decor_schema.schematic = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- schematic decorations
if minetest.get_modpath("flowers") ~= nil then
	mtg_decor_schema.flowers = true
else
	mtg_decor_schema.flowers = false
end



--setup translation ref
mtg_decor_schema.translator = minetest.get_translator(modname)

dofile(modpath .. "/schematics/cactus_large.lua")
dofile(modpath .. "/schematics/papyrus_dirt.lua")
dofile(modpath .. "/schematics/papyrus_dirt_dry.lua")

dofile(modpath .. "/schematics/acacia_bush.lua")
dofile(modpath .. "/schematics/bush.lua")
dofile(modpath .. "/schematics/blueberry_bush.lua")
dofile(modpath .. "/schematics/pine_bush.lua")

dofile(modpath .. "/schematics/acacia_tree.lua")
dofile(modpath .. "/schematics/acacia_tree_sapling.lua")
dofile(modpath .. "/schematics/acacia_tree_log.lua")
dofile(modpath .. "/schematics/apple_tree.lua")
dofile(modpath .. "/schematics/apple_tree_sapling.lua")
dofile(modpath .. "/schematics/apple_tree_log.lua")
dofile(modpath .. "/schematics/aspen_tree.lua")
dofile(modpath .. "/schematics/aspen_tree_sapling.lua")
dofile(modpath .. "/schematics/aspen_tree_log.lua")
dofile(modpath .. "/schematics/jungle_tree.lua")
dofile(modpath .. "/schematics/jungle_tree_sapling.lua")
dofile(modpath .. "/schematics/jungle_tree_log.lua")
dofile(modpath .. "/schematics/jungle_tree_emergent.lua")
dofile(modpath .. "/schematics/jungle_tree_emergent_sapling.lua")
dofile(modpath .. "/schematics/pine_tree.lua")
dofile(modpath .. "/schematics/pine_tree_sapling.lua")
dofile(modpath .. "/schematics/pine_tree_sapling_snowy.lua")
dofile(modpath .. "/schematics/pine_tree_log.lua")
dofile(modpath .. "/schematics/pine_tree_small.lua")
dofile(modpath .. "/schematics/pine_tree_small_sapling.lua")
dofile(modpath .. "/schematics/pine_tree_small_sapling_snowy.lua")

dofile(modpath .. "/i_functions.lua")
dofile(modpath .. "/i_register_nodes.lua")
dofile(modpath .. "/i_aliases_nodes.lua")
dofile(modpath .. "/i_register_craftitems.lua")
dofile(modpath .. "/i_aliases_craftitems.lua")
dofile(modpath .. "/i_register_crafts.lua")
dofile(modpath .. "/i_register_decorations.lua")
dofile(modpath .. "/i_register_fuel.lua")
