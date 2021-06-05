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
--                  Craft Items                   --
----------------------------------------------------
-- support for MT game translation.
local S = mtg_decor_schema.translator

--[[
-- These are the minimum craft items that need to be registered 
-- to support drops from the registered nodes and simple fabrication.

-- Craftitem reg names can be adjusted to whatever you like just 
-- ensure to update "i_aliases_craftitems.lua". I have left a 
-- commented out section inside aliases so this can easily be done.

-----------------
--  Index/Key  --
-----------------
---------------
-- Plantlife --
---------------
	mtg_decor_schema:blueberries   >> dropped by >> mtg_decor_schema:blueberry_bush_leaves_berries

-------------
--  Trees  --
-------------
	mtg_decor_schema:stick         >> Fabricated

--]]
--------------------------
-- Register Craft Items --
--------------------------
---------------
-- Plantlife --
---------------
minetest.register_craftitem("mtg_decor_schema:blueberries", {
	description = S("Blueberries"),
	inventory_image = "default_blueberries.png",
	groups = {food_blueberries = 1, food_berry = 1},
	on_use = minetest.item_eat(2),
})

-------------
--  Trees  --
-------------
minetest.register_craftitem("mtg_decor_schema:stick", {
	description = S("Stick"),
	inventory_image = "default_stick.png",
	groups = {stick = 1, flammable = 2},
})
