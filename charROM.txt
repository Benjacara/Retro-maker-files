-- MODULE SCRIPT --

local charRom = {}
local bgTileTable = {
	--[[
	[999] = { -- blank tile
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
	},
	]]
}
local spriteTable = {
	
}
function charRom.addTileData(info) -- what i dont understand, because its printing but nothing gets added?
	print(info)
	table.insert(bgTileTable,info)
	
end
function charRom.getSpecificBgTileByIndx(indx)
	return bgTileTable[indx]
end
function charRom.getBgRomData()
	return bgTileTable
end
function charRom.getSpecificSpriteData()
	-- to be worked on!
end
function charRom.getSpriteRomData()
	-- to be worked on!
end
return charRom

