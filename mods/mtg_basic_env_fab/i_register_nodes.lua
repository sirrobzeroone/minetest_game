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
--                    Nodes                       --
----------------------------------------------------

-- support for MT game translation.
local S = mtg_basic_env_fab.translator

--[[ 
Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

Node reg names can be adjusted to whatever you like just ensure to update "i_aliases_nodes.lua" 
for both default aliases and lib_basic_env_fab aliases, I have left a commented out section
inside aliases so this can easily be done, this means it should be easier to have game 
specific registered node names but retain compatability with mods. 

-----------
-- Stone --
-----------
	mtg_basic_env_fab:stone_brick
	mtg_basic_env_fab:stone_block
	mtg_basic_env_fab:stone_desert_brick
	mtg_basic_env_fab:stone_desert_block

	mtg_basic_env_fab:sandstone_brick
	mtg_basic_env_fab:sandstone_block
	mtg_basic_env_fab:sandstone_desert_brick
	mtg_basic_env_fab:sandstone_desert_block
	mtg_basic_env_fab:sandstone_silver_brick
	mtg_basic_env_fab:sandstone_silver_block

	mtg_basic_env_fab:obsidian_brick
	mtg_basic_env_fab:obsidian_block

-----------
--  Ore  --
-----------
	mtg_basic_env_fab:coal_block	
	
----------------
--  Crystal   --
----------------
	mtg_basic_env_fab:mese                  (name retained as "mese" deliberately, equals "mese_crystal_block")
	mtg_basic_env_fab:diamond_crystal_block 

--]]

--------------------
-- Register Nodes --
--------------------
-----------
-- Stone --
-----------
minetest.register_node("mtg_basic_env_fab:stone_brick", {
	description = S("Stone Brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:stone_block", {
	description = S("Stone Block"),
	tiles = {"default_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:stone_desert_brick", {
	description = S("Desert Stone Brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:stone_desert_block", {
	description = S("Desert Stone Block"),
	tiles = {"default_desert_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:sandstone_brick", {
	description = S("Sandstone Brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:sandstone_block", {
	description = S("Sandstone Block"),
	tiles = {"default_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:sandstone_desert_brick", {
	description = S("Desert Sandstone Brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_desert_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:sandstone_desert_block", {
	description = S("Desert Sandstone Block"),
	tiles = {"default_desert_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:sandstone_silver_brick", {
	description = S("Silver Sandstone Brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_silver_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:sandstone_silver_block", {
	description = S("Silver Sandstone Block"),
	tiles = {"default_silver_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_fab:obsidian_brick", {
	description = S("Obsidian Brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = mtg_basic_sounds.node_sound_stone(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("mtg_basic_env_fab:obsidian_block", {
	description = S("Obsidian Block"),
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = mtg_basic_sounds.node_sound_stone(),
	groups = {cracky = 1, level = 2},
})


-----------
--  Ore  --
-----------
minetest.register_node("mtg_basic_env_fab:coal_block", {
	description = S("Coal Block"),
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = mtg_basic_sounds.node_sound_stone(),
})


----------------
--  Crystal   --
----------------
minetest.register_node("mtg_basic_env_fab:mese", {
	description = S("Mese Block"),
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
	light_source = 3,
})

minetest.register_node("mtg_basic_env_fab:diamond_crystal_block", {
	description = S("Diamond Block"),
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = mtg_basic_sounds.node_sound_stone(),
})