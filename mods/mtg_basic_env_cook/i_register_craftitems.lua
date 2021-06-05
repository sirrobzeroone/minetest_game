----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
--          ___          _   _                    --
--         / __|___  ___| |_(_)_ _  __ _          --
--        | (__/ _ \/ _ \ / / | ' \/ _` |         --
--         \___\___/\___/_\_\_|_||_\__, |         --
--                                 |___/          --
----------------------------------------------------
--         MTG Basic Environment Cooking          --
----------------------------------------------------
--                  Craft Items                   --
----------------------------------------------------

-- support for MT game translation.
local S = mtg_basic_env_cook.translator

--[[

-- Craftitem reg names can be adjusted to whatever you like just 
-- ensure to update "i_aliases_craftitems.lua". I have left a 
-- commented out section inside aliases so this can easily be done.

-----------
-- Metal --
-----------
mtg_basic_env_cook:steel_ingot
mtg_basic_env_cook:tin_ingot
mtg_basic_env_cook:bronze_ingot
mtg_basic_env_cook:copper_ingot
mtg_basic_env_cook:silver_ingot
mtg_basic_env_cook:gold_ingot

----------------
--  Other   --
----------------
mtg_basic_env_cook:brick_clay

--]]

--------------------------
-- Register Craft Items --
--------------------------
-----------
-- Metal --
-----------
minetest.register_craftitem("mtg_basic_env_cook:steel_ingot", {
	description = S("Steel Ingot"),
	inventory_image = "default_steel_ingot.png",
	groups = {steel_ingot=1}
})

minetest.register_craftitem("mtg_basic_env_cook:tin_ingot", {
	description = S("Tin Ingot"),
	inventory_image = "default_tin_ingot.png",
	groups = {tin_ingot=1}
})

minetest.register_craftitem("mtg_basic_env_cook:bronze_ingot", {
	description = S("Bronze Ingot"),
	inventory_image = "default_bronze_ingot.png",
	groups = {bronze_ingot=1}
})

minetest.register_craftitem("mtg_basic_env_cook:copper_ingot", {
	description = S("Copper Ingot"),
	inventory_image = "default_copper_ingot.png",
	groups = {copper_ingot=1}
})

minetest.register_craftitem("mtg_basic_env_cook:silver_ingot", {
	description = S("Silver Ingot"),
	inventory_image = "moreores_silver_ingot.png",
	groups = {silver_ingot=1}
})

minetest.register_craftitem("mtg_basic_env_cook:gold_ingot", {
	description = S("Gold Ingot"),
	inventory_image = "default_gold_ingot.png",
	groups = {gold_ingot=1}
})


----------------
--  Other   --
----------------
minetest.register_craftitem("mtg_basic_env_cook:clay_brick", {
	description = S("Clay Brick"),
	inventory_image = "default_clay_brick.png"
})

