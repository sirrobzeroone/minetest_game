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
--                     Fuel                       --
----------------------------------------------------

--Alias Check
local paper = minetest.registered_aliases["mtg_env_decor_fab:paper"] or "mtg_env_decor_fab:paper"
local book = minetest.registered_aliases["mtg_env_decor_fab:book"] or "mtg_env_decor_fab:book"
local book_written = minetest.registered_aliases["mtg_env_decor_fab:book_written"] or "mtg_env_decor_fab:book_written"

local bookshelf = minetest.registered_aliases["mtg_env_decor_fab:bookshelf"] or "mtg_env_decor_fab:bookshelf"
local sign_wood = minetest.registered_aliases["mtg_env_decor_fab:sign_wall_wood"] or "mtg_env_decor_fab:sign_wall_wood"
local ladder_wood = minetest.registered_aliases["mtg_env_decor_fab:ladder_wood"] or "mtg_env_decor_fab:ladder_wood"

local fence_apple = minetest.registered_aliases["mtg_env_decor_fab:fence_apple_tree_wood"] or "mtg_env_decor_fab:fence_apple_tree_wood"
local fence_acacia = minetest.registered_aliases["mtg_env_decor_fab:fence_acacia_tree_wood"] or "mtg_env_decor_fab:fence_acacia_tree_wood"
local fence_aspen = minetest.registered_aliases["mtg_env_decor_fab:fence_aspen_tree_wood"] or "mtg_env_decor_fab:fence_aspen_tree_wood"
local fence_jungle = minetest.registered_aliases["mtg_env_decor_fab:fence_jungle_tree_wood"] or "mtg_env_decor_fab:fence_jungle_tree_wood"
local fence_pine = minetest.registered_aliases["mtg_env_decor_fab:fence_pine_tree_wood"] or "mtg_env_decor_fab:fence_pine_tree_wood"

local rail_apple = minetest.registered_aliases["mtg_env_decor_fab:fence_rail_apple_tree_wood"] or "mtg_env_decor_fab:fence_rail_apple_tree_wood"
local rail_acacia = minetest.registered_aliases["mtg_env_decor_fab:fence_rail_acacia_tree_wood"] or "mtg_env_decor_fab:fence_rail_acacia_tree_wood"
local rail_aspen = minetest.registered_aliases["mtg_env_decor_fab:fence_rail_aspen_tree_wood"] or "mtg_env_decor_fab:fence_rail_aspen_tree_wood"
local rail_jungle = minetest.registered_aliases["mtg_env_decor_fab:fence_rail_jungle_tree_wood"] or "mtg_env_decor_fab:fence_rail_jungle_tree_wood"
local rail_pine = minetest.registered_aliases["mtg_env_decor_fab:fence_rail_pine_tree_wood"] or "mtg_env_decor_fab:fence_rail_pine_tree_wood"

---------------------
--  Register Fuel  --
---------------------

minetest.register_craft({
	type = "fuel",
	recipe = paper,
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = book,
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = book_written,
	burntime = 3,
})


minetest.register_craft({
	type = "fuel",
	recipe = bookshelf,
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = sign_wood,
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = ladder_wood,
	burntime = 7,
})


minetest.register_craft({
	type = "fuel",
	recipe = fence_aspen,
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = fence_pine,
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = fence_apple,
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = fence_acacia,
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = fence_jungle,
	burntime = 9,
})


minetest.register_craft({
	type = "fuel",
	recipe = rail_aspen,
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = rail_pine,
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = rail_apple,
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = rail_acacia,
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = rail_jungle,
	burntime = 7,
})
