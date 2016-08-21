--[[
	=== HeXLib, by HeX - Make it easy! ===
	
	A whole load of useful functions for GMod.
]]

HEX = {}



for k,v in pairs( file.Find("HeXLib/*.lua", "LUA") ) do
	include("HeXLib/"..v)
	MsgC( Color( 255, 99, 71 ), "[HeX", Color( 0, 191, 255 ), "Lib]", Color( 0, 255, 0 ), " Loaded: ", Color( 255, 0, 255 ), v.."\n" )
end

MsgC( Color( 255, 99, 71 ), "[HeX", Color( 0, 191, 255 ), "Lib]", Color( 0, 255, 0 ), " Load complete :)\n" )













