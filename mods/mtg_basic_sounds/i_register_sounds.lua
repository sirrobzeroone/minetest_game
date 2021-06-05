------------------------------------------
--      ___                   _         --
--     / __| ___ _  _ _ _  __| |___     --
--     \__ \/ _ \ || | ' \/ _` (_-<     --
--     |___/\___/\_,_|_||_\__,_/__/     --
------------------------------------------
--            MTG Basic Sounds          --
------------------------------------------ 
--            Register Sounds           --
------------------------------------------
--[[Index of sounds
	-- Dug and Place - mtg_basic_sounds.node_dug_place_sound()
	-- Stone         - mtg_basic_sounds.node_sound_stone()
	-- Dirt          - mtg_basic_sounds.node_sound_dirt()
	-- Snow          - mtg_basic_sounds.node_sound_snow()
	-- Grass         - mtg_basic_sounds.node_sound_grass()
	-- Grass Dry     - mtg_basic_sounds.node_sound_grass_dry()
	-- Sand          - mtg_basic_sounds.node_sound_sand()
	-- Gravel        - mtg_basic_sounds.node_sound_gravel()
	-- Wood          - mtg_basic_sounds.node_sound_wood()
	-- Leaves        - mtg_basic_sounds.node_sound_leaves()
	-- Glass         - mtg_basic_sounds.node_sound_glass()
	-- Ice           - mtg_basic_sounds.node_sound_ice()
	-- Metal         - mtg_basic_sounds.node_sound_metal()
	-- Water         - mtg_basic_sounds.node_sound_water()
	-- Kelp          - mtg_basic_sounds.node_sound_kelp()
	-- Coral         - mtg_basic_sounds.node_sound_coral()
	-- Cool Lava
--]]


function mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "", gain = 1.0}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_dug_node", gain = 0.25}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node_hard", gain = 1.0}
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_stone(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_hard_footstep", gain = 0.2}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_hard_footstep", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_dirt(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_dirt_footstep", gain = 0.25}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_dirt_footstep", gain = 1.0}
	tbl_sounds = tbl_sounds.dig or
							  {name = "default_dig_crumbly", gain = 0.4}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_snow(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_snow_footstep", gain = 0.2}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_snow_footstep", gain = 0.3}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_snow_footstep", gain = 0.3}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_grass(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_grass_footstep", gain = 0.25}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_dirt_footstep", gain = 1.0}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_grass_dry(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_grass_footstep", gain = 0.4}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_dirt_footstep", gain = 1.0}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_sand(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_sand_footstep", gain = 0.05}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_sand_footstep", gain = 0.15}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_gravel(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_gravel_footstep", gain = 0.25}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_gravel_dig", gain = 0.35}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_gravel_dug", gain = 1.0}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_wood(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_wood_footstep", gain = 0.15}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_dig_choppy", gain = 0.4}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_wood_footstep", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_leaves(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_grass_footstep", gain = 0.45}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_grass_footstep", gain = 0.7}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_glass(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_glass_footstep", gain = 0.3}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_glass_footstep", gain = 0.5}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_break_glass", gain = 1.0}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_ice(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_ice_footstep", gain = 0.15}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_ice_dig", gain = 0.5}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_ice_dug", gain = 0.5}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_metal(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_metal_footstep", gain = 0.2}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_dig_metal", gain = 0.5}
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_dug_metal", gain = 0.5}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node_metal", gain = 0.5}
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_water(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_water_footstep", gain = 0.2}
	mtg_basic_sounds.node_dug_place_sound(tbl_sounds)
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_kelp(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_sand_footstep", gain = 0.05}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_dig_snappy", gain = 0.2}							   
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_grass_footstep", gain = 0.25}
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node", gain = 1.0}
	return tbl_sounds
end

function mtg_basic_sounds.node_sound_coral(tbl_sounds)
	tbl_sounds = tbl_sounds or {}
	tbl_sounds.footstep = tbl_sounds.footstep or
							   {name = "default_hard_footstep", gain = 0.3}
	tbl_sounds.dig = tbl_sounds.dig or
							   {name = "default_dig_snappy", gain = 0.2}							   							   
	tbl_sounds.dug = tbl_sounds.dug or
							   {name = "default_grass_footstep", gain = 0.25}							   
	tbl_sounds.place = tbl_sounds.place or
							   {name = "default_place_node_hard", gain = 1.0}
	return tbl_sounds
end
