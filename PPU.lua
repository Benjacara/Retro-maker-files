-- LOCAL SCRIPT --

local starterPos = UDim2.new(0,0,0,0)
local mainColors = require(game.ReplicatedStorage.nesColors)
local RAM = require(game.ReplicatedStorage.RAM)
local charROM = require(game.ReplicatedStorage.charROM)
local screenInitializedEvent = script.Parent.screenInitialized
--  0,0,0,0,0,0,0,0 (this line if for easier positioning)

local bgColor = mainColors.getColor(52)
local colorPallet = {
	mainColors.getColor(1), -- dark gray
	mainColors.getColor(31), -- green
	mainColors.getColor(21) -- peach (color)
}
local renderStartEvent = game.ReplicatedStorage.renderScreenSend
game.ReplicatedStorage.renderedPictures.ChildAdded:Connect(function(inst) -- generates the screen
	if inst:IsA("Folder") then
		if inst.Name == game.Players.LocalPlayer.Name then
			--[[
			inst.Parent = script.Parent.mainScreen
			task.wait(1)
			for i,v in inst:GetChildren() do
				local newUpdt = script.palletUpd:Clone()
				newUpdt.Parent = v
			end
			inst.Name = "screen"
			screenInitializedEvent:Fire()
			]]
			inst.Parent = script.Parent.mainScreen
			inst.Name = "screen"
			task.wait(3)
			screenInitializedEvent:Fire()
			script.Parent.editorScreen.tileDrawArea.Visible = false
			script.Parent.editorScreen.Enabled = true
		end
	end
end)
renderStartEvent:FireServer()

-- main logic behind screen

local pallets = { -- each index represents 16 pixels of the screen
	mainColors,mainColors,mainColors,mainColors
}
function changeScreenData ()
	local screen = script.Parent.mainScreen:FindFirstChild("screen")
	for i,v in screen:GetChildren() do
		if v:IsA("Frame") then
			v:SetAttribute("ramTileIndx",1)
			v:SetAttribute("pallet",1)
		end
	end
	--[[
	local tileIndx = #screen:GetChildren() - 31 * 3
	for i=1, 31 do
		screen["tile" .. tostring(tileIndx)]:SetAttribute("ramTileIndx",1)
		screen["tile" .. tostring(tileIndx)]:SetAttribute("pallet",1)
		tileIndx += 1
	end
	for i=1, 31 * 2 do
		screen["tile" .. tostring(tileIndx)]:SetAttribute("ramTileIndx",4)
		screen["tile" .. tostring(tileIndx)]:SetAttribute("pallet",4)
		tileIndx += 1
	end
	]]
end
screenInitializedEvent.Event:Connect(function()
	local screen = script.Parent.mainScreen:FindFirstChild("screen")
	script.Parent.mainScreen.bgFrame.RunBtn.MouseButton1Click:Connect(function()
		local fetchTileData = charROM.getSpecificBgTileByIndx(1)
		changeScreenData()
	end)
end)
