----------------------------------------------------
--         ___       __           _ _             --
--        |   \ ___ / _|__ _ _  _| | |_           --
--        | |) / -_)  _/ _` | || | |  _|          --
--        |___/\___|_| \__,_|\_,_|_|\__|          --
----------------------------------------------------
--         Proxy mod to replace default           --
----------------------------------------------------
--       new mod name = mtg_env_decor_fab         --
----------------------------------------------------

default.register_fence = mtg_env_decor_fab.register_fence
default.register_fence_rail = mtg_env_decor_fab.register_fence_rail
----------
-- Misc --
----------
minetest.register_alias("default:bookshelf","mtg_env_decor_fab:bookshelf")

minetest.register_alias("default:sign_wall_wood","mtg_env_decor_fab:sign_wall_wood")
minetest.register_alias("default:sign_wall_steel","mtg_env_decor_fab:sign_wall_steel")

minetest.register_alias("default:ladder_wood","mtg_env_decor_fab:ladder_wood")
minetest.register_alias("default:ladder_steel","mtg_env_decor_fab:ladder_steel")

------------
-- Fences --
------------
minetest.register_alias("default:fence_wood","mtg_env_decor_fab:fence_apple_tree_wood")
minetest.register_alias("default:fence_acacia_wood","mtg_env_decor_fab:fence_acacia_tree_wood")
minetest.register_alias("default:fence_junglewood","mtg_env_decor_fab:fence_jungle_tree_wood")
minetest.register_alias("default:fence_pine_wood","mtg_env_decor_fab:fence_pine_tree_wood")
minetest.register_alias("default:fence_aspen_wood","mtg_env_decor_fab:fence_aspen_tree_wood")

minetest.register_alias("default:fence_rail_wood","mtg_env_decor_fab:fence_rail_apple_tree_wood")
minetest.register_alias("default:fence_rail_acacia_wood","mtg_env_decor_fab:fence_rail_acacia_tree_wood")
minetest.register_alias("default:fence_rail_junglewood","mtg_env_decor_fab:fence_rail_jungle_tree_wood")
minetest.register_alias("default:fence_rail_pine_wood","mtg_env_decor_fab:fence_rail_pine_tree_wood")
minetest.register_alias("default:fence_rail_aspen_wood","mtg_env_decor_fab:fence_rail_aspen_tree_wood")
--------------
--   Lamps  --
--------------
minetest.register_alias("default:meselamp","mtg_env_decor_fab:mese_lamp")
minetest.register_alias("default:mese_post_light","mtg_env_decor_fab:mese_post_light")

----------
-- Misc --
----------
minetest.register_alias("default:paper","mtg_env_decor_fab:paper")
minetest.register_alias("default:book","mtg_env_decor_fab:book")
minetest.register_alias("default:book_written","mtg_env_decor_fab:book_written")