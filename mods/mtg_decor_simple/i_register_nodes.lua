---------------------------------------------------------------------------
--  ___ _            _       ___                      _   _              --
-- / __(_)_ __  _ __| |___  |   \ ___ __ ___ _ _ __ _| |_(_)___ _ _  ___ --
-- \__ \ | '  \| '_ \ / -_) | |) / -_) _/ _ \ '_/ _` |  _| / _ \ ' \(_-< --
-- |___/_|_|_|_| .__/_\___| |___/\___\__\___/_| \__,_|\__|_\___/_||_/__/ --
--             |_|                                                       --
---------------------------------------------------------------------------
--                           MTG Decorations Simple                      --
---------------------------------------------------------------------------
--                                Nodes                                  --
---------------------------------------------------------------------------

-- support for translation.
local S = mtg_decor_simple.translator

--[[Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

Node reg names can be adjusted to whatever you like just ensure to update "i_aliases_nodes.lua" 
for both default aliases and mtg_decor_simple aliases, I have left a commented out section
inside aliases so this can easily be done, this means it should be easier to have game 
specific registered node names but retain compatability with mods. 

-------------
-- Grasses --
-------------
mtg_decor_simple:shrub_dry
mtg_decor_simple:grass_jungle

mtg_decor_simple:grass_1
mtg_decor_simple:grass_2
mtg_decor_simple:grass_3
mtg_decor_simple:grass_4
mtg_decor_simple:grass_5

mtg_decor_simple:grass_dry_1
mtg_decor_simple:grass_dry_2
mtg_decor_simple:grass_dry_3
mtg_decor_simple:grass_dry_4
mtg_decor_simple:grass_dry_5

mtg_decor_simple:fern_1
mtg_decor_simple:fern_2
mtg_decor_simple:fern_3

mtg_decor_simple:grass_marram_1
mtg_decor_simple:grass_marram_2
mtg_decor_simple:grass_marram_3

mtg_decor_simple:sand_kelp

-------------
--  Corals --
-------------
mtg_decor_simple:coral_green
mtg_decor_simple:coral_pink
mtg_decor_simple:coral_cyan
mtg_decor_simple:coral_brown
mtg_decor_simple:coral_orange
mtg_decor_simple:coral_skeleton

--]]

--------------------
-- Register Nodes --
--------------------
-- set variable/table name for alias checking, were node reg refs node/item external to this mod,
-- to help make name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local dirt =  minetest.registered_aliases["lib_basic_env:dirt"] or "lib_basic_env:dirt"
local sand =  minetest.registered_aliases["lib_basic_env:sand"] or "lib_basic_env:sand"


-------------
-- Grasses --
-------------
minetest.register_node("mtg_decor_simple:shrub_dry", {
	description = S("Dry Shrub"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
})

minetest.register_node("mtg_decor_simple:grass_jungle", {
	description = S("Jungle Grass"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.69,
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, junglegrass = 1, flammable = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})


minetest.register_node("mtg_decor_simple:grass_1", {
	description = S("Grass"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("mtg_decor_simple:grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("mtg_decor_simple:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("mtg_decor_simple:grass_" .. i, {
		description = S("Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_grass_" .. i .. ".png"},
		inventory_image = "default_grass_" .. i .. ".png",
		wield_image = "default_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "mtg_decor_simple:grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		sounds = mtg_basic_sounds.node_sound_leaves(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end


minetest.register_node("mtg_decor_simple:grass_dry_1", {
	description = S("Savanna Grass"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_grass_1.png"},
	inventory_image = "default_dry_grass_3.png",
	wield_image = "default_dry_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1, grass = 1, dry_grass = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("mtg_decor_simple:grass_dry_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("mtg_decor_simple:grass_dry_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("mtg_decor_simple:grass_dry_" .. i, {
		description = S("Savanna Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_dry_grass_" .. i .. ".png"},
		inventory_image = "default_dry_grass_" .. i .. ".png",
		wield_image = "default_dry_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1, dry_grass = 1},
		drop = "mtg_decor_simple:grass_dry_1",
		sounds = mtg_basic_sounds.node_sound_leaves(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end

minetest.register_node("mtg_decor_simple:fern_1", {
	description = S("Fern"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_fern_1.png"},
	inventory_image = "default_fern_1.png",
	wield_image = "default_fern_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1, grass = 1,
		fern = 1, attached_node = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random fern node
		local stack = ItemStack("mtg_decor_simple:fern_" .. math.random(1, 3))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("mtg_decor_simple:fern_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	minetest.register_node("mtg_decor_simple:fern_" .. i, {
		description = S("Fern"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 2,
		tiles = {"default_fern_" .. i .. ".png"},
		inventory_image = "default_fern_" .. i .. ".png",
		wield_image = "default_fern_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			grass = 1, fern = 1, not_in_creative_inventory = 1},
		drop = "mtg_decor_simple:fern_1",
		sounds = mtg_basic_sounds.node_sound_leaves(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})
end


minetest.register_node("mtg_decor_simple:grass_marram_1", {
	description = S("Marram Grass"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_marram_grass_1.png"},
	inventory_image = "default_marram_grass_1.png",
	wield_image = "default_marram_grass_1.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1, grass = 1, marram_grass = 1,
		attached_node = 1},
	sounds = mtg_basic_sounds.node_sound_leaves(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random marram grass node
		local stack = ItemStack("mtg_decor_simple:grass_marram_" .. math.random(1, 3))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("mtg_decor_simple:grass_marram_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 3 do
	minetest.register_node("mtg_decor_simple:grass_marram_" .. i, {
		description = S("Marram Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_marram_grass_" .. i .. ".png"},
		inventory_image = "default_marram_grass_" .. i .. ".png",
		wield_image = "default_marram_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			grass = 1, marram_grass = 1, not_in_creative_inventory = 1},
		drop = "mtg_decor_simple:grass_marram_1",
		sounds = mtg_basic_sounds.node_sound_leaves(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})
end

minetest.register_node("mtg_decor_simple:sand_kelp", {
	description = S("Kelp"),
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_kelp.png", tileable_vertical = true}},
	inventory_image = "default_kelp.png",
	wield_image = "default_kelp.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-2/16, 0.5, -2/16, 2/16, 3.5, 2/16},
		},
	},
	node_dig_prediction = sand,
	node_placement_prediction = "",
	sounds = mtg_basic_sounds.node_sound_kelp(),

	on_place = function(itemstack, placer, pointed_thing)
		-- Call on_rightclick if the pointed node defines it
		if pointed_thing.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = minetest.get_node(pointed_thing.under)
			local def_ptu = minetest.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
					itemstack, pointed_thing)
			end
		end

		local pos = pointed_thing.under
		if minetest.get_node(pos).name ~= sand then
			return itemstack
		end

		local height = math.random(4, 6)
		local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
		local node_top = minetest.get_node(pos_top)
		local def_top = minetest.registered_nodes[node_top.name]
		local player_name = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				minetest.get_item_group(node_top.name, "water") > 0 then
			if not minetest.is_protected(pos, player_name) and
					not minetest.is_protected(pos_top, player_name) then
				minetest.set_node(pos, {name = "mtg_decor_simple:sand_kelp",
					param2 = height * 16})
				if not minetest.is_creative_enabled(player_name) then
					itemstack:take_item()
				end
			else
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = sand})
	end
})

-------------
--  Corals --
-------------
minetest.register_node("mtg_decor_simple:coral_green", {
	description = S("Green Coral"),
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {{name = "default_coral_green.png", tileable_vertical = true}},
	inventory_image = "default_coral_green.png",
	wield_image = "default_coral_green.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "mtg_decor_simple:coral_skeleton",
	node_placement_prediction = "",
	sounds = mtg_basic_sounds.node_sound_coral(),

	on_place = mtg_decor_simple.coral_on_place,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "mtg_decor_simple:coral_skeleton"})
	end,
})

minetest.register_node("mtg_decor_simple:coral_pink", {
	description = S("Pink Coral"),
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {{name = "default_coral_pink.png", tileable_vertical = true}},
	inventory_image = "default_coral_pink.png",
	wield_image = "default_coral_pink.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "mtg_decor_simple:coral_skeleton",
	node_placement_prediction = "",
	sounds = mtg_basic_sounds.node_sound_coral(),

	on_place = mtg_decor_simple.coral_on_place,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "mtg_decor_simple:coral_skeleton"})
	end,
})

minetest.register_node("mtg_decor_simple:coral_cyan", {
	description = S("Cyan Coral"),
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_coral_skeleton.png"},
	special_tiles = {{name = "default_coral_cyan.png", tileable_vertical = true}},
	inventory_image = "default_coral_cyan.png",
	wield_image = "default_coral_cyan.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "mtg_decor_simple:coral_skeleton",
	node_placement_prediction = "",
	sounds = mtg_basic_sounds.node_sound_coral(),

	on_place = mtg_decor_simple.coral_on_place,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "mtg_decor_simple:coral_skeleton"})
	end,
})

minetest.register_node("mtg_decor_simple:coral_brown", {
	description = S("Brown Coral"),
	tiles = {"default_coral_brown.png"},
	groups = {cracky = 3},
	drop = "mtg_decor_simple:coral_skeleton",
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_decor_simple:coral_orange", {
	description = S("Orange Coral"),
	tiles = {"default_coral_orange.png"},
	groups = {cracky = 3},
	drop = "mtg_decor_simple:coral_skeleton",
	sounds = mtg_basic_sounds.node_sound_stone(),
})

minetest.register_node("mtg_decor_simple:coral_skeleton", {
	description = S("Coral Skeleton"),
	tiles = {"default_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = mtg_basic_sounds.node_sound_stone(),
})
