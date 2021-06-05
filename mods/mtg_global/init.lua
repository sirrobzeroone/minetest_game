----------------------------------------------------
--              ___ _     _          _            --
--             / __| |___| |__  __ _| |           --
--            | (_ | / _ \ '_ \/ _` | |           --
--             \___|_\___/_.__/\__,_|_|           --
----------------------------------------------------
--         MTG Global Settings & Functions        --
----------------------------------------------------

-- setup mod global table 
mtg_global = {}


--setup translation ref
local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

mtg_global.translator = minetest.get_translator(modname)

-- setup light max and legacy
mtg_global.LIGHT_MAX = 14
LIGHT_MAX = mtg_global.LIGHT_MAX          -- legacy



dofile(modpath .. "/i_functions.lua")
dofile(modpath .. "/i_player.lua")

