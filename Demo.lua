local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "web.roblox.com"
local version = {major = 0; minor = 1; subminor = 12; build = 27;}

local Window = Unsploit.new(name, "Light")

local tab1 = Window:AddTab("Tab 1")
local tab2 = Window:AddTab("Tab 2")
local tab3 = Window:AddTab("Tab 3")
local menuVersion = Window:AddLabel(string.format("Version: v%s.%s.%s", version.major, version.minor, version.subminor))
local menuBuildIndex = Window:AddLabel(string.format("Menu Build: %s", version.build))

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


if game:GetService("CoreGui"):FindFirstChild(name) then
	game:GetService("CoreGui"):FindFirstChild(name):Destroy()
end