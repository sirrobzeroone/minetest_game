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
--                    Aliases                     --
----------------------------------------------------

--------------------------------
-- Aliases for map generators --
--------------------------------
-- All mapgen aliases
minetest.register_alias("mapgen_stone", "mtg_basic_env:stone")
minetest.register_alias("mapgen_water_source", "mtg_basic_env:water_source")
minetest.register_alias("mapgen_river_water_source", "mtg_basic_env:water_fresh_source")

-- Mapgen v6 additional aliases
minetest.register_alias("mapgen_lava_source", "mtg_basic_env:lava_source")
minetest.register_alias("mapgen_dirt", "mtg_basic_env:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "mtg_basic_env:dirt_grass")
minetest.register_alias("mapgen_sand", "mtg_basic_env:sand")
minetest.register_alias("mapgen_gravel", "mtg_basic_env:gravel")
minetest.register_alias("mapgen_desert_stone", "mtg_basic_env:stone_desert")
minetest.register_alias("mapgen_desert_sand", "mtg_basic_env:sand_desert")
minetest.register_alias("mapgen_dirt_with_snow", "mtg_basic_env:dirt_snow")
minetest.register_alias("mapgen_snowblock", "mtg_basic_env:snow_block")
minetest.register_alias("mapgen_snow", "mtg_basic_env:snow")
minetest.register_alias("mapgen_ice", "mtg_basic_env:ice")
minetest.register_alias("mapgen_cobble", "mtg_basic_env:cobble")
minetest.register_alias("mapgen_mossycobble", "mtg_basic_env:cobble_mossy")
	
-- allow Mgv6 to generate if stairs, mtg_decor_simple and mtg_decor_schema are not loaded.	
if mtg_mapgen.dec_simple == true then	
	minetest.register_alias("mapgen_junglegrass", "mtg_decor_simple:grass_jungle")
else
	minetest.register_alias("mapgen_junglegrass", "air")
end	

if mtg_mapgen.stairs == true then	
	minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
	minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_desert_stone")
else
	minetest.register_alias("mapgen_stair_cobble", "mtg_basic_env:cobble")
	minetest.register_alias("mapgen_stair_desert_stone", "mtg_basic_env:stone_desert")
end	
	
if mtg_mapgen.dec_schem == true then
	minetest.register_alias("mapgen_tree", "mtg_decor_schema:apple_tree_trunk")
	minetest.register_alias("mapgen_leaves", "mtg_decor_schema:apple_tree_leaves")
	minetest.register_alias("mapgen_apple", "mtg_decor_schema:apple_tree_apple")
	minetest.register_alias("mapgen_jungletree", "mtg_decor_schema:jungle_tree_trunk")
	minetest.register_alias("mapgen_jungleleaves", "mtg_decor_schema:jungle_tree_leaves")
	minetest.register_alias("mapgen_pine_tree", "mtg_decor_schema:pine_tree_trunk")
	minetest.register_alias("mapgen_pine_needles", "mtg_decor_schema:pine_tree_leaves")
else
	minetest.register_alias("mapgen_tree", "air")
	minetest.register_alias("mapgen_leaves", "air")
	minetest.register_alias("mapgen_apple", "air")
	minetest.register_alias("mapgen_jungletree", "air")
	minetest.register_alias("mapgen_jungleleaves", "air")
	minetest.register_alias("mapgen_pine_tree", "air")
	minetest.register_alias("mapgen_pine_needles", "air")
end