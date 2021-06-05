----------------------------------------------------
--              _____         _                   --
--             |_   _|__  ___| |___               --
--               | |/ _ \/ _ \ (_-<               --
--               |_|\___/\___/_/__/               --
----------------------------------------------------
--             MTG Tools and Weapons              --
----------------------------------------------------
--                Register Tools                  --
----------------------------------------------------
--                      Fuel                      --
----------------------------------------------------

-- Assign recipe ingredients to variables/tables to check for aliases this will
-- help make ingredient name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases

local pick_wood = minetest.registered_aliases["mtg_tools:pick_wood"] or "mtg_tools:pick_wood"
local shovel_wood = minetest.registered_aliases["mtg_tools:shovel_wood"] or "mtg_tools:shovel_wood"
local axe_wood = minetest.registered_aliases["mtg_tools:axe_wood"] or "mtg_tools:axe_wood"
local sword_wood = minetest.registered_aliases["mtg_tools:sword_wood"] or "mtg_tools:sword_wood"

minetest.register_craft({
	type = "fuel",
	recipe = "mtg_tools:pick_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mtg_tools:shovel_wood",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mtg_tools:axe_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mtg_tools:sword_wood",
	burntime = 5,
})