----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
--   ___     _        _         _   _             --
--  | __|_ _| |__ _ _(_)__ __ _| |_(_)___ _ _     --
--  | _/ _` | '_ \ '_| / _/ _` |  _| / _ \ ' \    --
--  |_|\__,_|_.__/_| |_\__\__,_|\__|_\___/_||_|   --
----------------------------------------------------
--        MTG Basic Environment Fabrication       --
----------------------------------------------------
--                  Craft Items                   --
----------------------------------------------------

-- support for MT game translation.
local S = mtg_basic_env_fab.translator

--[[
-- These are the minimum craft items that need to be registered 
-- to support the registered nodes.

-- Craftitem reg names can be adjusted to whatever you like just 
-- ensure to update "i_aliases_craftitems.lua". I have left a 
-- commented out section inside aliases so this can easily be done.

-----------------
--  Index/Key  --
-----------------
-----------
-- Stone --
-----------

	mtg_basic_env_fab:obsidian_shard

----------------
--  Crystal   --
----------------

	mtg_basic_env_fab:mese_crystal_shard
	mtg_basic_env_fab:diamond_crystal_shard	 -- added for consistancy

--]]

--------------------------
-- Register Craft Items --
--------------------------
-----------
-- Stone --
-----------
minetest.register_craftitem("mtg_basic_env_fab:obsidian_shard", {
	description = S("Obsidian Shard"),
	inventory_image = "default_obsidian_shard.png",
})

----------------
--  Crystal   --
----------------
minetest.register_craftitem("mtg_basic_env_fab:mese_crystal_shard", {
	description = S("Mese Crystal Shard"),
	inventory_image = "default_mese_crystal_fragment.png",
})

minetest.register_craftitem("mtg_basic_env_fab:diamond_crystal_shard", {
	description = S("Diamond Shard"),
	inventory_image = "default_diamond_crystal_fragment.png",
})
