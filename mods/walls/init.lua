----------------------------------------------------
--             __      __    _ _                  --
--             \ \    / /_ _| | |___              --
--              \ \/\/ / _` | | (_-<              --
--               \_/\_/\__,_|_|_/__/              --
----------------------------------------------------
--                 walls/init.lua                 --
----------------------------------------------------

-- setup mod global table
walls = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)


-- Load support for mod translation.
walls.translator = minetest.get_translator(modname)

dofile(modpath .. "/i_functions.lua")
dofile(modpath .. "/i_register_walls_mtg.lua")
