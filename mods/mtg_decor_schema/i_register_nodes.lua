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
--                     Nodes                      --
----------------------------------------------------

-- support for translation.
local S = mtg_decor_schema.translator

--[[Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

Node reg names can be adjusted to whatever you like just ensure to update "i_aliases_nodes.lua" 
for both default aliases and mtg_decor_schema aliases, I have left a commented out section
inside aliases so this can easily be done, this means it should be easier to have game 
specific registered node names but retain compatability with mods. 

-----------
-- Index --
-----------
----------------------
-- Soft / Non-Stone --
----------------------
mtg_decor_schema:dirt_coniferous_litter
mtg_decor_schema:dirt_rainforest_litter	

---------------
-- Plantlife --
---------------
mtg_decor_schema:cactus
mtg_decor_schema:cactus_sapling_large

mtg_decor_schema:papyrus

mtg_decor_schema:bush_stem
mtg_decor_schema:bush_leaves
mtg_decor_schema:bush_sapling

mtg_decor_schema:blueberry_bush_leaves_berries
mtg_decor_schema:blueberry_bush_leaves 
mtg_decor_schema:blueberry_bush_sapling 

mtg_decor_schema:acacia_bush_stem 
mtg_decor_schema:acacia_bush_leaves
mtg_decor_schema:acacia_bush_sapling

mtg_decor_schema:pine_bush_stem 
mtg_decor_schema:pine_bush_leaves
mtg_decor_schema:pine_bush_sapling

-------------
--  Trees  --
-------------
-- Note wood is not dropped but is fabricated from trunks,
-- kept inside this mod for ease of maintenance.

mtg_decor_schema:apple_tree_trunk
mtg_decor_schema:apple_tree_wood        >> Fabricated
mtg_decor_schema:apple_tree_leaves
mtg_decor_schema:apple_tree_sapling
mtg_decor_schema:apple_tree_apple

mtg_decor_schema:jungle_tree_trunk
mtg_decor_schema:jungle_tree_wood       >> Fabricated
mtg_decor_schema:jungle_tree_leaves
mtg_decor_schema:jungle_tree_sapling
mtg_decor_schema:jungle_tree_sapling_emergant

mtg_decor_schema:pine_tree_trunk
mtg_decor_schema:pine_tree_wood         >> Fabricated
mtg_decor_schema:pine_tree_leaves
mtg_decor_schema:pine_tree_sapling

mtg_decor_schema:acacia_tree_trunk
mtg_decor_schema:acacia_tree_wood       >> Fabricated
mtg_decor_schema:acacia_tree_leaves
mtg_decor_schema:acacia_tree_sapling

mtg_decor_schema:aspen_tree_trunk
mtg_decor_schema:aspen_tree_wood        >> Fabricated
mtg_decor_schema:aspen_tree_leaves
mtg_decor_schema:aspen_tree_sapling
--]]
--------------------
-- Register Nodes --
--------------------
-- Aliases
-- set variable/table name for alias checking, were node reg refs node/item external to this mod,
-- to help make name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local dirt =  minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"

-- Wrappers
-- Required wrapper to allow customization of mtg_decor_schema.after_place_leaves
local function after_place_leaves(...)
	return mtg_decor_schema.after_place_leaves(...)
end

-- Required wrapper to allow customization of mtg_decor_schema.grow_sapling
local function grow_sapling(...)
	return mtg_decor_schema.grow_sapling(...)
end


----------------------
-- Soft / Non-Stone --
----------------------
minetest.register_node("mtg_decor_schema:dirt_rainforest_litter", {
	description = S("Dirt with Rainforest Litter"),
	tiles = {
		"default_rainforest_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = dirt,
	sounds = mtg_basic_sounds.node_sound_dirt({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("mtg_decor_schema:dirt_coniferous_litter", {
	description = S("Dirt with Coniferous Litter"),
	tiles = {
		"default_coniferous_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_coniferous_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = dirt,
	sounds = mtg_basic_sounds.node_sound_dirt({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

-----------
-- Trees --
-----------
-- Apple Tree
minetest.register_node("mtg_decor_schema:apple_tree_trunk", {
	description = S("Apple Tree"),
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood(),

	on_place = minetest.rotate_node
})

minetest.register_node("mtg_decor_schema:apple_tree_wood", {
	description = S("Apple Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = mtg_basic_sounds.node_sound_wood(),
})

minetest.register_node("mtg_decor_schema:apple_tree_sapling", {
	description = S("Apple Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:apple_tree_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 6, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("mtg_decor_schema:apple_tree_leaves", {
	description = S("Apple Tree Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"mtg_decor_schema:apple_tree_sapling"},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"mtg_decor_schema:apple_tree_leaves"},
			}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:apple_tree_apple", {
	description = S("Apple"),
	drawtype = "plantlike",
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
	on_use = minetest.item_eat(2),
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "mtg_decor_schema:apple_tree_apple", param2 = 1})
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if oldnode.param2 == 0 then
			minetest.set_node(pos, {name = "mtg_decor_schema:apple_tree_apple_mark"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
})

minetest.register_node("mtg_decor_schema:apple_tree_apple_mark", {
	description = S("Apple Marker"),
	inventory_image = "default_apple.png^default_invisible_node_overlay.png",
	wield_image = "default_apple.png^default_invisible_node_overlay.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_timer = function(pos, elapsed)
		if not minetest.find_node_near(pos, 1, "mtg_decor_schema:apple_tree_leaves") then
			minetest.remove_node(pos)
		elseif minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "mtg_decor_schema:apple_tree_apple"})
		end
	end
})

-- Jungle Tree
minetest.register_node("mtg_decor_schema:jungle_tree_trunk", {
	description = S("Jungle Tree"),
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png",
		"default_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood(),

	on_place = minetest.rotate_node
})

minetest.register_node("mtg_decor_schema:jungle_tree_wood", {
	description = S("Jungle Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_junglewood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = mtg_basic_sounds.node_sound_wood(),
})

minetest.register_node("mtg_decor_schema:jungle_tree_leaves", {
	description = S("Jungle Tree Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_jungleleaves.png"},
	special_tiles = {"default_jungleleaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:jungle_tree_sapling"}, rarity = 20},
			{items = {"mtg_decor_schema:jungle_tree_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:jungle_tree_sapling", {
	description = S("Jungle Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_junglesapling.png"},
	inventory_image = "default_junglesapling.png",
	wield_image = "default_junglesapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:jungle_tree_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node("mtg_decor_schema:jungle_tree_sapling_emergant", {
	description = S("Emergent Jungle Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_emergent_jungle_sapling.png"},
	inventory_image = "default_emergent_jungle_sapling.png",
	wield_image = "default_emergent_jungle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:jungle_tree_sapling_emergant",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -3, y = -5, z = -3},
			{x = 3, y = 31, z = 3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

-- Pine Tree
minetest.register_node("mtg_decor_schema:pine_tree_trunk", {
	description = S("Pine Tree"),
	tiles = {"default_pine_tree_top.png", "default_pine_tree_top.png",
		"default_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = mtg_basic_sounds.node_sound_wood(),

	on_place = minetest.rotate_node
})

minetest.register_node("mtg_decor_schema:pine_tree_wood", {
	description = S("Pine Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_pine_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = mtg_basic_sounds.node_sound_wood(),
})

minetest.register_node("mtg_decor_schema:pine_tree_leaves",{
	description = S("Pine Needles"),
	drawtype = "allfaces_optional",
	tiles = {"default_pine_needles.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:pine_tree_sapling"}, rarity = 20},
			{items = {"mtg_decor_schema:pine_tree_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:pine_tree_sapling", {
	description = S("Pine Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:pine_tree_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 14, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

-- Acacia Tree
minetest.register_node("mtg_decor_schema:acacia_tree_trunk", {
	description = S("Acacia Tree"),
	tiles = {"default_acacia_tree_top.png", "default_acacia_tree_top.png",
		"default_acacia_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood(),

	on_place = minetest.rotate_node
})

minetest.register_node("mtg_decor_schema:acacia_tree_wood", {
	description = S("Acacia Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_acacia_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = mtg_basic_sounds.node_sound_wood(),
})

minetest.register_node("mtg_decor_schema:acacia_tree_leaves", {
	description = S("Acacia Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_acacia_leaves.png"},
	special_tiles = {"default_acacia_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:acacia_tree_sapling"}, rarity = 20},
			{items = {"mtg_decor_schema:acacia_tree_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:acacia_tree_sapling", {
	description = S("Acacia Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:acacia_tree_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

--Aspen Tree
minetest.register_node("mtg_decor_schema:aspen_tree_trunk", {
	description = S("Aspen Tree"),
	tiles = {"default_aspen_tree_top.png", "default_aspen_tree_top.png",
		"default_aspen_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = mtg_basic_sounds.node_sound_wood(),

	on_place = minetest.rotate_node
})

minetest.register_node("mtg_decor_schema:aspen_tree_wood", {
	description = S("Aspen Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_aspen_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = mtg_basic_sounds.node_sound_wood(),
})

minetest.register_node("mtg_decor_schema:aspen_tree_leaves", {
	description = S("Aspen Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_aspen_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:aspen_tree_sapling"}, rarity = 20},
			{items = {"mtg_decor_schema:aspen_tree_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:aspen_tree_sapling", {
	description = S("Aspen Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"default_aspen_sapling.png"},
	inventory_image = "default_aspen_sapling.png",
	wield_image = "default_aspen_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:aspen_tree_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

---------------
-- Plantlife --
---------------
-- Cactus
minetest.register_node("mtg_decor_schema:cactus", {
	description = S("Cactus"),
	tiles = {"default_cactus_top.png", "default_cactus_top.png",
		"default_cactus_side.png"},
	paramtype2 = "facedir",
	groups = {choppy = 3},
	sounds = mtg_basic_sounds.node_sound_wood(),
	on_place = minetest.rotate_node,
})

minetest.register_node("mtg_decor_schema:cactus_sapling_large", {
	description = S("Large Cactus Seedling"),
	drawtype = "plantlike",
	tiles = {"default_large_cactus_seedling.png"},
	inventory_image = "default_large_cactus_seedling.png",
	wield_image = "default_large_cactus_seedling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {
			-5 / 16, -0.5, -5 / 16,
			5 / 16, 0.5, 5 / 16
		}
	},
	groups = {choppy = 3, dig_immediate = 3, attached_node = 1},
	sounds = mtg_basic_sounds.node_sound_wood(),

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:cactus_sapling_large",
			{x = -2, y = -1, z = -2},
			{x = 2, y = 5, z = 2},
			4)

		return itemstack
	end,

	on_construct = function(pos)
		-- Normal cactus farming adds 1 cactus node by ABM,
		-- interval 12s, chance 83.
		-- Consider starting with 5 cactus nodes. We make sure that growing a
		-- large cactus is not a faster way to produce new cactus nodes.
		-- Confirmed by experiment, when farming 5 cacti, on average 1 new
		-- cactus node is added on average every
		-- 83 / 5 = 16.6 intervals = 16.6 * 12 = 199.2s.
		-- Large cactus contains on average 14 cactus nodes.
		-- 14 * 199.2 = 2788.8s.
		-- Set random range to average to 2789s.
		minetest.get_node_timer(pos):start(math.random(1859, 3719))
	end,

	on_timer = function(pos)
		local node_under = minetest.get_node_or_nil(
			{x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			minetest.get_node_timer(pos):start(300)
			return
		end

		if minetest.get_item_group(node_under.name, "sand") == 0 then
			-- Seedling dies
			minetest.remove_node(pos)
			return
		end

		local light_level = minetest.get_node_light(pos)
		if not light_level or light_level < 13 then
			-- Too dark for growth, try later in case it's night
			minetest.get_node_timer(pos):start(300)
			return
		end

		minetest.log("action", "A large cactus seedling grows into a large" ..
			"cactus at ".. minetest.pos_to_string(pos))
		mtg_decor_schema.grow_large_cactus(pos)
	end,
})

--Papyrus
minetest.register_node("mtg_decor_schema:papyrus", {
	description = S("Papyrus"),
	drawtype = "plantlike",
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_dig_node = function(pos, node, metadata, digger)
		mtg_decor_schema.dig_up(pos, node, digger)
	end,
})

-- Bush
minetest.register_node("mtg_decor_schema:bush_stem", {
	description = S("Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_bush_stem.png"},
	inventory_image = "default_bush_stem.png",
	wield_image = "default_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("mtg_decor_schema:bush_leaves", {
	description = S("Bush Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:bush_sapling"}, rarity = 5},
			{items = {"mtg_decor_schema:bush_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:bush_sapling", {
	description = S("Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_bush_sapling.png"},
	inventory_image = "default_bush_sapling.png",
	wield_image = "default_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

-- Blueberry Bush
minetest.register_node("mtg_decor_schema:blueberry_bush_leaves_berries", {
	description = S("Blueberry Bush Leaves with Berries"),
	drawtype = "allfaces_optional",
	tiles = {"default_blueberry_bush_leaves.png^default_blueberry_overlay.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
	drop = "mtg_decor_schema:blueberries",
	sounds = mtg_basic_sounds.node_sound_leaves(),
	node_dig_prediction = "mtg_decor_schema:blueberry_bush_leaves",

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name = "mtg_decor_schema:blueberry_bush_leaves"})
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,
})

minetest.register_node("mtg_decor_schema:blueberry_bush_leaves", {
	description = S("Blueberry Bush Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_blueberry_bush_leaves.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:blueberry_bush_sapling"}, rarity = 5},
			{items = {"mtg_decor_schema:blueberry_bush_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_timer = function(pos, elapsed)
		if minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "mtg_decor_schema:blueberry_bush_leaves_with_berries"})
		end
	end,

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:blueberry_bush_sapling", {
	description = S("Blueberry Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_blueberry_bush_sapling.png"},
	inventory_image = "default_blueberry_bush_sapling.png",
	wield_image = "default_blueberry_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:blueberry_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

-- Acacia Bush
minetest.register_node("mtg_decor_schema:acacia_bush_stem", {
	description = S("Acacia Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_acacia_bush_stem.png"},
	inventory_image = "default_acacia_bush_stem.png",
	wield_image = "default_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("mtg_decor_schema:acacia_bush_leaves", {
	description = S("Acacia Bush Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_acacia_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:acacia_bush_sapling"}, rarity = 5},
			{items = {"mtg_decor_schema:acacia_bush_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:acacia_bush_sapling", {
	description = S("Acacia Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_acacia_bush_sapling.png"},
	inventory_image = "default_acacia_bush_sapling.png",
	wield_image = "default_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 2 / 16, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

-- Pine Bush
minetest.register_node("mtg_decor_schema:pine_bush_stem", {
	description = S("Pine Bush Stem"),
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_pine_bush_stem.png"},
	inventory_image = "default_pine_bush_stem.png",
	wield_image = "default_pine_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("mtg_decor_schema:pine_bush_leaves", {
	description = S("Pine Bush Needles"),
	drawtype = "allfaces_optional",
	tiles = {"default_pine_needles.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"mtg_decor_schema:pine_bush_sapling"}, rarity = 5},
			{items = {"mtg_decor_schema:pine_bush_leaves"}}
		}
	},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	after_place_node = after_place_leaves,
})

minetest.register_node("mtg_decor_schema:pine_bush_sapling", {
	description = S("Pine Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"default_pine_bush_sapling.png"},
	inventory_image = "default_pine_bush_sapling.png",
	wield_image = "default_pine_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = mtg_decor_schema.sapling_on_place(itemstack, placer, pointed_thing,
			"mtg_decor_schema:pine_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})