----------------------------------------------------
--              _____           _                 --
--             |_   _|__ _ _ __| |_               --
--               | |/ _ \ '_/ _| ' \              --
--               |_|\___/_| \__|_||_|             --
----------------------------------------------------
--                    MTG Torch                   --
---------------------------------------------------- 
--                    Functions                   --
----------------------------------------------------

function torch.on_flood(pos, oldnode, newnode)
	minetest.add_item(pos, ItemStack("torch:torch 1"))
	-- Play flame-extinguish sound if liquid is not an 'igniter'
	local nodedef = minetest.registered_items[newnode.name]
	if not (nodedef and nodedef.groups and
			nodedef.groups.igniter and nodedef.groups.igniter > 0) then
		minetest.sound_play(
			"default_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = 0.1},
			true
		)
	end
	-- Remove the torch node
	return false
end
