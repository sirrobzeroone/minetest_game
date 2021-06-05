----------------------------------------------------
--              ___ _            _                --
--             / __(_)_ __  _ __| |___            --
--             \__ \ | '  \| '_ \ / -_)           --
--             |___/_|_|_|_| .__/_\___|           --
--   ___                 |_|  _   _               --
--  |   \ ___ __ ___ _ _ __ _| |_(_)___ _ _  ___  --
--  | |) / -_) _/ _ \ '_/ _` |  _| / _ \ ' \(_-<  --
--  |___/\___\__\___/_| \__,_|\__|_\___/_||_/__/  --
----------------------------------------------------
--            MTG Decorations Simple              --
----------------------------------------------------

----------------------
-- Default settings --
----------------------
-- setup mod global table
mtg_decor_simple = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

--setup translation ref
mtg_decor_simple.translator = minetest.get_translator(modname)

--------------------------
--  Mods Present Check  --
--------------------------
-- Allows mapgen to run without mtg_decor_schem

-- schematic decorations
if minetest.get_modpath("mtg_decor_schema") ~= nil then
	mtg_decor_simple.dec_schema = true
else
	mtg_decor_simple.dec_schema = false
	minetest.clear_registered_decorations()
end

dofile(modpath .. "/i_functions.lua")
dofile(modpath .. "/i_register_nodes.lua")
dofile(modpath .. "/i_aliases_nodes.lua")

local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name == "v6" then
	dofile(modpath .. "/i_register_decorations_v6.lua")
else
	dofile(modpath .. "/i_register_decorations.lua")
end



