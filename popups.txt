-- MODULE SCRIPT -- (handles all types of popups)

local plrMouse -- creates variable for later
local event = script.Parent.selectionSelected
local popups = {}

function selectionPopup (v,hoverExplanations,explanationInst)
	if hoverExplanations then
		local explanation = hoverExplanations[v]
		if explanationInst:IsA("TextLabel") then
			explanationInst.Text = v .. ":        " .. explanation
		else
			warn("selection explanation list provided, but no frame to display selected info in!")
		end
	else
		explanationInst.Text = "no hover explanations"
	end
end
function popups.placeSelectionTabAtCursor(selectionList,popupName,headerFont,optFont,plr,hoverExplanations,explanationInst)
	if not selectionList then warn("[selectionList] is NIL!") return end
	if type(selectionList) ~= "table" then warn("[selectionList] is not the required instance: (table)") return end
	if plr:IsA("Player") then
		plrMouse = plr:GetMouse()
		local newPopup = script.selectionFrame:Clone()
		for i,v in ipairs(selectionList) do
			v = tostring(v)
			if type(v) == "string" then
				if string.find(v,"*",1) then -- if string has a * then its a header
					local newHead = script.header:Clone()
					v = v:gsub("*","")
					newHead.Parent = newPopup
					newHead.mainTxt.Text = v
				else -- if not its a norm selection
					local newSelection = script.selection:Clone()
					newSelection.Parent = newPopup
					newSelection.mainBtn.Text = v
					newSelection.mainBtn.MouseButton1Click:Connect(function()
						newPopup:Destroy()
						event:Fire(v)
					end)
					newSelection.mainBtn.SelectionGained:Connect(function()
						selectionPopup(v,hoverExplanations,explanationInst)
					end)
					newSelection.mainBtn.MouseEnter:Connect(function()
						selectionPopup(v,hoverExplanations,explanationInst)
					end)
				end
			end
		end
		newPopup.Position = UDim2.new(0,plrMouse.X,0,plrMouse.Y)
		newPopup.Name = popupName
		newPopup.Parent = game.Players.LocalPlayer.PlayerGui.alwaysVisUi
	end
end
return popups
