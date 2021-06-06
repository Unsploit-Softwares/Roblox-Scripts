local Unsploit = loadstring(game:HttpGet("https://www.roblox.com/"))()

local window = Unsploit.new("web.roblox.com", "Unsploit")

local tab1 = window:AddTab("Tab 1")
local tab2 = window:AddTab("Tab 2")
local tab3 = window:AddTab("Tab 3")
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
