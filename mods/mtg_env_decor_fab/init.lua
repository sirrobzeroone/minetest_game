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

-- setup mod global table 
mtg_env_decor_fab = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)


--setup translation ref
mtg_env_decor_fab.translator = minetest.get_translator(modname)

--handy settings for ease of update
	--Book related - see i_functions.lua
	mtg_env_decor_fab.lpp = 14 -- Lines per page
	mtg_env_decor_fab.max_text_size = 10000
	mtg_env_decor_fab.max_title_size = 80
	mtg_env_decor_fab.short_title_size = 35


dofile(modpath .. "/i_functions.lua")
dofile(modpath .. "/i_register_nodes.lua")
dofile(modpath .. "/i_aliases_nodes.lua")
dofile(modpath .. "/i_register_craftitems.lua")
dofile(modpath .. "/i_aliases_craftitems.lua")
dofile(modpath .. "/i_register_crafts.lua")
dofile(modpath .. "/i_register_fuel.lua")