-- LOCAL SCRIPT --

local mainF = script.Parent
local RAM = require(game.ReplicatedStorage.RAM)
local charRAM = require(game.ReplicatedStorage.charROM)

local grayScaleIndex = {
	Color3.fromRGB(0, 0, 0),       -- 1
	Color3.fromRGB(68, 68, 68),    -- 2
	Color3.fromRGB(118, 118, 118), -- 3
	Color3.fromRGB(255, 255, 255)  -- 4 (background)
}
--[[
for _, v in ipairs(mainF:GetChildren()) do
		if v:IsA("Frame") then
			-- store original color ONCE
			if not v:GetAttribute("orgClr") then
				v:SetAttribute("orgClr", v.BackgroundColor3)
			end
			local originalColor = v:GetAttribute("orgClr")
			local index = table.find(grayScaleIndex,originalColor)
			if v.BackgroundColor3 == Color3.fromRGB(0, 0, 0) then
				v.BackgroundColor3 = fetchedPalet[1]
			elseif v.BackgroundColor3 == Color3.fromRGB(68, 68, 68) then
				v.BackgroundColor3 = fetchedPalet[2]
			elseif v.BackgroundColor3 == Color3.fromRGB(118, 118, 118) then
				v.BackgroundColor3 = fetchedPalet[3]
			elseif v.BackgroundColor3 == Color3.fromRGB(255, 255, 255) then
				v.BackgroundColor3 = fetchedPalet[4]
			end
		end
	end
]]
function changePallet(palletId)
	local fetchedPalet = RAM.fetchPallet(palletId)
	if not fetchedPalet then return end
	for i=0,63 do
		local v = mainF:FindFirstChild(tostring(i)) or nil
		if v:IsA("Frame") then
			v:SetAttribute("orgClr",v.BackgroundColor3)
			if v.BackgroundColor3 == Color3.fromRGB(0, 0, 0) then
				v.BackgroundColor3 = fetchedPalet[1]
			elseif v.BackgroundColor3 == Color3.fromRGB(68, 68, 68) then
				v.BackgroundColor3 = fetchedPalet[2]
			elseif v.BackgroundColor3 == Color3.fromRGB(118, 118, 118) then
				v.BackgroundColor3 = fetchedPalet[3]
			elseif v.BackgroundColor3 == Color3.fromRGB(255, 255, 255) then
				v.BackgroundColor3 = fetchedPalet[4]
			end
		else
			warn("Pixel number: "..i.." doesnt appear to exist")
		end
	end
end
function changeTileImg (imgId)
	local tileDt = charRAM.getSpecificBgTileByIndx(imgId)
	local pxIndex = 0
	if tileDt then
		--[[
		for i=0,63 do
			local v = mainF:FindFirstChild(tostring(i)) or nil
			if v:IsA("Frame") then
				if tileDt[i] then
					v.BackgroundColor3 = grayScaleIndex[tileDt[i] + 1]
				end
			end
		end
		]]
		for i,v in mainF:GetChildren() do -- responsible for changing the tile img
			if v:IsA("Frame") then
				local foundClr = grayScaleIndex[tonumber(v.Name)]
				if foundClr then
					v.BackgroundColor3 = grayScaleIndex[tileDt[i-1]] or Color3.new(0,0,0)
				end
			end
		end
	end
end
mainF.AttributeChanged:Connect(function(att)
	if att == "pallet" then
		--tonumber(mainF:GetAttribute("pallet"))
		changePallet(tonumber(mainF:GetAttribute("pallet")))
	elseif att == "ramTileIndx" then
		--tonumber(mainF:GetAttribute("ramTileIndx")) or
		changeTileImg(tonumber(mainF:GetAttribute("ramTileIndx")) or 1)
	end
end)
