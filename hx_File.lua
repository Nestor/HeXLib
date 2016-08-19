
FIND_FILE 	= 1
FIND_DIR 	= 2
FIND_SKIP	= true
FIND_KEEP	= true

function file.FindAll(Base, PATH, Refine)
	if not Refine then Refine = function() end end
	local RawBase = Base
	local All = {}
	
	local function SearchNext(Base, PATH)
		local Files,Dirs = file.Find(Base.."/*", PATH)
		
		//Files
		for k,v in pairs(Files) do
			local Base = Base.."/"..v
			
			local Refine,NewBase = Refine(FIND_FILE, v,Base,RawBase)
			if not Refine or (Refine and NewBase) then
			--if Refine and not Refine(FIND_FILE, v,Base) then
				table.insert(All, NewBase and NewBase or Base)
			end
		end
		
		//Dirs
		for k,v in pairs(Dirs) do
			local Base = Base.."/"..v
			
			if Refine(FIND_DIR, v,Base) then
				continue
			end
			
			SearchNext(Base, PATH)
		end
	end
	SearchNext(Base, PATH)
	
	return All
end




/*
---Example

local Dirs = {
	"materials",
	"models",
	"particles",
	"resource",
	"sound",
}

for k,Root in pairs(Dirs) do
	//Refine search
	local function Refine(Flag, v,Base)
		//Skip new folder
		if Flag == FIND_DIR and v == "New Folder" then
			return FIND_SKIP
			
		//Snip addons/ etc
		elseif Flag == FIND_FILE then
			Base = Base:gsub("addons/PHX/", "")
			
			return FIND_KEEP, Base
		end
	end
	
	//Add
	local Tab = file.FindAll("addons/PHX/"..Root, "MOD", Refine)
	for k,v in pairs(Tab) do
		resource.AddSingleFile(v)
	end
end



--[[

local function AddDirectory(Base, What, PATH)
	local Files,Dirs = file.Find(Base.."/*", "MOD")
	
	//Files
	for k,v in pairs(Files) do
		print(Base.."/"..v)
	end
	
	//Dirs
	for k,v in pairs(Dirs) do
		local Here = Base.."/"..v
		
		AddDirectory(Here)
	end
end
]]

*/









