-- MODULE SCRIPT --

local ram = {}
local nesPallets = require(script.Parent.nesColors)
local bgClr = nesPallets.getColor(38)
local pallets = {
	
}
local tileData = {
	
}
local noPalletErr = {
	nesPallets.getColor(1),
	nesPallets.getColor(3),
	nesPallets.getColor(5),
}
function ram.clearPallets ()
	table.clear(pallets)
end
function ram.getAllPallets ()
	return pallets
end
function ram.setPallet (newPallet,plalletInd)
	if pallets[plalletInd] then
		table.insert(pallets,plalletInd,newPallet)
	else
		table.insert(pallets,newPallet)
	end
end
function ram.RemovePalletAtIndx (indx)
	if pallets[indx] then
		table.remove(pallets,indx)
	end
end
function ram.fetchPallet (palletNumb)
	local foundPallet = pallets[palletNumb] or noPalletErr
	table.insert(foundPallet,bgClr)
	return foundPallet
end
function ram.setBgColor (palletNumb)
	if nesPallets.getColor(palletNumb) then
		bgClr = nesPallets.getColor(palletNumb)
	else
		bgClr = nesPallets.getColor(1)
	end
end
return ram
