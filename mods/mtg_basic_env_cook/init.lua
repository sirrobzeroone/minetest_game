----------------------------------------------------
--  ___         _                            _    --
-- | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_  --
-- | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _| --
-- |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__| --
--          ___          _   _                    --
--         / __|___  ___| |_(_)_ _  __ _          --
--        | (__/ _ \/ _ \ / / | ' \/ _` |         --
--         \___\___/\___/_\_\_|_||_\__, |         --
--                                 |___/          --
----------------------------------------------------
--         MTG Basic Environment Cooking          --
----------------------------------------------------



-- setup mod global table 
mtg_basic_env_cook = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

--setup translation ref
mtg_basic_env_cook.translator = minetest.get_translator(modname)

dofile(modpath .. "/i_register_nodes.lua")
dofile(modpath .. "/i_aliases_nodes.lua")
dofile(modpath .. "/i_register_craftitems.lua")
dofile(modpath .. "/i_register_crafts.lua")
dofile(modpath .. "/i_aliases_craftitems.lua")






