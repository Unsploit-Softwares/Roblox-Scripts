getgenv().autoClick = false


local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "web.roblox.com"
local version = {major = 0; minor = 1; subminor = 12; build = 27;}

local Window = Unsploit.new(name, "Dark")

local tabs = {}
local functions = {}
local connections = {}

tabs.General = Window:AddTab("General")
tabs.Autofarm = Window:AddTab("Autofarm")
tabs.Settings = Window:AddTab("Settings")

tabs.Autofarm:AddButton("Swing Katana", function()
	local A_1 = "swingKatana"
	local Event = game:GetService("Players").LocalPlayer.ninjaEvent
	Event:FireServer(A_1)
end)

tabs.Settings:AddLabel("Developers")
tabs.Settings:AddLabel("UI Library - Unsploit")
tabs.Settings:AddLabel("Unsploit Hub - IHoldOnI & Unsploit")
tabs.Settings:AddLabel("Copyright(c) 2021 Unsploit Softwares.")


functions.Autofarm._autoClick = function()
	local A_1 = "swingKatana"
	local Event = game:GetService("Players").LocalPlayer.ninjaEvent
	Event:FireServer(A_1)
end