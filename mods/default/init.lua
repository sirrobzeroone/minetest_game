----------------------------------------------------
--         ___       __           _ _             --
--        |   \ ___ / _|__ _ _  _| | |_           --
--        | |) / -_)  _/ _` | || | |  _|          --
--        |___/\___|_| \__,_|\_,_|_|\__|          --
----------------------------------------------------
--         Proxy mod to replace default           --  
----------------------------------------------------
--[[ 
This mod can be deleted if no backwards compatibility
is needed with mods avaliable on contentDB or forums
which need "default" as a depends
--]]

-- setup mod global table
default = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- I have created a seperate file for each aliases/
-- proxy registering of functionality to help identify
-- which new mods hold which old default config.

dofile(modpath .. "/default_mtg_global.lua")
dofile(modpath .. "/default_mtg_basic_sounds.lua")
dofile(modpath .. "/default_mtg_basic_env.lua")
dofile(modpath .. "/default_mtg_basic_env_fab.lua")
dofile(modpath .. "/default_furnace.lua")
dofile(modpath .. "/default_mtg_basic_env_cook.lua")
dofile(modpath .. "/default_mtg_decor_simple.lua")
dofile(modpath .. "/default_mtg_decor_schema.lua")
dofile(modpath .. "/default_mtg_env_decor_fab.lua")
dofile(modpath .. "/default_mtg_tools.lua")
-- mtg_mapgen has nil functions/nodes/items to alias