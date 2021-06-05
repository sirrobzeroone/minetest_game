-- farming/nodes.lua

-- support for MT game translation.
local S = farming.get_translator

-- check mtg_decor_schema - optional depends
local dec_schema = false

if minetest.get_modpath("mtg_decor_schema") ~= nil then
	dec_schema = true
end

-- check stairs - optional depends
local stairs_mod = false
if minetest.get_modpath("stairs") ~= nil then
	stairs_mod = true
end

-- Check for Aliases for nodes external to module
local dirt = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
local dirt_dry = minetest.registered_aliases["mtg_basic_env:dirt_dry"] or "mtg_basic_env:dirt_dry"
local dirt_grass = minetest.registered_aliases["mtg_basic_env:dirt_grass"] or "mtg_basic_env:dirt_grass"
local dirt_grass_dry = minetest.registered_aliases["mtg_basic_env:dirt_grass_dry"] or "mtg_basic_env:dirt_grass_dry"
local dirt_dry_grass_dry = minetest.registered_aliases["mtg_basic_env:dirt_dry_grass_dry"] or "mtg_basic_env:dirt_dry_grass_dry"
local sand_desert = minetest.registered_aliases["mtg_basic_env:sand_desert"] or "mtg_basic_env:sand_desert"

local grass_y =        minetest.registered_aliases["mtg_decor_simple:grass_1"] or "mtg_decor_simple:grass_1"
local grass_x =        string.sub(tostring(grass_y),1,-2)

local rain_litter
local con_litter
if dec_schema == true then
	rain_litter = minetest.registered_aliases["mtg_decor_schema:dirt_rainforest_litter"] or "mtg_decor_schema:dirt_rainforest_litter"
	con_litter = minetest.registered_aliases["mtg_decor_schema:dirt_coniferous_litter"] or "mtg_decor_schema:dirt_coniferous_litter"
end

-- end aliases check


minetest.override_item(dirt, {
	soil = {
		base = dirt,
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.override_item(dirt_grass, {
	soil = {
		base = dirt_grass,
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.override_item(dirt_grass_dry, {
	soil = {
		base = dirt_grass_dry,
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

if dec_schema == true then
	minetest.override_item(rain_litter, {
		soil = {
			base = rain_litter,
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})

	minetest.override_item(con_litter, {
		soil = {
			base = con_litter,
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})
end

minetest.override_item(dirt_dry, {
	soil = {
		base = dirt_dry,
		dry = "farming:dry_soil",
		wet = "farming:dry_soil_wet"
	}
})

minetest.override_item(dirt_dry_grass_dry, {
	soil = {
		base = dirt_dry_grass_dry,
		dry = "farming:dry_soil",
		wet = "farming:dry_soil_wet"
	}
})

minetest.override_item(sand_desert, {
	groups = {crumbly=3, falling_node=1, sand=1, soil = 1},
	soil = {
		base = sand_desert,
		dry = "farming:desert_sand_soil",
		wet = "farming:desert_sand_soil_wet"
	}
})

minetest.register_node("farming:soil", {
	description = S("Soil"),
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = dirt,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	sounds = mtg_basic_sounds.node_sound_dirt(),
	soil = {
		base = dirt,
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.register_node("farming:soil_wet", {
	description = S("Wet Soil"),
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = dirt,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	sounds = mtg_basic_sounds.node_sound_dirt(),
	soil = {
		base = dirt,
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.register_node("farming:dry_soil", {
	description = S("Savanna Soil"),
	tiles = {"default_dry_dirt.png^farming_soil.png", "default_dry_dirt.png"},
	drop = dirt_dry,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	sounds = mtg_basic_sounds.node_sound_dirt(),
	soil = {
		base = dirt_dry,
		dry = "farming:dry_soil",
		wet = "farming:dry_soil_wet"
	}
})

minetest.register_node("farming:dry_soil_wet", {
	description = S("Wet Savanna Soil"),
	tiles = {"default_dry_dirt.png^farming_soil_wet.png", "default_dry_dirt.png^farming_soil_wet_side.png"},
	drop = dirt_dry,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	sounds = mtg_basic_sounds.node_sound_dirt(),
	soil = {
		base = dirt_dry,
		dry = "farming:dry_soil",
		wet = "farming:dry_soil_wet"
	}
})


minetest.register_node("farming:desert_sand_soil", {
	description = S("Desert Sand Soil"),
	drop = sand_desert,
	tiles = {"farming_desert_sand_soil.png", "default_desert_sand.png"},
	groups = {crumbly=3, not_in_creative_inventory = 1, falling_node=1, sand=1, soil = 2, desert = 1, field = 1},
	sounds = mtg_basic_sounds.node_sound_sand(),
	soil = {
		base = sand_desert,
		dry = "farming:desert_sand_soil",
		wet = "farming:desert_sand_soil_wet"
	}
})

minetest.register_node("farming:desert_sand_soil_wet", {
	description = S("Wet Desert Sand Soil"),
	drop = sand_desert,
	tiles = {"farming_desert_sand_soil_wet.png", "farming_desert_sand_soil_wet_side.png"},
	groups = {crumbly=3, falling_node=1, sand=1, not_in_creative_inventory=1, soil=3, wet = 1, desert = 1, field = 1},
	sounds = mtg_basic_sounds.node_sound_sand(),
	soil = {
		base = sand_desert,
		dry = "farming:desert_sand_soil",
		wet = "farming:desert_sand_soil_wet"
	}
})

minetest.register_node("farming:straw", {
	description = S("Straw"),
	tiles = {"farming_straw.png"},
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	sounds = mtg_basic_sounds.node_sound_leaves(),
})

-- Registered before the stairs so the stairs get fuel recipes.
minetest.register_craft({
	type = "fuel",
	recipe = "farming:straw",
	burntime = 3,
})

if stairs_mod == true then
	do
		local recipe = "farming:straw"
		local groups = {snappy = 3, flammable = 4}
		local images = {"farming_straw.png"}
		local sounds = mtg_basic_sounds.node_sound_leaves()

		stairs.register_stair("straw", recipe, groups, images, S("Straw Stair"),sounds, true)
		
		stairs.register_stair_inner("straw", recipe, groups, images, "",sounds, true, S("Inner Straw Stair"))
		
		stairs.register_stair_outer("straw", recipe, groups, images, "",sounds, true, S("Outer Straw Stair"))
		
		stairs.register_slab("straw", recipe, groups, images, S("Straw Slab"), sounds, true)
	end
end

minetest.register_abm({
	label = "Farming soil",
	nodenames = {"group:field"},
	interval = 15,
	chance = 4,
	action = function(pos, node)
		local n_def = minetest.registered_nodes[node.name] or nil
		local wet = n_def.soil.wet or nil
		local base = n_def.soil.base or nil
		local dry = n_def.soil.dry or nil
		if not n_def or not n_def.soil or not wet or not base or not dry then
			return
		end

		pos.y = pos.y + 1
		local nn = minetest.get_node_or_nil(pos)
		if not nn or not nn.name then
			return
		end
		local nn_def = minetest.registered_nodes[nn.name] or nil
		pos.y = pos.y - 1

		if nn_def and nn_def.walkable and minetest.get_item_group(nn.name, "plant") == 0 then
			minetest.set_node(pos, {name = base})
			return
		end
		-- check if there is water nearby
		local wet_lvl = minetest.get_item_group(node.name, "wet")
		if minetest.find_node_near(pos, 3, {"group:water"}) then
			-- if it is dry soil and not base node, turn it into wet soil
			if wet_lvl == 0 then
				minetest.set_node(pos, {name = wet})
			end
		else
			-- only turn back if there are no unloaded blocks (and therefore
			-- possible water sources) nearby
			if not minetest.find_node_near(pos, 3, {"ignore"}) then
				-- turn it back into base if it is already dry
				if wet_lvl == 0 then
					-- only turn it back if there is no plant/seed on top of it
					if minetest.get_item_group(nn.name, "plant") == 0 and minetest.get_item_group(nn.name, "seed") == 0 then
						minetest.set_node(pos, {name = base})
					end

				-- if its wet turn it back into dry soil
				elseif wet_lvl == 1 then
					minetest.set_node(pos, {name = dry})
				end
			end
		end
	end,
})


-- Make mtg_decor_simple:grass_* occasionally drop wheat seed

for i = 1, 5 do
	minetest.override_item(grass_x..i, {drop = {
		max_items = 1,
		items = {
			{items = {"farming:seed_wheat"}, rarity = 5},
			{items = {grass_y}},
		}
	}})
end

-- Wild cotton as a source of cotton seed

minetest.register_node("farming:cotton_wild", {
	description = S("Wild Cotton"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"farming_cotton_wild.png"},
	inventory_image = "farming_cotton_wild.png",
	wield_image = "farming_cotton_wild.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, attached_node = 1, flammable = 4},
	drop = "farming:seed_cotton",
	sounds = mtg_basic_sounds.node_sound_leaves(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -8 / 16, -6 / 16, 6 / 16, 5 / 16, 6 / 16},
	},
})
