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
--                    Nodes                       --
----------------------------------------------------

-- support for MT game translation.
local S = mtg_basic_env_cook.translator

--[[ 
Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

Node reg names can be adjusted to whatever you like just ensure to update "i_aliases_nodes.lua" 
for both default aliases and mtg_basic_env_cook aliases, I have left a commented out section
inside aliases so this can easily be done, this means it should be easier to have game 
specific registered node names but retain compatability with mods. 

-----------
-- Metal --
-----------
mtg_basic_env_cook:steel_block
mtg_basic_env_cook:tin_block
mtg_basic_env_cook:bronze_block
mtg_basic_env_cook:copper_block
mtg_basic_env_cook:silver_block
mtg_basic_env_cook:gold_block

----------------
--  Other   --
----------------
mtg_basic_env_cook:brick_block
mtg_basic_env_cook:glass
mtg_basic_env_cook:obsidian_glass

--]]

--------------------
-- Register Nodes --
--------------------
-----------
-- Metal --
-----------
minetest.register_node("mtg_basic_env_cook:steel_block", {
	description = S("Steel Block"),
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = mtg_basic_sounds.node_sound_metal(),
})

minetest.register_node("mtg_basic_env_cook:tin_block", {
	description = S("Tin Block"),
	tiles = {"default_tin_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = mtg_basic_sounds.node_sound_metal(),
})

minetest.register_node("mtg_basic_env_cook:bronze_block", {
	description = S("Bronze Block"),
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = mtg_basic_sounds.node_sound_metal(),
})

minetest.register_node("mtg_basic_env_cook:copper_block", {
	description = S("Copper Block"),
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = mtg_basic_sounds.node_sound_metal(),
})

minetest.register_node("mtg_basic_env_cook:silver_block", {
	description = S("Silver Block"),
	tiles = {"moreores_silver_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = mtg_basic_sounds.node_sound_metal(),
})

minetest.register_node("mtg_basic_env_cook:gold_block", {
	description = S("Gold Block"),
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = mtg_basic_sounds.node_sound_metal(),
})

----------------
--  Other   --
----------------
minetest.register_node("mtg_basic_env_cook:brick_block", {
	description = S("Brick Block"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {
		"default_brick.png^[transformFX",
		"default_brick.png",
	},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env_cook:glass", {
	description = S("Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	use_texture_alpha = "clip", -- only needed for stairs API
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = mtg_basic_sounds.node_sound_glass(),
})

minetest.register_node("mtg_basic_env_cook:obsidian_glass", {
	description = S("Obsidian Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	use_texture_alpha = "clip", -- only needed for stairs API
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = mtg_basic_sounds.node_sound_glass(),
	groups = {cracky = 3},
})
