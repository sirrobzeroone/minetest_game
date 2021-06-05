----------------------------------------------------
--              _____         _                   --
--             |_   _|__  ___| |___               --
--               | |/ _ \/ _ \ (_-<               --
--               |_|\___/\___/_/__/               --
----------------------------------------------------
--             MTG Tools and Weapons              --
----------------------------------------------------
--               Crafting/Recipes                 --
----------------------------------------------------

-- Assign recipe ingredients to variables/tables to check for aliases this will
-- help make ingredient name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases

local key = minetest.registered_aliases["mtg_tools:key"] or "mtg_tools:key"
local skel_key = minetest.registered_aliases["mtg_tools:skeleton_key"] or "mtg_tools:skeleton_key"
local gold_ingot = minetest.registered_aliases["mtg_basic_env_cook:gold_ingot"] or "mtg_basic_env_cook:gold_ingot"
---------------
-- All Tools --
---------------
local craft_ingreds = {
	wood = "group:wood",
	stone = "group:stone",
	steel = minetest.registered_aliases["mtg_basic_env_cook:steel_ingot"] or "mtg_basic_env_cook:steel_ingot",
	bronze = minetest.registered_aliases["mtg_basic_env_cook:bronze_ingot"] or "mtg_basic_env_cook:bronze_ingot",
	mese = minetest.registered_aliases["mtg_basic_env_cook:mese_crystal"] or "mtg_basic_env_cook:mese_crystal",
	diamond = minetest.registered_aliases["mtg_basic_env_cook:diamond_crystal"] or "mtg_basic_env_cook:diamond_crystal"
}

for name, mat in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "mtg_tools:pick_".. name,
		recipe = {
			{mat,     mat     ,mat},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})

	minetest.register_craft({
		output = "mtg_tools:shovel_".. name,
		recipe = {
			{     mat     },
			{"group:stick"},
			{"group:stick"}
		}
	})

	minetest.register_craft({
		output = "mtg_tools:axe_".. name,
		recipe = {
			{mat,      mat     },
			{mat, "group:stick"},
			{"" , "group:stick"}
		}
	})

	minetest.register_craft({
		output = "mtg_tools:sword_".. name,
		recipe = {
			{     mat     },
			{     mat     },
			{"group:stick"}
		}
	})
end

----------------------------
-- Crafting (tool repair) --
----------------------------

minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

----------
-- Keys --
----------
minetest.register_craft({
	output = skel_key,
	recipe = {
		{gold_ingot},
	}
})

minetest.register_craft({
	type = "cooking",
	output = gold_ingot,
	recipe = key,
	cooktime = 5,
})

minetest.register_craft({
	type = "cooking",
	output = gold_ingot,
	recipe = skel_key,
	cooktime = 5,
})