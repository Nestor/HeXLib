--[[
	=== HeXLib, by HeX - Make it easy! ===
	
	A whole load of useful functions for GMod.
]]

HEX = {}



for k,v in pairs( file.Find("HeXLib/*.lua", "LUA") ) do
	include("HeXLib/"..v)
	print("[HeXLib] Loaded: "..v)
end















