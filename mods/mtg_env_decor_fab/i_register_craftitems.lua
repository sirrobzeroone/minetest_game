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
--                  Craft Items                   --
----------------------------------------------------
-- support for MT game translation.
local S = mtg_env_decor_fab.translator

--[[
-- Craftitem reg names can be adjusted to whatever you like just 
-- ensure to update "i_aliases_craftitems.lua". I have left a 
-- commented out section inside aliases so this can easily be done.

----------
-- Misc --
----------
	mtg_env_decor_fab:paper
	mtg_env_decor_fab:book
	mtg_env_decor_fab:book_written
--]]

minetest.register_craftitem("mtg_env_decor_fab:paper", {
	description = S("Paper"),
	inventory_image = "default_paper.png",
	groups = {flammable = 3},
})

minetest.register_craftitem("mtg_env_decor_fab:book", {
	description = S("Book"),
	inventory_image = "default_book.png",
	groups = {book = 1, flammable = 3},
	on_use = mtg_env_decor_fab.book_on_use,
})

minetest.register_craftitem("mtg_env_decor_fab:book_written", {
	description = S("Book with Text"),
	inventory_image = "default_book_written.png",
	groups = {book = 1, not_in_creative_inventory = 1, flammable = 3},
	stack_max = 1,
	on_use = mtg_env_decor_fab.book_on_use,
})

