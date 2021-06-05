----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
----------------------------------------------------
--             MTG Basic Environment              --
----------------------------------------------------

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

----------------------
-- Default settings --
----------------------
-- setup mod global table 
mtg_basic_env = {}

--setup translation ref
mtg_basic_env.translator = minetest.get_translator(modname)

dofile(modpath .. "/i_functions.lua")
dofile(modpath .. "/i_register_nodes.lua")
dofile(modpath .. "/i_aliases_nodes.lua")
dofile(modpath .. "/i_register_craftitems.lua")
dofile(modpath .. "/i_aliases_craftitems.lua")
dofile(modpath .. "/i_register_fuel.lua")
