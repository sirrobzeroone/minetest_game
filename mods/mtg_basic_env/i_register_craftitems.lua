----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
----------------------------------------------------
--             MTG Basic Environment              --
----------------------------------------------------
--                  Craft Items                   --
----------------------------------------------------

-- support for game translation.
local S = mtg_basic_env.translator

--[[
-- These are the minimum craft items that need to be registered 
-- to support drops from the registered nodes.

-- Craftitem reg names can be adjusted to whatever you like just 
-- ensure to update "i_aliases_craftitems.lua". I have left a 
-- commented out section inside aliases so this can easily be done.

-----------------
--  Index/Key  --
-----------------
----------
-- Ores --
----------
	mtg_basic_env:coal_lump       >> dropped by >> mtg_basic_env:stone_coal_ore
	mtg_basic_env:iron_lump       >> dropped by >> mtg_basic_env:stone_iron_ore
	mtg_basic_env:tin_lump        >> dropped by >> mtg_basic_env:stone_tin_ore
	mtg_basic_env:copper_lump     >> dropped by >> mtg_basic_env:stone_copper_ore
	mtg_basic_env:silver_lump     >> dropped by >> mtg_basic_env:stone_silver_ore
	mtg_basic_env:gold_lump       >> dropped by >> mtg_basic_env:stonegold__ore 
	mtg_basic_env:mese_crystal    >> dropped by >> mtg_basic_env:stone_mese_ore
	mtg_basic_env:diamond_crystal >> dropped by >> mtg_basic_env:stonediamond_ore
  
----------------------
-- Soft / Non-Stone --
----------------------
	mtg_basic_env:flint      >> dropped by >> mtg_basic_env:gravel
	mtg_basic_env:clay_lump  >> dropped by >> mtg_basic_env:clay

--]]

--------------------------
-- Register Craft Items --
--------------------------
----------
-- Ores --
----------
minetest.register_craftitem("mtg_basic_env:coal_lump", {
	description = S("Coal Lump"),
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craftitem("mtg_basic_env:iron_lump", {
	description = S("Iron Lump"),
	inventory_image = "default_iron_lump.png"
})

minetest.register_craftitem("mtg_basic_env:tin_lump", {
	description = S("Tin Lump"),
	inventory_image = "default_tin_lump.png"
})

minetest.register_craftitem("mtg_basic_env:copper_lump", {
	description = S("Copper Lump"),
	inventory_image = "default_copper_lump.png"
})

minetest.register_craftitem("mtg_basic_env:silver_lump", {
	description = S("Silver Lump"),
	inventory_image = "default_silver_lump.png"
})

minetest.register_craftitem("mtg_basic_env:gold_lump", {
	description = S("Gold Lump"),
	inventory_image = "default_gold_lump.png"
})

minetest.register_craftitem("mtg_basic_env:mese_crystal", {
	description = S("Mese Crystal"),
	inventory_image = "default_mese_crystal.png",
})

minetest.register_craftitem("mtg_basic_env:diamond_crystal", {
	description = S("Diamond"),
	inventory_image = "default_diamond.png",
})

----------------------
-- Soft / Non-Stone --
----------------------
minetest.register_craftitem("mtg_basic_env:flint", {
	description = S("Flint"),
	inventory_image = "default_flint.png"
})

minetest.register_craftitem("mtg_basic_env:clay_lump", {
	description = S("Clay Lump"),
	inventory_image = "default_clay_lump.png",
})

