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

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

----------------------
-- Default settings --
----------------------
-- setup mod global table 
mtg_basic_env_fab = {}

--setup translation ref
mtg_basic_env_fab.translator = minetest.get_translator(modname)

dofile(modpath .. "/i_register_nodes.lua")
dofile(modpath .. "/i_aliases_nodes.lua")
dofile(modpath .. "/i_register_craftitems.lua")
dofile(modpath .. "/i_aliases_craftitems.lua")
dofile(modpath .. "/i_register_crafts.lua")
dofile(modpath .. "/i_register_fuel.lua")








