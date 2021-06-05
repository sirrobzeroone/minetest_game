----------------------------------------------------
--         ___       __           _ _             --
--        |   \ ___ / _|__ _ _  _| | |_           --
--        | |) / -_)  _/ _` | || | |  _|          --
--        |___/\___|_| \__,_|\_,_|_|\__|          --
----------------------------------------------------
--         Proxy mod to replace default           --
----------------------------------------------------
--       new mod name = mtg_decor_schema          --
----------------------------------------------------

default.grow_sapling = mtg_decor_schema.grow_sapling
default.sapling_on_place = mtg_decor_schema.sapling_on_place
default.after_place_leaves = mtg_decor_schema.after_place_leaves
default.register_leafdecay = mtg_decor_schema.register_leafdecay
default.dig_up = mtg_decor_schema.dig_up

----------------------
-- Soft / Non-Stone --
----------------------
minetest.register_alias("default:dirt_with_coniferous_litter","mtg_decor_schema:dirt_coniferous_litter")
minetest.register_alias("default:dirt_with_rainforest_litter","mtg_decor_schema:dirt_rainforest_litter")

--------------
-- Plantlife --
---------------
minetest.register_alias("default:cactus","mtg_decor_schema:cactus")
minetest.register_alias("default:large_cactus_seedling","mtg_decor_schema:cactus_sapling_large")

minetest.register_alias("default:papyrus","mtg_decor_schema:papyrus")

minetest.register_alias("default:bush_stem","mtg_decor_schema:bush_stem")
minetest.register_alias("default:bush_leaves","mtg_decor_schema:bush_leaves")
minetest.register_alias("default:bush_sapling","mtg_decor_schema:bush_sapling")

minetest.register_alias("default:blueberry_bush_leaves_with_berries","mtg_decor_schema:blueberry_bush_leaves_berries")
minetest.register_alias("default:blueberry_bush_leaves","mtg_decor_schema:blueberry_bush_leaves")
minetest.register_alias("default:blueberry_bush_sapling","mtg_decor_schema:blueberry_bush_sapling")

minetest.register_alias("default:acacia_bush_stem","mtg_decor_schema:acacia_bush_stem")
minetest.register_alias("default:acacia_bush_leaves","mtg_decor_schema:acacia_bush_leaves")
minetest.register_alias("default:acacia_bush_sapling","mtg_decor_schema:acacia_bush_sapling")

minetest.register_alias("default:pine_bush_stem","mtg_decor_schema:pine_bush_stem")
minetest.register_alias("default:pine_bush_needles","mtg_decor_schema:pine_bush_leaves")
minetest.register_alias("default:pine_bush_sapling","mtg_decor_schema:pine_bush_sapling")

-------------
--  Trees  --
-------------
minetest.register_alias("default:tree","mtg_decor_schema:apple_tree_trunk")
minetest.register_alias("default:wood","mtg_decor_schema:apple_tree_wood")
minetest.register_alias("default:leaves","mtg_decor_schema:apple_tree_leaves")
minetest.register_alias("default:sapling","mtg_decor_schema:apple_tree_sapling")
minetest.register_alias("default:apple","mtg_decor_schema:apple_tree_apple")

minetest.register_alias("default:jungletree","mtg_decor_schema:jungle_tree_trunk")
minetest.register_alias("default:junglewood","mtg_decor_schema:jungle_tree_wood")
minetest.register_alias("default:jungleleaves","mtg_decor_schema:jungle_tree_leaves")
minetest.register_alias("default:junglesapling","mtg_decor_schema:jungle_tree_sapling")
minetest.register_alias("default:emergent_jungle_sapling","mtg_decor_schema:jungle_tree_sapling_emergant")

minetest.register_alias("default:pine_tree","mtg_decor_schema:pine_tree_trunk")
minetest.register_alias("default:pine_wood","mtg_decor_schema:pine_tree_wood")
minetest.register_alias("default:pine_needles","mtg_decor_schema:pine_tree_leaves")
minetest.register_alias("default:pine_sapling","mtg_decor_schema:pine_tree_sapling")

minetest.register_alias("default:acacia_tree","mtg_decor_schema:acacia_tree_trunk")
minetest.register_alias("default:acacia_wood","mtg_decor_schema:acacia_tree_wood")
minetest.register_alias("default:acacia_leaves","mtg_decor_schema:acacia_tree_leaves")
minetest.register_alias("default:acacia_sapling","mtg_decor_schema:acacia_tree_sapling")

minetest.register_alias("default:aspen_tree","mtg_decor_schema:aspen_tree_trunk")
minetest.register_alias("default:aspen_wood","mtg_decor_schema:aspen_tree_wood")
minetest.register_alias("default:aspen_leaves","mtg_decor_schema:aspen_tree_leaves")
minetest.register_alias("default:aspen_sapling","mtg_decor_schema:aspen_tree_sapling")

---------------
-- Plantlife --
---------------
minetest.register_alias("default:blueberries","mtg_decor_schema:blueberries")

-------------
--  Trees  --
-------------
minetest.register_alias("default:stick","mtg_decor_schema:stick")