local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "web.roblox.com"

local Window = Unsploit.new(name, "Light")

local tab1 = Window:AddTab("Tab 1")
local tab2 = Window:AddTab("Tab 2")
local tab3 = Window:AddTab("Tab 3")
local gId = Window:AddLabel("Version: v0.1.2")

tab1:AddLabel("HELP")
tab1:AddButton("Me", function()
	print("Tab 1")
end)

tab2:AddLabel("PLEASE")
tab2:AddButton("HELP", function()
	print("Tab 2")
end)

tab3:AddLabel("I beg you")
tab3:AddButton("Just help me please.", function()
	print("Tab 3")
end)

for _,v in next, game:GetService("CoreGui"):GetChildren() do
	if v:IsA("ScreenGui") and v.Name == name then
		v:Destroy()
	end
end
