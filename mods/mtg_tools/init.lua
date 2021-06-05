----------------------------------------------------
--              _____         _                   --
--             |_   _|__  ___| |___               --
--               | |/ _ \/ _ \ (_-<               --
--               |_|\___/\___/_/__/               --
----------------------------------------------------
--             MTG Tools and Weapons              --
----------------------------------------------------

-- setup mod global table 
mtg_tools = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

--setup translation ref
mtg_tools.translator = minetest.get_translator(modname)

dofile(modpath .. "/i_register_tools.lua")
dofile(modpath .. "/i_aliases_tools.lua")
dofile(modpath .. "/i_register_craftitems.lua")
dofile(modpath .. "/i_aliases_craftitems.lua")
dofile(modpath .. "/i_register_crafts.lua")
dofile(modpath .. "/i_register_fuel.lua")
