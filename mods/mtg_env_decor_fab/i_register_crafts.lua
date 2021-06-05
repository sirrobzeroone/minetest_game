----------------------------------------------------
--   ___           __       ___                   --
--  | __|_ ___ __ / _|___  |   \ ___ __ ___ _ _   --
--  | _|| ' \ V / > _|_ _| | |) / -_) _/ _ \ '_|  --
--  |___|_||_\_/  \_____|  |___/\___\__\___/_|    --
--    ___     _        _         _   _            --
--   | __|_ _| |__ _ _(_)__ __ _| |_(_)___ _ _    --
--   | _/ _` | '_ \ '_| / _/ _` |  _| / _ \ ' \   --
--   |_|\__,_|_.__/_| |_\__\__,_|\__|_\___/_||_|  --
----------------------------------------------------
--      MTG Environment & Decor Fabrication       --
----------------------------------------------------
--               Crafting/Recipes                 --
----------------------------------------------------

--[[-------------
--  Index/Key  --
-----------------
-------------
--  Misc   --
-------------
Bookshelf:
	Recipe: "group:wood" (6) + "mtg_env_decor_fab:book" (3) to "mtg_env_decor_fab:bookshelf" (1)
Paper:
	Recipe: "mtg_decor_schema:papyrus" (3) to "mtg_env_decor_fab:paper" (1)
Book:
	Recipe: "mtg_env_decor_fab:paper" (3) to "mtg_env_decor_fab:book" (1)
Book Copy:
	Recipe: "mtg_env_decor_fab:book" (1) + "mtg_env_decor_fab:book_written" (1) to "mtg_env_decor_fab:book_written" (2)

Sign Wood:
	Recipe: "group:wood" (6) + "group:stick" (1) to "mtg_env_decor_fab:sign_wall_wood" (1)
Sign Steel:
	Recipe: "group:steel_ingot" (6) + "group:stick" (1) to "mtg_env_decor_fab:sign_wall_wood" (1)	

Ladder Wood:
	Recipe: "group:stick" (7) to "mtg_env_decor_fab:ladder_wood" (1)
Ladder Steel:
	Recipe: "group:steel_ingot" (7) to "mtg_env_decor_fab:ladder_steel" (1)	
	
------------
-- Fences --
------------
Registered as part of i_functions.lua - Fence/Rail register helper
All Fence Recipe:
		Recipe: mtg_decor_schema:<material> (4) + group:stick (2) to mtg_env_decor_fab:fence_<subset material name> (4)	
		Recipe Example: "mtg_decor_schema:apple_tree_wood" (4) + "mtg_decor_schema:stick" (2) to "mtg_env_decor_fab:fence_apple_tree_wood" (4)
		
All Rail Recipe:
		Recipe: mtg_decor_schema:<material> (4) to mtg_env_decor_fab:fence_rail_<subset material name> (8)	
		Recipe Example: "mtg_decor_schema:apple_tree_wood" (4) to "mtg_env_decor_fab:fence_rail_apple_tree_wood" (8)
		
--------------
--   Lamps  --
--------------
Mese Lamp:
	Recipe: "mtg_basic_env_cook:glass" (1) + "mtg_basic_env:mese_crystal" (1) to "mtg_env_decor_fab:mese_lamp" (1)
	
Mese Post Light
	Recipe: "mtg_basic_env_cook:glass" (1) + "mtg_basic_env:mese_crystal" (3) to "mtg_env_decor_fab:mese_post_light" (3)
--]]

-- Assign recipe ingredients to variables/tables to check for aliases this will
-- help make ingredient name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local bookshelf = minetest.registered_aliases["mtg_env_decor_fab:bookshelf"] or "mtg_env_decor_fab:bookshelf"
local papyrus = minetest.registered_aliases["mtg_decor_schema:papyrus"] or "mtg_decor_schema:papyrus"
local paper = minetest.registered_aliases["mtg_env_decor_fab:paper"] or "mtg_env_decor_fab:paper"
local book = minetest.registered_aliases["mtg_env_decor_fab:book"] or "mtg_env_decor_fab:book"
local book_written = minetest.registered_aliases["mtg_env_decor_fab:book_written"] or "mtg_env_decor_fab:book_written"
local sign_wood = minetest.registered_aliases["mtg_env_decor_fab:sign_wall_wood"] or "mtg_env_decor_fab:sign_wall_wood"
local sign_steel = minetest.registered_aliases["mtg_env_decor_fab:sign_wall_steel"] or "mtg_env_decor_fab:sign_wall_steel"
local ladder_wood = minetest.registered_aliases["mtg_env_decor_fab:ladder_wood"] or "mtg_env_decor_fab:ladder_wood"
local ladder_steel = minetest.registered_aliases["mtg_env_decor_fab:ladder_steel"] or "mtg_env_decor_fab:ladder_steel"
local mese_lamp = minetest.registered_aliases["mtg_env_decor_fab:mese_lamp"] or "mtg_env_decor_fab:mese_lamp"
local glass = minetest.registered_aliases["mtg_basic_env_cook:glass"] or "mtg_basic_env_cook:glass"
local mese_crystal = minetest.registered_aliases["mtg_basic_env:mese_crystal"] or "mtg_basic_env:mese_crystal"
local mese_post_light = minetest.registered_aliases["mtg_env_decor_fab:mese_post_light"] or "mtg_env_decor_fab:mese_post_light"

----------
-- Misc --
----------
minetest.register_craft({
	output = bookshelf,
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{    book    ,     book    ,     book    },
		{"group:wood", "group:wood", "group:wood"},
	}
})

minetest.register_craft({
	output = paper,
	recipe = {
		{papyrus, papyrus, papyrus},
	}
})

minetest.register_craft({
	output = book,
	recipe = {
		{paper},
		{paper},
		{paper},
	}
})

mtg_global.register_craft_metadata_copy(book, book_written)

minetest.register_craft({
	output = sign_wood.." 3",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
		{     ""     , "group:stick",      ""    },
	}
})

minetest.register_craft({
	output = sign_steel.." 3",
	recipe = {
		{"group:steel_ingot", "group:steel_ingot", "group:steel_ingot"},
		{"group:steel_ingot", "group:steel_ingot", "group:steel_ingot"},
		{         ""        ,    "group:stick"   ,         ""         },
	}
})

minetest.register_craft({
	output = ladder_wood.." 5",
	recipe = {
		{"group:stick",      ""      , "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick",      ""      , "group:stick"},
	}
})


minetest.register_craft({
	output = ladder_steel.." 15",
	recipe = {
		{"group:steel_ingot",          ""        , "group:steel_ingot"},
		{"group:steel_ingot", "group:steel_ingot", "group:steel_ingot"},
		{"group:steel_ingot",          ""        , "group:steel_ingot"},
	}
})

------------
-- Fences --
------------
-- registered as part of i_functions.lua - Fence/Rail register helper

--------------
--   Lamps  --
--------------
minetest.register_craft({
	output = mese_lamp,
	recipe = {
		{glass},
		{mese_crystal},
	}
})

minetest.register_craft({
	output = mese_post_light.." 3",
	recipe = {
		{     ""     ,    glass    ,     ""      },
		{mese_crystal, mese_crystal, mese_crystal},
		{     ""     , "group:wood",     ""      },
	}
})