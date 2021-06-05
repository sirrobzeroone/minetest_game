----------------------------------------------------
--         ___       __           _ _             --
--        |   \ ___ / _|__ _ _  _| | |_           --
--        | |) / -_)  _/ _` | || | |  _|          --
--        |___/\___|_| \__,_|\_,_|_|\__|          --
----------------------------------------------------
--         Proxy mod to replace default           --  
----------------------------------------------------
--         new mod name = mtg_basic_env           --
----------------------------------------------------

-----------
-- Stone --
-----------
minetest.register_alias("default:stone","mtg_basic_env:stone")
minetest.register_alias("default:cobble","mtg_basic_env:cobble")
minetest.register_alias("default:mossycobble","mtg_basic_env:cobble_mossy")
minetest.register_alias("default:obsidian","mtg_basic_env:obsidian")

minetest.register_alias("default:desert_stone","mtg_basic_env:stone_desert")
minetest.register_alias("default:desert_cobble","mtg_basic_env:cobble_desert")

minetest.register_alias("default:sandstone","mtg_basic_env:sandstone")
minetest.register_alias("default:desert_sandstone","mtg_basic_env:sandstone_desert")
minetest.register_alias("default:silver_sandstone","mtg_basic_env:sandstone_silver")

----------
-- Ores --
----------
minetest.register_alias("default:stone_with_coal","mtg_basic_env:stone_coal_ore")
minetest.register_alias("default:stone_with_iron","mtg_basic_env:stone_iron_ore")
minetest.register_alias("default:stone_with_tin","mtg_basic_env:stone_tin_ore")
minetest.register_alias("default:stone_with_copper","mtg_basic_env:stone_copper_ore")
minetest.register_alias("default:stone_with_gold","mtg_basic_env:stone_gold_ore")        
minetest.register_alias("default:stone_with_mese","mtg_basic_env:stone_mese_ore")
minetest.register_alias("default:stone_with_diamond","mtg_basic_env:stone_diamond_ore")

----------------------
-- Soft / Non-Stone --
----------------------
minetest.register_alias("default:dirt","mtg_basic_env:dirt")
minetest.register_alias("default:dry_dirt","mtg_basic_env:dirt_dry")
minetest.register_alias("default:dirt_with_snow","mtg_basic_env:dirt_snow")
minetest.register_alias("default:dirt_with_grass","mtg_basic_env:dirt_grass")
minetest.register_alias("default:dirt_with_dry_grass","mtg_basic_env:dirt_grass_dry")
minetest.register_alias("default:dry_dirt_with_dry_grass","mtg_basic_env:dirt_dry_grass_dry")
minetest.register_alias("default:dirt_with_grass_footsteps","mtg_basic_env:dirt_grass_footstep")

minetest.register_alias("default:gravel","mtg_basic_env:gravel")
minetest.register_alias("default:clay","mtg_basic_env:clay")

minetest.register_alias("default:permafrost","mtg_basic_env:permafrost")
minetest.register_alias("default:permafrost_with_stones","mtg_basic_env:permafrost_with_stones")
minetest.register_alias("default:permafrost_with_moss","mtg_basic_env:permafrost_mossy")

minetest.register_alias("default:sand","mtg_basic_env:sand")
minetest.register_alias("default:desert_sand","mtg_basic_env:sand_desert")
minetest.register_alias("default:silver_sand","mtg_basic_env:sand_silver")

minetest.register_alias("default:snow","mtg_basic_env:snow")
minetest.register_alias("default:snowblock","mtg_basic_env:snow_block")
minetest.register_alias("default:ice","mtg_basic_env:ice")
minetest.register_alias("default:cave_ice","mtg_basic_env:ice_cave")

-------------
-- Liquids --
-------------
minetest.register_alias("default:water_source","mtg_basic_env:water_source")
minetest.register_alias("default:water_flowing","mtg_basic_env:water_flowing")

minetest.register_alias("default:river_water_source","mtg_basic_env:water_fresh_source")
minetest.register_alias("default:river_water_flowing","mtg_basic_env:water_fresh_flowing")

minetest.register_alias("default:lava_source","mtg_basic_env:lava_source")
minetest.register_alias("default:lava_flowing","mtg_basic_env:lava_flowing")

---------
-- Air --
---------
minetest.register_alias("default:cloud","mtg_basic_env:air_cloud")

----------
-- Ores --
----------
minetest.register_alias("default:coal_lump", "mtg_basic_env:coal_lump")
minetest.register_alias("default:iron_lump", "mtg_basic_env:iron_lump")
minetest.register_alias("default:tin_lump", "mtg_basic_env:tin_lump")
minetest.register_alias("default:copper_lump", "mtg_basic_env:copper_lump")
minetest.register_alias("default:gold_lump", "mtg_basic_env:gold_lump")
minetest.register_alias("default:mese_crystal", "mtg_basic_env:mese_crystal")
minetest.register_alias("default:diamond", "mtg_basic_env:diamond_crystal")

----------------------
-- Soft / Non-Stone --
----------------------
minetest.register_alias("default:flint", "mtg_basic_env:flint")
minetest.register_alias("default:clay_lump", "mtg_basic_env:clay_lump")