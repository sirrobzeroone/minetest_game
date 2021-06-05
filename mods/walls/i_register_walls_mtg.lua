----------------------------------------------------
--             __      __    _ _                  --
--             \ \    / /_ _| | |___              --
--              \ \/\/ / _` | | (_-<              --
--               \_/\_/\__,_|_|_/__/              --
----------------------------------------------------
--                 walls/init.lua                 --
----------------------------------------------------
--        Register Walls for Minetest Game        --
----------------------------------------------------

-- support for translation.
local S = walls.translator


--walls.register = function(wall_name, wall_desc, wall_texture_table, wall_mat, wall_groups, wall_sounds)

local basic_env_fab = false
local basic_env_cook = false

if minetest.get_modpath("mtg_basic_env_fab") ~= nil then
	basic_env_fab = true
end

if minetest.get_modpath("mtg_basic_env_cook") ~= nil then
	basic_env_cook = true
end

-- mtg_basic_env
local walls_to_reg ={
		{"mtg_basic_env:stone"},
		{"mtg_basic_env:cobble"},
		{"mtg_basic_env:cobble_mossy"},
		{"mtg_basic_env:stone_desert"},
		{"mtg_basic_env:cobble_desert"},
		{"mtg_basic_env:sandstone"},
		{"mtg_basic_env:sandstone_desert"},
		{"mtg_basic_env:sandstone_silver"},
		{"mtg_basic_env:obsidian"},
		{"mtg_basic_env:ice"},
		{"mtg_basic_env:snow_block"}
}

if basic_env_fab == true then
		table.insert(walls_to_reg,{"mtg_basic_env_fab:stone_brick"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:stone_block"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:stone_desert_brick"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:stone_desert_block"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:sandstone_brick"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:sandstone_block"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:sandstone_desert_brick"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:sandstone_desert_block"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:sandstone_silver_brick"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:sandstone_silver_block"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:obsidian_brick"})
		table.insert(walls_to_reg,{"mtg_basic_env_fab:obsidian_block"})
end

if basic_env_cook == true then
		table.insert(walls_to_reg,{"mtg_basic_env_cook:brick_block"})
		
end
		
for _,def in pairs(walls_to_reg) do
	-- check for alias
	local base_node = minetest.registered_aliases[def[1]] or def[1]

	-- get all registered settings for base node
	local base_node_def = minetest.registered_nodes[base_node]

	-- Split old reg name around : eg som[1] = "default" som[2] = "cobble"
	local split_old_mat = string.split(def[1], ":")
	local old_mat_name = split_old_mat[2]

	-- Split new reg name around : eg snm[1] = "mtg_basic_env" snm[1] = "cobble"
	local split_new_mat = string.split(tostring(base_node), ":")
	local new_mat_name = split_new_mat[2]

	-- remove "S()" from base node description
	local clean_des = string.match(tostring(base_node_def.description),'%)(.-)%c')

walls.register(
				"walls:"..new_mat_name,
				S(clean_des.." Wall"),
				base_node_def.tiles,
				base_node,
				base_node_def.groups,
				base_node_def.sounds
			)
	-- minetest.debug(clean_des.." Wall") -- uncomment if you need to create a list
	-- Set alias if old_name ~= new_name
	if old_mat_name ~= new_mat_name then
		minetest.register_alias("walls:"..old_mat_name,"walls:"..new_mat_name)
	end
end

--[[ current local file output for the above list
S(Stone Wall)
S(Cobblestone Wall)
S(Mossy Cobblestone Wall)
S(Stone Brick Wall)
S(Stone Block Wall)
S(Desert Stone Wall)
S(Desert Cobblestone Wall)
S(Desert Stone Brick Wall)
S(Desert Stone Block Wall)
S(Sandstone Wall)
S(Sandstone Brick Wall)
S(Sandstone Block Wall)
S(Desert Sandstone Wall)
S(Desert Sandstone Brick Wall)
S(Desert Sandstone Block Wall)
S(Silver Sandstone Wall)
S(Silver Sandstone Brick Wall)
S(Silver Sandstone Block Wall)
S(Obsidian Wall)
S(Obsidian Brick Wall)
S(Obsidian Block Wall)
S(Brick Block Wall)
S(Ice Wall)
S(Snow Block Wall)

--]]
