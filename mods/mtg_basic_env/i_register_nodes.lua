----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
----------------------------------------------------
--             MTG Basic Environment              --
----------------------------------------------------
--                    Nodes                       --
----------------------------------------------------
-- support mod translation.
local S = mtg_basic_env.translator

--[[ 
Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

Node reg names can be adjusted to whatever you like just ensure to update "i_aliases_nodes.lua" 
for both default aliases and lib_basic_env aliases, I have left a commented out section
inside aliases so this can easily be done, this means it should be easier to have game 
specific registered node names but retain compatability with mods. 
eg copper/silver/gold could be registered as aeris/argenti/aurum

-----------
-- Stone --
-----------
	mtg_basic_env:stone
	mtg_basic_env:cobble
	mtg_basic_env:cobble_mossy
	mtg_basic_env:obsidian

	mtg_basic_env:stone_desert
	mtg_basic_env:cobble_desert

	mtg_basic_env:sandstone
	mtg_basic_env:sandstone_desert
	mtg_basic_env:sandstone_silver

----------
-- Ores --
----------
	mtg_basic_env:stone_coal_ore
	mtg_basic_env:stone_iron_ore
	mtg_basic_env:stone_tin_ore
	mtg_basic_env:stone_copper_ore
	mtg_basic_env:stone_silver_ore
	mtg_basic_env:stone_gold_ore        
	mtg_basic_env:stone_mese_ore
	mtg_basic_env:stone_diamond_ore
  
----------------------
-- Soft / Non-Stone --
----------------------
	mtg_basic_env:dirt
	mtg_basic_env:dirt_dry	
	mtg_basic_env:dirt_snow
	mtg_basic_env:dirt_grass
	mtg_basic_env:dirt_grass_dry
	mtg_basic_env:dirt_dry_grass_dry
	mtg_basic_env:dirt_grass_footstep        -- unused, included as example

	mtg_basic_env:gravel
	mtg_basic_env:clay

	mtg_basic_env:permafrost
	mtg_basic_env:permafrost_stones
	mtg_basic_env:permafrost_mossy 

	mtg_basic_env:sand
	mtg_basic_env:sand_desert
	mtg_basic_env:sand_silver

	mtg_basic_env:snow
	mtg_basic_env:snow_block
	mtg_basic_env:ice
	mtg_basic_env:ice_cave  

-------------
-- Liquids --
-------------
	mtg_basic_env:water_source
	mtg_basic_env:water_flowing

	mtg_basic_env:water_fresh_source
	mtg_basic_env:water_fresh_flowing

	mtg_basic_env:lava_source
	mtg_basic_env:lava_flowing

---------
-- Air --
---------
	mtg_basic_env:air_cloud

--]]

--------------------
-- Register Nodes --
--------------------
--------------------------
-- Resolve node aliases --
--------------------------
-- set variable/table name for alias checking,to help make node/item 
-- name changes more future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local cobble          = minetest.registered_aliases["mtg_basic_env:cobble"]              or "mtg_basic_env:cobble"
local desert_cobble   = minetest.registered_aliases["mtg_basic_env:desert_cobble"]       or "mtg_basic_env:desert_cobble"
local dirt            = minetest.registered_aliases["mtg_basic_env:dirt"]                or "mtg_basic_env:dirt"
local dirt_snow       = minetest.registered_aliases["mtg_basic_env:dirt_snow"]           or "mtg_basic_env:dirt_snow"
local dirt_grass      = minetest.registered_aliases["mtg_basic_env:dirt_grass"]          or "mtg_basic_env:dirt_grass"
local gravel          = minetest.registered_aliases["mtg_basic_env:gravel"]              or "mtg_basic_env:gravel"
local coal_lump       = minetest.registered_aliases["mtg_basic_env:coal_lump"]           or "mtg_basic_env:coal_lump"
local iron_lump       = minetest.registered_aliases["mtg_basic_env:iron_lump"]           or "mtg_basic_env:iron_lump"
local tin_lump        = minetest.registered_aliases["mtg_basic_env:tin_lump"]            or "mtg_basic_env:tin_lump"
local copper_lump     = minetest.registered_aliases["mtg_basic_env:copper_lump"]         or "mtg_basic_env:copper_lump"
local silver_lump     = minetest.registered_aliases["mtg_basic_env:silver_lump"]         or "mtg_basic_env:silver_lump"
local gold_lump       = minetest.registered_aliases["mtg_basic_env:gold_lump"]           or "mtg_basic_env:gold_lump"
local mese_crystal    = minetest.registered_aliases["mtg_basic_env:mese_crystal"]        or "mtg_basic_env:mese_crystal"
local diamond_crystal = minetest.registered_aliases["mtg_basic_env:diamond_crystal"]     or "mtg_basic_env:diamond_crystal"
local clay_lump       = minetest.registered_aliases["mtg_basic_env:clay_lump"]           or "mtg_basic_env:clay_lump"
local flint           = minetest.registered_aliases["mtg_basic_env:flint"]               or "mtg_basic_env:flint"
local ice             = minetest.registered_aliases["mtg_basic_env:ice"]                 or "mtg_basic_env:ice"
local water_source    = minetest.registered_aliases["mtg_basic_env:water_source"]        or "mtg_basic_env:water_source"
local water_flow      = minetest.registered_aliases["mtg_basic_env:water_flowing"]       or "mtg_basic_env:water_flowing"
local water_f_source  = minetest.registered_aliases["mtg_basic_env:water_fresh_source"]  or "mtg_basic_env:water_fresh_source"
local water_f_flow    = minetest.registered_aliases["mtg_basic_env:water_fresh_flowing"] or "mtg_basic_env:water_fresh_flowing"
local lava_source     = minetest.registered_aliases["mtg_basic_env:lava_source"]         or "mtg_basic_env:lava_source"
local lava_flow       = minetest.registered_aliases["mtg_basic_env:lava_flowing"]        or "mtg_basic_env:lava_flowing"


-----------
-- Stone --
-----------
minetest.register_node("mtg_basic_env:stone", {
	description = S("Stone"),
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = cobble,
	legacy_mineral = true,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:cobble", {
	description = S("Cobblestone"),
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:cobble_mossy", {
	description = S("Mossy Cobblestone"),
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:obsidian", {
	description = S("Obsidian"),
	tiles = {"default_obsidian.png"},
	sounds = mtg_basic_sounds.node_sound_stone(),
	groups = {cracky = 1, level = 2},
})

minetest.register_node("mtg_basic_env:stone_desert", {
	description = S("Desert Stone"),
	tiles = {"default_desert_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = desert_cobble,
	legacy_mineral = true,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:cobble_desert", {
	description = S("Desert Cobblestone"),
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:sandstone", {
	description = S("Sandstone"),
	tiles = {"default_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:sandstone_desert", {
	description = S("Desert Sandstone"),
	tiles = {"default_desert_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:sandstone_silver", {
	description = S("Silver Sandstone"),
	tiles = {"default_silver_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = mtg_basic_sounds.node_sound_stone(),
})

----------
-- Ores --
----------
minetest.register_node("mtg_basic_env:stone_coal_ore", {
	description = S("Coal Ore"),
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = coal_lump,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:stone_iron_ore", {
	description = S("Iron Ore"),
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = iron_lump,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:stone_tin_ore", {
	description = S("Tin Ore"),
	tiles = {"default_stone.png^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = tin_lump,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:stone_copper_ore", {
	description = S("Copper Ore"),
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = copper_lump,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:stone_silver_ore", {
	description = S("Silver Ore"),
	tiles = {"default_stone.png^default_mineral_silver.png"},
	groups = {cracky = 2},
	drop = silver_lump,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:stone_gold_ore", {
	description = S("Gold Ore"),
	tiles = {"default_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = gold_lump,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:stone_mese_ore", {
	description = S("Mese Ore"),
	tiles = {"default_stone.png^default_mineral_mese.png"},
	groups = {cracky = 1},
	drop = mese_crystal,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_basic_env:stone_diamond_ore", {
	description = S("Diamond Ore"),
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = diamond_crystal,
	sounds = mtg_basic_sounds.node_sound_stone(),
})

----------------------
-- Soft / Non-Stone --
----------------------
minetest.register_node("mtg_basic_env:dirt", {
	description = S("Dirt"),
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = mtg_basic_sounds.node_sound_dirt(),
})

minetest.register_node("mtg_basic_env:dirt_dry", {
	description = S("Savanna Dirt"),
	tiles = {"default_dry_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = mtg_basic_sounds.node_sound_dirt(),
})

minetest.register_node("mtg_basic_env:dirt_snow", {
	description = S("Dirt with Snow"),
	tiles = {"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1, snowy = 1},
	drop = dirt,
	sounds = mtg_basic_sounds.node_sound_snow(),
})

minetest.register_node("mtg_basic_env:dirt_grass", {
	description = S("Dirt with Grass"),
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = dirt,
	sounds = mtg_basic_sounds.node_sound_grass(),
})

minetest.register_node("mtg_basic_env:dirt_grass_dry", {
	description = S("Dirt with Savanna Grass"),
	tiles = {"default_dry_grass.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = dirt,
	sounds = mtg_basic_sounds.node_sound_grass_dry(),
})

minetest.register_node("mtg_basic_env:dirt_dry_grass_dry", {
	description = S("Savanna Dirt with Savanna Grass"),
	tiles = {"default_dry_grass.png", "default_dry_dirt.png",
		{name = "default_dry_dirt.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = dirt,
	sounds = mtg_basic_sounds.node_sound_grass_dry(),
})

minetest.register_node("mtg_basic_env:dirt_grass_footstep", {
	description = S("Dirt with Grass and Footsteps"),
	tiles = {"default_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	drop = dirt,
	sounds = mtg_basic_sounds.node_sound_grass(),
})

minetest.register_node("mtg_basic_env:gravel", {
	description = S("Gravel"),
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = mtg_basic_sounds.node_sound_gravel(),
	drop = {
		max_items = 1,
		items = {
			{items = {flint}, rarity = 16},
			{items = {gravel}}
		}
	}
})

minetest.register_node("mtg_basic_env:clay", {
	description = S("Clay"),
	tiles = {"default_clay.png"},
	groups = {crumbly = 3},
	drop = clay_lump.." 4",
	sounds = mtg_basic_sounds.node_sound_dirt(),
})

minetest.register_node("mtg_basic_env:permafrost", {
	description = S("Permafrost"),
	tiles = {"default_permafrost.png"},
	groups = {cracky = 3},
	sounds = mtg_basic_sounds.node_sound_dirt(),
})

minetest.register_node("mtg_basic_env:permafrost_stones", {
	description = S("Permafrost with Stones"),
	tiles = {"default_permafrost.png^default_stones.png",
		"default_permafrost.png",
		"default_permafrost.png^default_stones_side.png"},
	groups = {cracky = 3},
	sounds = mtg_basic_sounds.node_sound_gravel(),
})

minetest.register_node("mtg_basic_env:permafrost_mossy", {
	description = S("Permafrost with Moss"),
	tiles = {"default_moss.png", "default_permafrost.png",
		{name = "default_permafrost.png^default_moss_side.png",
			tileable_vertical = false}},
	groups = {cracky = 3},
	sounds = mtg_basic_sounds.node_sound_grass(),
})

minetest.register_node("mtg_basic_env:sand", {
	description = S("Sand"),
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = mtg_basic_sounds.node_sound_sand(),
})

minetest.register_node("mtg_basic_env:sand_desert", {
	description = S("Desert Sand"),
	tiles = {"default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = mtg_basic_sounds.node_sound_sand(),
})

minetest.register_node("mtg_basic_env:sand_silver", {
	description = S("Silver Sand"),
	tiles = {"default_silver_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = mtg_basic_sounds.node_sound_sand(),
})

minetest.register_node("mtg_basic_env:snow", {
	description = S("Snow"),
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -6 / 16, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, snowy = 1},
	sounds = mtg_basic_sounds.node_sound_snow(),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == dirt_grass then
			minetest.set_node(pos, {name = dirt_snow})
		end
	end,
})

minetest.register_node("mtg_basic_env:snow_block", {
	description = S("Snow Block"),
	tiles = {"default_snow.png"},
	groups = {crumbly = 3, cools_lava = 1, snowy = 1},
	sounds = mtg_basic_sounds.node_sound_snow(),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == dirt_grass then
			minetest.set_node(pos, {name = dirt_snow})
		end
	end,
})

-- 'is ground content = false' to avoid tunnels in sea ice or ice rivers
minetest.register_node("mtg_basic_env:ice", {
	description = S("Ice"),
	tiles = {"default_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	sounds = mtg_basic_sounds.node_sound_ice(),
})

-- Mapgen-placed ice with 'is ground content = true' to contain tunnels
minetest.register_node("mtg_basic_env:cave_ice", {
	description = S("Cave Ice"),
	tiles = {"default_ice.png"},
	paramtype = "light",
	groups = {cracky = 3, cools_lava = 1, slippery = 3,
		not_in_creative_inventory = 1},
	drop = ice,
	sounds = mtg_basic_sounds.node_sound_ice(),
})

-------------
-- Liquids --
-------------
minetest.register_node("mtg_basic_env:water_source", {
	description = S("Water Source"),
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "default_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "default_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = water_flow,
	liquid_alternative_source = water_source,
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = mtg_basic_sounds.node_sound_water(),
})

minetest.register_node("mtg_basic_env:water_flowing", {
	description = S("Flowing Water"),
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "default_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = water_flow,
	liquid_alternative_source = water_source,
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = mtg_basic_sounds.node_sound_water(),
})


minetest.register_node("mtg_basic_env:water_fresh_source", {
	description = S("River Water Source"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_river_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "default_river_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = water_f_flow,
	liquid_alternative_source = water_f_source,
	liquid_viscosity = 1,
	-- Not renewable to avoid horizontal spread of water sources in sloping
	-- rivers that can cause water to overflow riverbanks and cause floods.
	-- River water source is instead made renewable by the 'force renew'
	-- option used in the 'bucket' mod by the river water bucket.
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = mtg_basic_sounds.node_sound_water(),
})

minetest.register_node("mtg_basic_env:water_fresh_flowing", {
	description = S("Flowing River Water"),
	drawtype = "flowingliquid",
	tiles = {"default_river_water.png"},
	special_tiles = {
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = water_f_flow,
	liquid_alternative_source = water_f_source,
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = mtg_basic_sounds.node_sound_water(),
})


minetest.register_node("mtg_basic_env:lava_source", {
	description = S("Lava Source"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
		{
			name = "default_lava_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = mtg_global.LIGHT_MAX   - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = lava_flow,
	liquid_alternative_source = lava_source,
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("mtg_basic_env:lava_flowing", {
	description = S("Flowing Lava"),
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = mtg_global.LIGHT_MAX  - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = lava_flow,
	liquid_alternative_source = lava_source,
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

---------
-- Air --
---------
minetest.register_node("mtg_basic_env:air_cloud", {
	description = S("Cloud"),
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	sounds = mtg_basic_sounds.node_dug_place_sound(),
	groups = {not_in_creative_inventory = 1},
})