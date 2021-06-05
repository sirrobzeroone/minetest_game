----------------------------------------------------
--   ___      _ _ _     _                 _       --
--  / __|_ __| (_) |_  | |   ___  __ __ _| |___   --
--  \__ \ '_ \ | |  _| | |__/ _ \/ _/ _` | / -_)  --
--  |___/ .__/_|_|\__| |____\___/\__\__,_|_\___|  --
--     |_|                                        --
----------------------------------------------------
--              MTG Split Locale files            --
----------------------------------------------------
--[[
	A maintenance mod to split the default locale 
	files automatically into sub files for each of
	the new mods that made up default.
	
	Commented out as it dosen't need to run every load
	the locale translation files contained udner default
	need to be placed under a world folder inside a 
	"locale" folder. 
	
	Once the above is done un-comment the below and then
	simply load that world.

	Once loaded check under minetest >> worlds >> "worldname"
	and there will be a folder for each new mod containing the
	translation files that can be copied across to the mod locale
	folder. 
	
	Note I have added silver ore, lump, ingot, block at the end of
	the relevant mod extract files.	
--]]

--[[
-- setup mod global table 
mtg_z_split_locale = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- loads a table named "dval_to_nmod"
dofile(modpath .. "/i_default_val_to_new_mod_table.lua")

local dval_to_nmod = mtg_z_split_locale.dval_to_nmod

-- update this list if a new translation file is present.
local file_names = {
		"default.se.tr",
		"default.zh_CN.tr",
		"default.zh_TW.tr",
		"default.de.tr",
		"default.es.tr",
		"default.fr.tr",
		"default.id.tr",
		"default.it.tr",
		"default.ms.tr",
		"default.ru.tr"
}

local div_mod = {
		"chest",
		"torch",
		"furnace",
		"mtg_basic_env",
		"mtg_basic_env_fab",
		"mtg_basic_env_cook",
		"mtg_decor_simple",
		"mtg_decor_schema",
		"mtg_env_decor_fab",
		"mtg_tools"
}

-- Create folders to hold translation files for each mod
local path = minetest.get_worldpath()

for k,mod_n in pairs(div_mod) do
	minetest.mkdir(path.."/"..mod_n)
end

-- functions to open and read locale files 

	-- see if the file exists
	function file_exists(file)
	  local f = io.open(path.."/locale/"..file, "rb")
	  if f then f:close() end
	  return f ~= nil
	end

	-- get all lines from a file, returns an empty 
	-- list/table if the file does not exist
	function lines_from(file)
	  if not file_exists(file) then return {} end
	  lines = {}
	  for line in io.lines(path.."/locale/"..file) do 
		lines[#lines + 1] = line
	  end
	  return lines
	end

	-- write final output to files
	function makeFiles(folder_name, file_name, content)
		newFile = io.open(path.."/"..folder_name.."/"..file_name, "w+" )
		newFile:write(content)
		newFile:close()
	end

-- Sorts the default files into sub-tables for each mod for each language
-- translation. Also outputs each translation string in the order they 
-- are listed in "dval_to_nmod".
 
for _,file_name in pairs(file_names) do
	
	-- get content of 1st file
	local l_lines = lines_from(file_name)

	local output = {}
	output.chest = {}
	output.torch = {}
	output.furnace = {}
	output.mtg_basic_env = {}
	output.mtg_basic_env_fab = {}
	output.mtg_basic_env_cook = {}
	output.mtg_decor_simple = {}
	output.mtg_decor_schema = {}
	output.mtg_env_decor_fab = {}
	output.mtg_tools = {}
	
   -- loc_s = locale string eg Torch=Fackel
	for _,loc_s in pairs(l_lines) do 
	
		-- nm_name = new mod name eg "chest", loc_val = locale value to match eg "Torch"
		for nm_name,loc_val in pairs(dval_to_nmod) do
		
			-- remove translation from locale string by matching all before "=" 
			-- eg "Torch=Fackel" becomes "Torch"
			 local v_c = loc_s:match("(.+)=(.+)")
			 
				-- k table key we need this to sort output into same order as 
				-- dval_to_nmod, sort_loc the actual locale strings under 
				-- the new mod name.
				for k,sort_loc in pairs(loc_val) do
				   if v_c == sort_loc then

					   if nm_name == "chest" then
						  output.chest[k] = loc_s
						  
					   elseif nm_name == "torch" then
						   output.torch[k] = loc_s
						  
					   elseif nm_name == "furnace" then
						   output.furnace[k] = loc_s
						   
					   elseif nm_name == "mtg_basic_env" then
						   output.mtg_basic_env[k] = loc_s

					   elseif nm_name == "mtg_basic_env_fab" then
						   output.mtg_basic_env_fab[k] = loc_s

					   elseif nm_name == "mtg_basic_env_cook" then
						   output.mtg_basic_env_cook[k] = loc_s			   
					   
					   elseif nm_name == "mtg_decor_simple" then
						   output.mtg_decor_simple[k] = loc_s	

					   elseif nm_name == "mtg_decor_schema" then
						   output.mtg_decor_schema[k] = loc_s	
						   
					   elseif nm_name == "mtg_env_decor_fab" then
						   output.mtg_env_decor_fab[k] = loc_s	
						   
					   elseif nm_name == "mtg_tools" then
						   output.mtg_tools[k] = loc_s
						   
					   end
				   end
			end
		end
	end
	
	for _,name in pairs(div_mod)do
		local file = string.gsub(file_name,"default",name)
		local content = "# textdomain: "..name
		
		for k,v in pairs(output[name])do
			content  = content.."\n"..v 		
		end	
		
		if name == "mtg_basic_env" then
			content = content.."\n".."Silver Ore=".."\n".."Silver Lump="
		end
		
		if name == "mtg_basic_env_fab" then
			content = content.."\n".."Diamond Shard="
		end
		
		if name == "mtg_basic_env_cook" then
			content = content.."\n".."Silver Ingot=".."\n".."Silver Block="
		end
		
		makeFiles(name,file,content)
	end
	
	minetest.debug("File: "..file_name.." split for new mods successfully")
end
]]--