----------------------------------------------------
--              ___ _            _                --
--             / __(_)_ __  _ __| |___            --
--             \__ \ | '  \| '_ \ / -_)           --
--             |___/_|_|_|_| .__/_\___|           --
--   ___                 |_|  _   _               --
--  |   \ ___ __ ___ _ _ __ _| |_(_)___ _ _  ___  --
--  | |) / -_) _/ _ \ '_/ _` |  _| / _ \ ' \(_-<  --
--  |___/\___\__\___/_| \__,_|\__|_\___/_||_/__/  --
----------------------------------------------------
--            MTG Decorations Simple              --
----------------------------------------------------
--                  Functions                     --
----------------------------------------------------

-- place Coral Function
function mtg_decor_simple.coral_on_place(itemstack, placer, pointed_thing)
	local water_source =  minetest.registered_aliases["lib_basic_env:water_source"] or "lib_basic_env:water_source"
	
	if pointed_thing.type ~= "node" or not placer then
		return itemstack
	end

	local player_name = placer:get_player_name()
	local pos_under = pointed_thing.under
	local pos_above = pointed_thing.above
	local node_under = minetest.get_node(pos_under)
	local def_under = minetest.registered_nodes[node_under.name]

	if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
		return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointed_thing) or itemstack
	end

	if node_under.name ~= "mtg_decor_simple:coral_skeleton" or
			minetest.get_node(pos_above).name ~= water_source then
		return itemstack
	end

	if minetest.is_protected(pos_under, player_name) or
			minetest.is_protected(pos_above, player_name) then
		minetest.log("action", player_name
			.. " tried to place " .. itemstack:get_name()
			.. " at protected position "
			.. minetest.pos_to_string(pos_under))
		minetest.record_protection_violation(pos_under, player_name)
		return itemstack
	end

	node_under.name = itemstack:get_name()
	minetest.set_node(pos_under, node_under)
	if not minetest.is_creative_enabled(player_name) then
		itemstack:take_item()
	end

	return itemstack
end