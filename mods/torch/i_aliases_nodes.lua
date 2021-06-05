----------------------------------------------------
--              _____           _                 --
--             |_   _|__ _ _ __| |_               --
--               | |/ _ \ '_/ _| ' \              --
--               |_|\___/_| \__|_||_|             --
----------------------------------------------------
--                    MTG Torch                   --
----------------------------------------------------
--                     Nodes                      --
----------------------------------------------------
--                    Aliases                     --
----------------------------------------------------   

-- Below are the aliases to convert naming from "default:" to "lib_basic_env:"
-- and support old game saves or mods if needed.
-- Naming covnentions have been adjusted to follow:
--               Primary object type eg dirt,jungle, apple
--               Secondary type eg tree, stem, leaves
--               Tertiary material eg trunk, leaves
-- Just my personal preferred sorting method you can adjust the names to whatever so long
-- as the default alias remains the same. 
-- I don't recommend removing these unless you are building a game from scratch and are happy
-- to sort through potential errors in downloaded mods and manually resolve them.

minetest.register_alias("default:torch","torch:torch")
minetest.register_alias("default:torch_wall","torch:torch_wall")
minetest.register_alias("default:torch_ceiling","torch:torch_ceiling")

--------------------------------------------------------------
-- Commented out aliases simply uncomment and set new_name  --
--------------------------------------------------------------
-- minetest.register_alias("default:torch","torch:torch")
-- minetest.register_alias("default:torch_wall","torch:torch_wall")
-- minetest.register_alias("default:torch_ceiling","torch:torch_ceiling")