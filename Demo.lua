local Unsploit = loadstring(game:HttpGet("https://www.roblox.com/"))()

local Window = Unsploit.new("Unsploit")
local t = Window:AddTab("Tab 1")
local s = Window:AddTab("Tab 2")
local u = Window:AddTab("Tab 3")
local v = Window:AddTab("Tab 4")

local gId = Window:AddLabel("Version: v0.1.2")

t:AddLabel("Unsploit UI Library::Tab_1")
t:AddButton("Button", function()
	print("Hello World")
end)

s:AddLabel("Unsploit UI Library::Tab_2")
s:AddButton("Button", function()
	print("Hello World")
end)

u:AddLabel("Unsploit UI Library::Tab_3")
u:AddButton("Button", function()
	print("Hello World")
end)

v:AddLabel("Unsploit UI Library::Tab_4")
v:AddButton("Button", function()
	print("Hello World")
end)
