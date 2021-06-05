----------------------------------------------------
--    _____                                       --
--   /     \ _____  ______   ____   ____   ____   --
--  /  \ /  \\__  \ \____ \ / ___\_/ __ \ /    \  --
-- /    Y    \/ __ \|  |_> > /_/  >  ___/|   |  \ --
-- \____|__  (____  /   __/\___  / \___  >___|  / --
--         \/     \/|__|  /_____/      \/     \/  --
----------------------------------------------------
--                   MTG Mapgen                   --
----------------------------------------------------
-- Note registration of the 3 primary elements should occur
-- in this order for non-v6 mapgens:
--		1. Biomes
--		2. Ores
--		3. Decorations
--
-- If for example you register decorations first you will
-- see some intresting behaviour on map generation for
-- example tundra snow on savanna stone. Due to the load order
-- ie I need decorations to register before mapgen as they have
-- a number of mods to check for there is a workaround at the end
-- of this page which clears decorations and re-registers them
-- biomes and ores. I allow base decorations to register first so
-- that for Mgv6 I can do a replacement for some nodes and it dosent
-- simply produce a ton of errors.
-- If Mgv6 support is not needed then mod load order can be changed
-- to all decorations after mtg_mapgen
-- eg
-- mtg_mapgen mod.conf can have these settings:
-- 			depends = mtg_basic_env
--          optional_depends =
-- mtg_basic_env_fab add mtg_mapgen to depends
-- mtg_decor_simple add mtg_mapgen to depends
-- mtg_decor_schema add mtg_mapgen to depends
-- stairs add mtg_mapgen to depends
--
-- supporting mgv6 is more difficult than the others, due to its hardcoded nature.
----------------------
-- Default settings --
----------------------
-- setup mod global table 
mtg_mapgen = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

--------------------------
--  Mods Present Check  --
--------------------------
-- Allows mapgen to run with just mtg_basic_env
-- environment fabrication (mese_block)
if minetest.get_modpath("mtg_basic_env_fab") ~= nil then
	mtg_mapgen.basic_env_fab = true
else
	mtg_mapgen.basic_env_fab = false
end

-- simple decorations (jungle grass in mgv6)
if minetest.get_modpath("mtg_decor_simple") ~= nil then
	mtg_mapgen.dec_simple = true
else
	mtg_mapgen.dec_simple = false
end

-- schematic decorations (apple tree in mgv6)
if minetest.get_modpath("mtg_decor_schema") ~= nil then
	mtg_mapgen.dec_schem = true
else
	mtg_mapgen.dec_schem = false
end

-- stairs (mgv6 cobble_stairs and stone_desert_stairs)
if minetest.get_modpath("stairs") ~= nil then
	mtg_mapgen.stairs = true
else
	mtg_mapgen.stairs = false
end

------------------------------------------------
--      Detect Mapgen, Load Config files      --
-----------------------------------------------
minetest.clear_registered_biomes()
minetest.clear_registered_ores()

-- workaround for decorations needing to be registered last
local decor_copy = table.copy(minetest.registered_decorations)

-- clear decorations
minetest.clear_registered_decorations()


local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name == "v6" then
	dofile(modpath .. "/i_mapgen_aliases.lua")
	dofile(modpath .. "/i_ores_v6.lua")
else
	dofile(modpath .. "/i_mapgen_aliases.lua")
	dofile(modpath .. "/i_biomes_not_v6.lua")
	dofile(modpath .. "/i_ores_not_v6.lua")
end

-- workaround re-register decorations
for _,v in pairs(decor_copy) do
	minetest.register_decoration(v) 
end

