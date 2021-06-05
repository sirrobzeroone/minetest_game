-- Loot from the mtg_* mods is registered here,
-- with the rest being registered in the respective mods

-- check for loaded mods

local mtg_basic_env_cook = false
local mtg_decor_schema = false
local mtg_tools = false
local mtg_basic_env_fab = false
local mtg_basic_env = false

if minetest.get_modpath("mtg_basic_env") ~= nil then
	mtg_basic_env = true
end

if minetest.get_modpath("mtg_basic_env_fab") ~= nil then
	mtg_basic_env_fab = true
end

if minetest.get_modpath("mtg_basic_env_cook") ~= nil then
	mtg_basic_env_cook = true
end

if minetest.get_modpath("mtg_decor_schema") ~= nil then
	mtg_decor_schema = true
end

if minetest.get_modpath("mtg_tools") ~= nil then
	mtg_tools = true
end

if mtg_basic_env == true then
	-- Aliases check
	local flint = minetest.registered_aliases["mtg_basic_env:flint"] or "mtg_basic_env:flint"
	local coal_lump = minetest.registered_aliases["mtg_basic_env:coal_lump"] or "mtg_basic_env:coal_lump"
	local mese_crystal = minetest.registered_aliases["mtg_basic_env:mese_crystal"] or "mtg_basic_env:mese_crystal"
	local sand = minetest.registered_aliases["mtg_basic_env:sand"] or "mtg_basic_env:sand"
	local sand_desert = minetest.registered_aliases["mtg_basic_env:sand_desert"] or "mtg_basic_env:sand_desert"
	local cobble_desert = minetest.registered_aliases["mtg_basic_env:cobble_desert"] or "mtg_basic_env:cobble_desert"
	local snow = minetest.registered_aliases["mtg_basic_env:snow"] or "mtg_basic_env:snow"
	local dirt = minetest.registered_aliases["mtg_basic_env:dirt"] or "mtg_basic_env:dirt"
	local obsidian = minetest.registered_aliases["mtg_basic_env:obsidian"] or "mtg_basic_env:obsidian"
	
	table.insert(dungeon_loot.registered_loot,{name = flint, chance = 0.4, count = {1, 3}})
	table.insert(dungeon_loot.registered_loot,{name = coal_lump, chance = 0.9, count = {1, 12}})
	table.insert(dungeon_loot.registered_loot,{name = mese_crystal, chance = 0.1, count = {2, 3}})
	table.insert(dungeon_loot.registered_loot,{name = sand, chance = 0.8, count = {4, 32}, y = {-64, 32768}, types = {"normal"}})
	table.insert(dungeon_loot.registered_loot,{name = sand_desert, chance = 0.8, count = {4, 32}, y = {-64, 32768},types = {"sandstone_desert"}})
	table.insert(dungeon_loot.registered_loot,{name = cobble_desert, chance = 0.8, count = {4, 32},types = {"desert"}})
	table.insert(dungeon_loot.registered_loot,{name = snow, chance = 0.8, count = {8, 64}, y = {-64, 32768},types = {"icesheet"}})
	table.insert(dungeon_loot.registered_loot,{name = dirt, chance = 0.6, count = {2, 16}, y = {-64, 32768},types = {"normal", "sandstone_desert", "desert"}})
	table.insert(dungeon_loot.registered_loot,{name = obsidian, chance = 0.25, count = {1, 3}, y = {-32768, -512}})
	
end

if mtg_basic_env_fab == true then
	--Aliases Check
	local mese = minetest.registered_aliases["mtg_basic_env_fab:mese"] or "mtg_basic_env_fab:mese"
	
	--Add to loot table
	table.insert(dungeon_loot.registered_loot,{name = mese, chance = 0.15, y = {-32768, -512}})
	
end

if mtg_basic_env_cook == true then

	local gold_ingot = minetest.registered_aliases["mtg_basic_env_cook:gold_ingot"] or "mtg_basic_env_cook:gold_ingot"
	local steel_ingot = minetest.registered_aliases["mtg_basic_env_cook:steel_ingot"] or "mtg_basic_env_cook:steel_ingot"
	
	--Add to loot table
	table.insert(dungeon_loot.registered_loot,{name = gold_ingot, chance = 0.5})
	table.insert(dungeon_loot.registered_loot,{name = steel_ingot, chance = 0.4, count = {1, 6}})
	
end

if mtg_decor_schema == true then
	--Aliases Check
	local apple = minetest.registered_aliases["mtg_decor_schema:apple_tree_apple"] or "mtg_decor_schema:apple_tree_apple"
	local cactus = minetest.registered_aliases["mtg_decor_schema:cactus"] or "mtg_decor_schema:cactus"
	local stick = minetest.registered_aliases["mtg_decor_schema:stick"] or "mtg_decor_schema:stick"
	
	--Add to loot table
	table.insert(dungeon_loot.registered_loot,{name = stick, chance = 0.6, count = {3, 6}})
	table.insert(dungeon_loot.registered_loot,{name = apple, chance = 0.4, count = {1, 4}})
	table.insert(dungeon_loot.registered_loot,{name = cactus, chance = 0.4, count = {1, 4},types = {"sandstone_desert", "desert"}})
end

if mtg_tools == true then
	--Aliases Check
	local sword_wood = minetest.registered_aliases["mtg_tools:sword_wood"] or "mtg_tools:sword_wood"
	local pick_stone = minetest.registered_aliases["mtg_tools:pick_stone"] or "mtg_tools:pick_stone"
	local axe_diamond = minetest.registered_aliases["mtg_toolsaxe_diamond"] or "mtg_tools:axe_diamond"

	--Add to loot table
	table.insert(dungeon_loot.registered_loot,{name = sword_wood, chance = 0.6})
	table.insert(dungeon_loot.registered_loot,{name = pick_stone, chance = 0.3})
	table.insert(dungeon_loot.registered_loot,{name = axe_diamond, chance = 0.05})
end

function dungeon_loot.register(t)
	if t.name ~= nil then
		t = {t} -- single entry
	end
	for _, loot in ipairs(t) do
		table.insert(dungeon_loot.registered_loot, loot)
	end
end

function dungeon_loot._internal_get_loot(pos_y, dungeontype)
	-- filter by y pos and type
	local ret = {}
	for _, l in ipairs(dungeon_loot.registered_loot) do
		if l.y == nil or (pos_y >= l.y[1] and pos_y <= l.y[2]) then
			if l.types == nil or table.indexof(l.types, dungeontype) ~= -1 then
				table.insert(ret, l)
			end
		end
	end
	return ret
end
