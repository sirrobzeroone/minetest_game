----------------------------------------------------
--              _____           _                 --
--             |_   _|__ _ _ __| |_               --
--               | |/ _ \ '_/ _| ' \              --
--               |_|\___/_| \__|_||_|             --
----------------------------------------------------
--                    MTG Torch                   --
---------------------------------------------------- 
--                Crafting/Recipes                --
----------------------------------------------------

-- Assign recipe ingredients to variables/tables to check for aliases this will
-- help make ingredient name changes future proof so long as alias tables are kept upto date
-- See - https://rubenwardy.com/minetest_modding_book/en/items/nodes_items_crafting.html#item-aliases
local coal_lump = minetest.registered_aliases["mtg_basic_env:coal_lump"] or "mtg_basic_env:coal_lump"
local torch = minetest.registered_aliases["torch:torch"] or "torch:torch"

minetest.register_craft({
	output = torch.." 4",
	recipe = {
		{coal_lump},
		{"group:stick"},
	}
})