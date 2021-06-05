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
--               Crafting/Recipes                 --
----------------------------------------------------

--[[-------
-- Metal --
-----------

	All Ingot Cooking Recipes:
		Recipe: mtg_basic_env:<material>_lump (1) to mtg_basic_env_cook:<material>_ingot (1)
		Recipe Example: "mtg_basic_env:gold_lump" (1) to "mtg_basic_env_fab:gold_ingot" (1)
	
	All Block Recipes:				
		Recipe: mtg_basic_env_cook:<material>_ingot (9) to mtg_basic_env_cook:<material>_block (1)	
		Recipe Example: "mtg_basic_env_cook:gold_ingot" (9) to "mtg_basic_env_fab:gold_block" (1)	
	
		Recipe: mtg_basic_env_cook:<material>_block (1) to mtg_basic_env_cook:<material>_ingot (9)		
		Recipe Example: "mtg_basic_env_fab:gold_block" (1) to "mtg_basic_env_cook:gold_ingot" (9)	

--------------
--  Other   --
--------------

	"mtg_basic_env_cook:clay_brick"
		Recipe: mtg_basic_env:clay_lump (1) cook to mtg_basic_env_cook:clay_brick (1)

	"mtg_basic_env_cook:brick_block"
		Recipe: mtg_basic_env_cook:clay_brick (4) to mtg_basic_env_cook:brick_block (1)

		Recipe: mtg_basic_env_cook:brick_block (1) to mtg_basic_env_cook:clay_brick (4)
--]]

-- Assign recipe ingredients to variables/tables to check for aliases this will
-- help make ingredient name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases

local iron_lump = minetest.registered_aliases["mtg_basic_env:iron_lump"] or "mtg_basic_env:iron_lump"
local tin_lump = minetest.registered_aliases["mtg_basic_env:tin_lump"] or "mtg_basic_env:tin_lump"
local copper_lump = minetest.registered_aliases["mtg_basic_env:copper_lump"] or "mtg_basic_env:copper_lump"
local silver_lump = minetest.registered_aliases["mtg_basic_env:silver_lump"] or "mtg_basic_env:silver_lump"
local gold_lump = minetest.registered_aliases["mtg_basic_env:gold_lump"] or "mtg_basic_env:gold_lump"
local clay_lump = minetest.registered_aliases["mtg_basic_env:clay_lump"] or "mtg_basic_env:clay_lump"

local steel_ingot = minetest.registered_aliases["mtg_basic_env_cook:steel_ingot"] or "mtg_basic_env_cook:steel_ingot"
local tin_ingot = minetest.registered_aliases["mtg_basic_env_cook:tin_ingot"] or "mtg_basic_env_cook:tin_ingot"
local bronze_ingot = minetest.registered_aliases["mtg_basic_env_cook:bronze_ingot"] or "mtg_basic_env_cook:bronze_ingot"
local copper_ingot = minetest.registered_aliases["mtg_basic_env_cook:copper_ingot"] or "mtg_basic_env_cook:copper_ingot"
local silver_ingot = minetest.registered_aliases["mtg_basic_env_cook:silver_ingot"] or "mtg_basic_env_cook:silver_ingot"
local gold_ingot = minetest.registered_aliases["mtg_basic_env_cook:gold_ingot"] or "mtg_basic_env_cook:gold_ingot"
local clay_brick = minetest.registered_aliases["mtg_basic_env_cook:clay_brick"] or "mtg_basic_env_cook:clay_brick"

local steel_block = minetest.registered_aliases["mtg_basic_env_cook:steel_block"] or "mtg_basic_env_cook:steel_block"
local tin_block = minetest.registered_aliases["mtg_basic_env_cook:tin_block"] or "mtg_basic_env_cook:tin_block"
local bronze_block = minetest.registered_aliases["mtg_basic_env_cook:bronze_block"] or "mtg_basic_env_cook:bronze_block"
local copper_block = minetest.registered_aliases["mtg_basic_env_cook:copper_block"] or "mtg_basic_env_cook:copper_block"
local silver_block = minetest.registered_aliases["mtg_basic_env_cook:silver_block"] or "mtg_basic_env_cook:silver_block"
local gold_block = minetest.registered_aliases["mtg_basic_env_cook:gold_block"] or "mtg_basic_env_cook:gold_block"
local brick_block =  minetest.registered_aliases["mtg_basic_env_cook:brick_block"] or "mtg_basic_env_cook:brick_block"

local glass = minetest.registered_aliases["mtg_basic_env_cook:glass"] or "mtg_basic_env_cook:glass"
local ob_shard = minetest.registered_aliases["mtg_basic_env_fab:obsidian_shard"] or "mtg_basic_env_fab:obsidian_shard"
local ob_glass = minetest.registered_aliases["mtg_basic_env_cook:obsidian_glass"] or "mtg_basic_env_cook:obsidian_glass"

-----------
-- Metal --
-----------
minetest.register_craft({
	type = "cooking",
	output = steel_ingot,
	recipe = iron_lump,
})

minetest.register_craft({
	type = "cooking",
	output = tin_ingot,
	recipe = tin_lump,
})

minetest.register_craft({
	type = "cooking",
	output = copper_ingot,
	recipe = copper_lump,
})

minetest.register_craft({
	type = "cooking",
	output = silver_ingot,
	recipe = silver_lump,
})

minetest.register_craft({
	type = "cooking",
	output = gold_ingot,
	recipe = gold_lump,
})

minetest.register_craft({
	output = bronze_ingot.." 9",
	recipe = {
		{copper_ingot, copper_ingot, copper_ingot},
		{copper_ingot,   tin_ingot , copper_ingot},
		{copper_ingot, copper_ingot, copper_ingot},
	}
})

minetest.register_craft({
	output = steel_block,
	recipe = {
		{steel_ingot, steel_ingot, steel_ingot},
		{steel_ingot, steel_ingot, steel_ingot},
		{steel_ingot, steel_ingot, steel_ingot},
	}
})

minetest.register_craft({
	output = tin_block,
	recipe = {
		{tin_ingot, tin_ingot, tin_ingot},
		{tin_ingot, tin_ingot, tin_ingot},
		{tin_ingot, tin_ingot, tin_ingot},
	}
})

minetest.register_craft({
	output = bronze_block,
	recipe = {
		{bronze_ingot, bronze_ingot, bronze_ingot},
		{bronze_ingot, bronze_ingot, bronze_ingot},
		{bronze_ingot, bronze_ingot, bronze_ingot},
	}
})	

minetest.register_craft({
	output = copper_block,
	recipe = {
		{copper_ingot, copper_ingot, copper_ingot},
		{copper_ingot, copper_ingot, copper_ingot},
		{copper_ingot, copper_ingot, copper_ingot},
	}
})

minetest.register_craft({
	output = silver_block,
	recipe = {
		{silver_ingot, silver_ingot, silver_ingot},
		{silver_ingot, silver_ingot, silver_ingot},
		{silver_ingot, silver_ingot, silver_ingot},
	}
})	
		
minetest.register_craft({
	output = gold_block,
	recipe = {
		{gold_ingot, gold_ingot, gold_ingot},
		{gold_ingot, gold_ingot, gold_ingot},
		{gold_ingot, gold_ingot, gold_ingot},
	}
})

minetest.register_craft({
	output = steel_ingot.." 9",
	recipe = {
		{steel_block},
	}
})

minetest.register_craft({
	output = tin_ingot.." 9",
	recipe = {
		{tin_block},
	}
})

minetest.register_craft({
	output = bronze_ingot.." 9",
	recipe = {
		{bronze_block},
	}
})

minetest.register_craft({
	output = copper_ingot.." 9",
	recipe = {
		{copper_block},
	}
})

minetest.register_craft({
	output = silver_ingot.." 9",
	recipe = {
		{silver_block},
	}
})

minetest.register_craft({
	output = gold_ingot.." 9",
	recipe = {
		{gold_block},
	}
})
--------------
--  Other   --
--------------
minetest.register_craft({
	type = "cooking",
	output = glass,
	recipe = "group:sand",
})

minetest.register_craft({
	type = "cooking",
	output = ob_glass,
	recipe = ob_shard,
})


minetest.register_craft({
	type = "cooking",
	output = clay_brick,
	recipe = clay_lump,
})

minetest.register_craft({
	output = brick_block,
	recipe = {
		{clay_brick, clay_brick},
		{clay_brick, clay_brick},
	}
})

minetest.register_craft({
	output = clay_brick.." 4",
	recipe = {
		{brick_block},
	}
})