dungeon_loot = {}

dungeon_loot.CHESTS_MIN = 0 -- not necessarily in a single dungeon
dungeon_loot.CHESTS_MAX = 2
dungeon_loot.STACKS_PER_CHEST_MAX = 8

-- setup loot table
dungeon_loot.registered_loot = {}

-- setup loot biomes - these are mtg centric
-- table key == biome name, this means biome name now == type
-- add a biome name here and then set that as type in loot def
-- eg 	dungeon_loot.register({name = "awesome:gold_sea_orb", chance = 0.4,types = {"ocean"}})
dungeon_loot.loot_biomes = { "desert", "sandstone_desert","icesheet"}

dofile(minetest.get_modpath("dungeon_loot") .. "/mtg_loot.lua")
dofile(minetest.get_modpath("dungeon_loot") .. "/mapgen.lua")
