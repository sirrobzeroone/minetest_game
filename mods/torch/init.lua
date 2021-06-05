----------------------------------------------------
--              _____           _                 --
--             |_   _|__ _ _ __| |_               --
--               | |/ _ \ '_/ _| ' \              --
--               |_|\___/_| \__|_||_|             --
----------------------------------------------------
--                    MTG Torch                   --
----------------------------------------------------

----------------------
-- Default settings --
----------------------
-- setup mod global table 
torch = {}


local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

--setup translation ref
torch.translator = minetest.get_translator(modname)


dofile(modpath .. "/i_register_nodes.lua")
dofile(modpath .. "/i_aliases_nodes.lua")
dofile(modpath .. "/i_register_nodes_fuel.lua")
dofile(modpath .. "/i_functions.lua")
dofile(modpath .. "/i_register_crafts.lua")
