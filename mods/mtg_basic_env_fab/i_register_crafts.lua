----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
--   ___     _        _         _   _             --
--  | __|_ _| |__ _ _(_)__ __ _| |_(_)___ _ _     --
--  | _/ _` | '_ \ '_| / _/ _` |  _| / _ \ ' \    --
--  |_|\__,_|_.__/_| |_\__\__,_|\__|_\___/_||_|   --
----------------------------------------------------
--        MTG Basic Environment Fabrication       --
----------------------------------------------------
--               Crafting/Recipes                 --
----------------------------------------------------

--[[-------------
--  Index/Key  --
-----------------
-----------
-- Stone --
-----------

	All Brick Recipes:
		Recipe: "mtg_basic_env:<material> (4) to mtg_basic_env_fab:<material>_brick (4)
		Recipe Example: "mtg_basic_env:stone" (4) to mtg_basic_env_fab:stone_brick (4)
	
	All Block Recipes:				
		Recipe: "mtg_basic_env:<material> (9) to mtg_basic_env_fab:<material>_block (9)	
		Recipe Example: "mtg_basic_env:stone" (9) to mtg_basic_env_fab:stone_block (9)	

	The above are avaliable for: stone, stone_desert, sandstone, sandstone_desert, sandstone_silver, obsidian
	
	mtg_basic_env_fab:obsidian_shard
		Recipe: mtg_basic_env:obsidian (1) to mtg_basic_env_fab:obsidian_shard (9)		
		Recipe: mtg_basic_env_fab:obsidian_shard (9) to mtg_basic_env:obsidian (1)	

-----------
--  Ore  --
-----------
		Recipe: mtg_basic_env:coal_lump(9) to mtg_basic_env_fab:coal_block (1)
		Recipe: mtg_basic_env_fab:coal_block (1) to mtg_basic_env:coal_lump(9)
		
----------------
--  Crystal   --
----------------
	mtg_basic_env_fab:mese_crystal_shard
		Recipe: mtg_basic_env_fab:mese_crystal_shard (9) to mtg_basic_env:mese_crystal (1)
		Recipe: mtg_basic_env:mese_crystal (1) to mtg_basic_env_fab:mese_crystal_shard (9)			
		Recipe: mtg_basic_env:mese_crystal (9) to mtg_basic_env_fab:mese (1)	
		Recipe: mtg_basic_env_fab:mese (1) to mtg_basic_env:mese_crystal (9)
		
	mtg_basic_env_fab:crystal_diamond_shard
		Recipe: mtg_basic_env_fab:crystal_diamond_shard (9) to mtg_basic_env:crystal_diamond (1)
		Recipe: mtg_basic_env:crystal_diamond (1) to mtg_basic_env_fab:crystal_diamond_shard (9)			
		Recipe: mtg_basic_env:crystal_diamond (9) to mtg_basic_env_fab:crystal_diamond_block (1)
		Recipe: mtg_basic_env_fab:crystal_diamond_block (1) to mtg_basic_env:crystal_diamond (9) 
--]]

-- Assign recipe ingredients to variables/tables to check for aliases this will
-- help make ingredient name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases

local stone = minetest.registered_aliases["mtg_basic_env:stone"] or "mtg_basic_env:stone"
local stone_brick = minetest.registered_aliases["mtg_basic_env_fab:stone_brick"] or "mtg_basic_env_fab:stone_brick"
local stone_block = minetest.registered_aliases["mtg_basic_env_fab:stone_block"] or "mtg_basic_env_fab:stone_block"
local sandstone = minetest.registered_aliases["mtg_basic_env:sandstone"] or "mtg_basic_env:sandstone"
local sandstone_brick = minetest.registered_aliases["mtg_basic_env_fab:sandstone_brick"] or "mtg_basic_env_fab:sandstone_brick"
local sandstone_block = minetest.registered_aliases["mtg_basic_env_fab:sandstone_block"] or "mtg_basic_env_fab:sandstone_block"
local sandstone_desert = minetest.registered_aliases["mtg_basic_env:sandstone_desert"] or "mtg_basic_env:sandstone_desert"
local sandstone_desert_brick = minetest.registered_aliases["mtg_basic_env_fab:sandstone_desert_brick"] or "mtg_basic_env_fab:sandstone_desert_brick"
local sandstone_desert_block = minetest.registered_aliases["mtg_basic_env_fab:sandstone_desert_block"] or "mtg_basic_env_fab:sandstone_desert_block"
local sandstone_silver = minetest.registered_aliases["mtg_basic_env:sandstone_silver"] or "mtg_basic_env:sandstone_silver"
local sandstone_silver_brick = minetest.registered_aliases["mtg_basic_env_fab:sandstone_silver_brick"] or "mtg_basic_env_fab:sandstone_silver_brick"
local sandstone_silver_block = minetest.registered_aliases["mtg_basic_env_fab:sandstone_silver_block"] or "mtg_basic_env_fab:sandstone_silver_block"
local obsidian = minetest.registered_aliases["mtg_basic_env:obsidian"] or "mtg_basic_env:obsidian"
local obsidian_brick = minetest.registered_aliases["mtg_basic_env_fab:obsidian_brick"] or "mtg_basic_env_fab:obsidian_brick"
local obsidian_block = minetest.registered_aliases["mtg_basic_env_fab:obsidian_block"] or "mtg_basic_env_fab:obsidian_block"
local obsidian_shard = minetest.registered_aliases["mtg_basic_env:obsidian"] or "mtg_basic_env_fab:obsidian_shard"

local coal_lump = minetest.registered_aliases["mtg_basic_env:coal_lump"] or "mtg_basic_env:coal_lump"
local coal_block = minetest.registered_aliases["mtg_basic_env_fab:coal_block"] or "mtg_basic_env_fab:coal_block"

local mese_shard = minetest.registered_aliases["mtg_basic_env_fab:mese_crystal_shard"] or "mtg_basic_env_fab:mese_crystal_shard"
local mese_crystal = minetest.registered_aliases["mtg_basic_env:mese_crystal"] or "mtg_basic_env:mese_crystal"
local mese_block = minetest.registered_aliases["mtg_basic_env_fab:mese"] or "mtg_basic_env_fab:mese"
local diamond_shard = minetest.registered_aliases["mtg_basic_env_fab:diamond_crystal_shard"] or "mtg_basic_env_fab:diamond_crystal_shard"
local diamond_crystal = minetest.registered_aliases["mtg_basic_env:diamond_crystal"] or "mtg_basic_env:diamond_crystal"
local diamond_block = minetest.registered_aliases["mtg_basic_env_fab:diamond_crystal_block"] or "mtg_basic_env_fab:diamond_crystal_block"

-----------
-- Stone --
-----------
minetest.register_craft({
	output = stone_brick.." 4",
	recipe = {
		{stone, stone},
		{stone, stone},
	}
})

minetest.register_craft({
	output = stone_block.." 9",
	recipe = {
		{stone,stone,stone},
		{stone,stone,stone},
		{stone,stone,stone},
	}
})

minetest.register_craft({
	output = sandstone_brick.." 4",
	recipe = {
		{sandstone, sandstone},
		{sandstone, sandstone},
	}
})

minetest.register_craft({
	output = sandstone_block.." 9",
	recipe = {
		{sandstone,sandstone,sandstone},
		{sandstone,sandstone,sandstone},
		{sandstone,sandstone,sandstone},
	}
})

minetest.register_craft({
	output = sandstone_desert_brick.." 4",
	recipe = {
		{sandstone_desert, sandstone_desert},
		{sandstone_desert, sandstone_desert},
	}
})

minetest.register_craft({
	output = sandstone_desert_block.." 9",
	recipe = {
		{sandstone_desert,sandstone_desert,sandstone_desert},
		{sandstone_desert,sandstone_desert,sandstone_desert},
		{sandstone_desert,sandstone_desert,sandstone_desert},
	}
})

minetest.register_craft({
	output = sandstone_silver_brick.." 4",
	recipe = {
		{sandstone_silver, sandstone_silver},
		{sandstone_silver, sandstone_silver},
	}
})

minetest.register_craft({
	output = sandstone_silver_block.." 9",
	recipe = {
		{sandstone_silver,sandstone_silver,sandstone_silver},
		{sandstone_silver,sandstone_silver,sandstone_silver},
		{sandstone_silver,sandstone_silver,sandstone_silver},
	}
})

minetest.register_craft({
	output = obsidian_brick.." 4",
	recipe = {
		{obsidian, obsidian},
		{obsidian, obsidian},
	}
})

minetest.register_craft({
	output = obsidian_block.." 9",
	recipe = {
		{obsidian,obsidian,obsidian},
		{obsidian,obsidian,obsidian},
		{obsidian,obsidian,obsidian},
	}
})

minetest.register_craft({
	output = obsidian_shard.." 9",
	recipe = {
		{obsidian}
	}
})

minetest.register_craft({
	output = obsidian,
	recipe = {
		{obsidian_shard, obsidian_shard, obsidian_shard},
		{obsidian_shard, obsidian_shard, obsidian_shard},
		{obsidian_shard, obsidian_shard, obsidian_shard},
	}
})

-----------
--  Ore  --
-----------
minetest.register_craft({
	output = coal_block,
	recipe = {
		{coal_lump, coal_lump, coal_lump},
		{coal_lump, coal_lump, coal_lump},
		{coal_lump, coal_lump, coal_lump},
	}
})

minetest.register_craft({
	output = coal_lump.." 9",
	recipe = {
		{coal_block},
	}
})

----------------
--  Crystal   --
----------------
minetest.register_craft({
	output = mese_crystal,
	recipe = {
		{mese_shard,mese_shard,mese_shard},
		{mese_shard,mese_shard,mese_shard},
		{mese_shard,mese_shard,mese_shard},
	}
})

minetest.register_craft({
	output = mese_shard.." 9",
	recipe = {
		{mese_crystal}
	}
})

minetest.register_craft({
	output = mese_block,
	recipe = {
		{mese_crystal,mese_crystal,mese_crystal},
		{mese_crystal,mese_crystal,mese_crystal},
		{mese_crystal,mese_crystal,mese_crystal},
	}
})

minetest.register_craft({
	output = mese_crystal.." 9",
	recipe = {
		{mese_block}
	}
})

minetest.register_craft({
	output = diamond_crystal,
	recipe = {
		{diamond_shard,diamond_shard,diamond_shard},
		{diamond_shard,diamond_shard,diamond_shard},
		{diamond_shard,diamond_shard,diamond_shard},
	}
})

minetest.register_craft({
	output = diamond_shard.." 9",
	recipe = {
		{diamond_crystal}
	}
})

minetest.register_craft({
	output = diamond_block,
	recipe = {
		{diamond_crystal,diamond_crystal,diamond_crystal},
		{diamond_crystal,diamond_crystal,diamond_crystal},
		{diamond_crystal,diamond_crystal,diamond_crystal},
	}
})

minetest.register_craft({
	output = diamond_crystal.." 9",
	recipe = {
		{diamond_block}
	}
})