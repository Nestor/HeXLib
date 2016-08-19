--- === String === ---

function string.Random(len)
	local rnd = ""
	for i=1,( len or math.random(6,11) ) do
		local c = math.random(65,116)
		if c >= 91 and c <= 96 then
			c = c + 6
		end
		rnd = rnd..string.char(c)
	end
	return rnd
end



function ValidString(v)
	return isstring(v) and v != ""
end

function string.hFind(str,what)
	return str:find(what,nil,true)
end

function string.Check(str,check)
	return str:sub(1,#check) == check
end

function string.Count(str,count)
	return #str:Split(count) - 1
end

function string.InBase(str,base)
	return base:lower():find( str:lower() )
end

function string.ToBytes(str)
	return str:gsub("(.)", function(c)
		return Format("%02X%s", c:byte(), " "):Trim()
	end)
end

function string.Size(str)
	return math.Bytes( #str )
end

function string.CheckInTable(str,tab, use_k)
	for k,v in pairs(tab) do
		if str:Check( (use_k and k or v) ) then
			return true, k,v
		end
	end
	return false, false, false
end

function string.InTable(str,tab, use_k, lower)
	if not istable(tab) then
		debug.ErrorNoHalt("! Have a fuckup, string.InTable not a table!")
		return
	end
	for k,v in pairs(tab) do
		local This = use_k and k or v
		if str:find( lower and This:lower() or This, nil,true) then
			return true, k,v
		end
	end
	return false, false, false
end


function string.SID(str)
	return str:gsub(":", "_")
end

function string.Safe(str, newlines)
	str = tostring(str)
	str = str:Trim()
	str = str:gsub("[:/\\\"*%@?<>'#]", "_")
	str = str:gsub("[]([)]", "")
	
	if not newlines then
		str = str:gsub("[\n\r]", "")
	end
	
	str = str:Trim()
	return str
end

function string.EatNewlines(str, also_spaces)
	str = str:gsub("\n", " ")
	str = str:gsub("\r", "")
	str = str:gsub("\t", " ")
	
	if also_spaces then
		str = str:gsub("  ", " ")
		str = str:gsub("  ", " ")
		str = str:gsub("  ", " ")
	end
	return str
end

function string.NoQuotes(str)
	str = str:Trim()
	if str:Check('"') then
		str = str:sub(2)
	end
	
	if str:EndsWith('"') then
		str = str:sub(0,-2)
	end
	return str
end


local GoodBytes = {
	[32] = " ",
	--[35] = "#",
	[45] = "-",
	[46] = ".",
	[47] = "/",
	[95] = "_",
}
function string.VerySafe(str, tab)
	local out = ""
	local Tab = tab or GoodBytes
	
	for i=1, #str do
		local Byte = str:byte(i)
		
		if Tab[ Byte ] or (Byte >= 48 and Byte <= 57) or (Byte >= 65 and Byte <= 90) or (Byte >= 97 and Byte <= 122) then
			out = out..str:sub(i,i)
		end
	end
	
	return out
end


























