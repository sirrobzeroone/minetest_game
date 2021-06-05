-- carts/rails.lua

-- support for MT game translation.
local S = carts.get_translator

-- Check for Aliases for nodes external to module
local steel_ingot =  minetest.registered_aliases["mtg_basic_env_cook:steel_ingot"] or "mtg_basic_env_cook:steel_ingot"
local mese_crystal = minetest.registered_aliases["mtg_basic_env:mese_crystal"] or "mtg_basic_env:mese_crystal"
local coal_lump = minetest.registered_aliases["mtg_basic_env:coal_lump"] or "mtg_basic_env:coal_lump"

carts:register_rail("carts:rail", {
	description = S("Rail"),
	tiles = {
		"carts_rail_straight.png", "carts_rail_curved.png",
		"carts_rail_t_junction.png", "carts_rail_crossing.png"
	},
	inventory_image = "carts_rail_straight.png",
	wield_image = "carts_rail_straight.png",
	groups = carts:get_rail_groups(),
}, {})

minetest.register_craft({
	output = "carts:rail 18",
	recipe = {
		{steel_ingot, "group:wood", steel_ingot},
		{steel_ingot,       ""    , steel_ingot},
		{steel_ingot, "group:wood", steel_ingot},
	}
})

minetest.register_alias("default:rail", "carts:rail")


carts:register_rail("carts:powerrail", {
	description = S("Powered Rail"),
	tiles = {
		"carts_rail_straight_pwr.png", "carts_rail_curved_pwr.png",
		"carts_rail_t_junction_pwr.png", "carts_rail_crossing_pwr.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = 5})

minetest.register_craft({
	output = "carts:powerrail 18",
	recipe = {
		{steel_ingot, "group:wood", steel_ingot},
		{steel_ingot, mese_crystal, steel_ingot},
		{steel_ingot, "group:wood", steel_ingot},
	}
})


carts:register_rail("carts:brakerail", {
	description = S("Brake Rail"),
	tiles = {
		"carts_rail_straight_brk.png", "carts_rail_curved_brk.png",
		"carts_rail_t_junction_brk.png", "carts_rail_crossing_brk.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = -3})

minetest.register_craft({
	output = "carts:brakerail 18",
	recipe = {
		{steel_ingot, "group:wood", steel_ingot},
		{steel_ingot,   coal_lump , steel_ingot},
		{steel_ingot, "group:wood", steel_ingot},
	}
})
