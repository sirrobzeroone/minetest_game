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
--                     Nodes                      --
----------------------------------------------------

-- support for translation.
local S = mtg_env_decor_fab.translator

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
----------
-- Misc --
----------
mtg_env_decor_fab:bookshelf

mtg_env_decor_fab:sign_wall_wood
mtg_env_decor_fab:sign_wall_steel

mtg_env_decor_fab:ladder_wood
mtg_env_decor_fab:ladder_steel

------------
-- Fences --
------------
mtg_env_decor_fab:fence_apple_tree_wood
mtg_env_decor_fab:fence_acacia_tree_wood
mtg_env_decor_fab:fence_jungle_tree_wood
mtg_env_decor_fab:fence_pine_tree_wood
mtg_env_decor_fab:fence_aspen_tree_wood

mtg_env_decor_fab:fence_rail_apple_tree_wood
mtg_env_decor_fab:fence_rail_acacia_tree_wood
mtg_env_decor_fab:fence_rail_jungle_tree_wood
mtg_env_decor_fab:fence_rail_pine_tree_wood
mtg_env_decor_fab:fence_rail_aspen_tree_wood

--------------
--   Lamps  --
--------------
mtg_env_decor_fab:mese_lamp
mtg_env_decor_fab:mese_post_light
--]]
--------------------
-- Register Nodes --
--------------------
-- Aliases
-- set variable/table name for alias checking, were node reg refs node/item external to this mod,
-- to help make name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local apple_wood =  minetest.registered_aliases["mtg_decor_schema:apple_tree_wood"] or "mtg_decor_schema:apple_tree_wood"
local acacia_wood = minetest.registered_aliases["mtg_decor_schema:acacia_tree_wood"] or "mtg_decor_schema:acacia_tree_wood"
local aspen_wood = minetest.registered_aliases["mtg_decor_schema:aspen_tree_wood"] or "mtg_decor_schema:aspen_tree_wood"
local jungle_wood = minetest.registered_aliases["mtg_decor_schema:jungle_tree_wood"] or "mtg_decor_schema:jungle_tree_wood"
local pine_wood = minetest.registered_aliases["mtg_decor_schema:pine_tree_wood"] or "mtg_decor_schema:pine_tree_wood"

----------
-- Misc --
----------
-- Bookshelf

minetest.register_node("mtg_env_decor_fab:bookshelf", {
	description = S("Bookshelf"),
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png",
		"default_wood.png", "default_bookshelf.png", "default_bookshelf.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = mtg_basic_sounds.node_sound_wood(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 2)
		mtg_env_decor_fab.update_bookshelf(pos)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("books")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if minetest.get_item_group(stack:get_name(), "book") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
		mtg_env_decor_fab.update_bookshelf(pos)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" puts stuff to bookshelf at " .. minetest.pos_to_string(pos))
		mtg_env_decor_fab.update_bookshelf(pos)
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
		mtg_env_decor_fab.update_bookshelf(pos)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "books", drops)
		drops[#drops+1] = "mtg_env_decor_fab:bookshelf"
		minetest.remove_node(pos)
		return drops
	end,
})

-- Signs
local function register_sign(material, desc, def)
	minetest.register_node("mtg_env_decor_fab:sign_wall_" .. material, {
		description = desc,
		drawtype = "nodebox",
		tiles = {"default_sign_wall_" .. material .. ".png"},
		inventory_image = "default_sign_" .. material .. ".png",
		wield_image = "default_sign_" .. material .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local text = fields.text
			if not text then
				return
			end
			if string.len(text) > 512 then
				minetest.chat_send_player(player_name, S("Text too long"))
				return
			end
			minetest.log("action", player_name .. " wrote \"" .. text ..
				"\" to the sign at " .. minetest.pos_to_string(pos))
			local meta = minetest.get_meta(pos)
			meta:set_string("text", text)

			if #text > 0 then
				meta:set_string("infotext", S('"@1"', text))
			else
				meta:set_string("infotext", '')
			end
		end,
	})
end

register_sign("wood", S("Wooden Sign"), {
	sounds = mtg_basic_sounds.node_sound_wood(),
	groups = {choppy = 2, attached_node = 1, flammable = 2, oddly_breakable_by_hand = 3}
})

register_sign("steel", S("Steel Sign"), {
	sounds = mtg_basic_sounds.node_sound_metal(),
	groups = {cracky = 2, attached_node = 1}
})


--Ladders

minetest.register_node("mtg_env_decor_fab:ladder_wood", {
	description = S("Wooden Ladder"),
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png"},
	inventory_image = "default_ladder_wood.png",
	wield_image = "default_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = mtg_basic_sounds.node_sound_wood(),
})

minetest.register_node("mtg_env_decor_fab:ladder_steel", {
	description = S("Steel Ladder"),
	drawtype = "signlike",
	tiles = {"default_ladder_steel.png"},
	inventory_image = "default_ladder_steel.png",
	wield_image = "default_ladder_steel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky = 2},
	sounds = mtg_basic_sounds.node_sound_metal(),
})

------------
-- Fences --
------------
mtg_env_decor_fab.register_fence("mtg_env_decor_fab:fence_apple_tree_wood", {
	description = S("Apple Wood Fence"),
	texture = "default_fence_wood.png",
	inventory_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = apple_wood,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence("mtg_env_decor_fab:fence_acacia_tree_wood", {
	description = S("Acacia Wood Fence"),
	texture = "default_fence_acacia_wood.png",
	inventory_image = "default_fence_overlay.png^default_acacia_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_acacia_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = acacia_wood,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence("mtg_env_decor_fab:fence_jungle_tree_wood", {
	description = S("Jungle Wood Fence"),
	texture = "default_fence_junglewood.png",
	inventory_image = "default_fence_overlay.png^default_junglewood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_junglewood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = jungle_wood,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence("mtg_env_decor_fab:fence_pine_tree_wood", {
	description = S("Pine Wood Fence"),
	texture = "default_fence_pine_wood.png",
	inventory_image = "default_fence_overlay.png^default_pine_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_pine_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = pine_wood,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence("mtg_env_decor_fab:fence_aspen_tree_wood", {
	description = S("Aspen Wood Fence"),
	texture = "default_fence_aspen_wood.png",
	inventory_image = "default_fence_overlay.png^default_aspen_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^default_aspen_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = aspen_wood,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence_rail("mtg_env_decor_fab:fence_rail_apple_tree_wood", {
	description = S("Apple Wood Fence Rail"),
	texture = "default_fence_rail_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = apple_wood,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence_rail("mtg_env_decor_fab:fence_rail_acacia_tree_wood", {
	description = S("Acacia Wood Fence Rail"),
	texture = "default_fence_rail_acacia_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_acacia_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_acacia_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = acacia_wood,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence_rail("mtg_env_decor_fab:fence_rail_jungle_tree_wood", {
	description = S("Jungle Wood Fence Rail"),
	texture = "default_fence_rail_junglewood.png",
	inventory_image = "default_fence_rail_overlay.png^default_junglewood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_junglewood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = jungle_wood,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence_rail("mtg_env_decor_fab:fence_rail_pine_tree_wood", {
	description = S("Pine Wood Fence Rail"),
	texture = "default_fence_rail_pine_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_pine_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_pine_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = pine_wood,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = mtg_basic_sounds.node_sound_wood()
})

mtg_env_decor_fab.register_fence_rail("mtg_env_decor_fab:fence_rail_aspen_tree_wood", {
	description = S("Aspen Wood Fence Rail"),
	texture = "default_fence_rail_aspen_wood.png",
	inventory_image = "default_fence_rail_overlay.png^default_aspen_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^default_aspen_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = aspen_wood,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood()
})

--------------
--   Lamps  --
--------------
minetest.register_node("mtg_env_decor_fab:mese_lamp", {
	description = S("Mese Lamp"),
	drawtype = "glasslike",
	tiles = {"default_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = mtg_basic_sounds.node_sound_glass(),
	light_source = mtg_global.LIGHT_MAX,
})

minetest.register_node("mtg_env_decor_fab:mese_post_light", {
	description = S("Mese Post Light"),
	tiles = {"default_mese_post_light_top.png", "default_mese_post_light_top.png",
		"default_mese_post_light_side_dark.png", "default_mese_post_light_side_dark.png",
		"default_mese_post_light_side.png", "default_mese_post_light_side.png"},
	wield_image = "default_mese_post_light_side.png",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
		},
	},
	paramtype = "light",
	light_source = mtg_global.LIGHT_MAX ,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = mtg_basic_sounds.node_sound_wood(),
})