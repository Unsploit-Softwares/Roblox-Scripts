_G.AutoClick = false


local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "web.roblox.com"
local version = {major = 0; minor = 1; subminor = 12; build = 27;}

local Window = Unsploit.new(name, "Dark")

local tabs = {}
local functions = {}
local connections = {}

functions.General = {}
functions.Autofarm = {}
functions.Settings = {}

tabs.General = Window:AddTab("General")
tabs.Autofarm = Window:AddTab("Autofarm")
tabs.Settings = Window:AddTab("Settings")

tabs.Autofarm:AddToggle("Autoclick", function(state)
	_G.AutoClick = state
end, false)

tabs.Settings:AddLabel("Developers")
tabs.Settings:AddLabel("UI Library - Unsploit")
tabs.Settings:AddLabel("Unsploit Hub - IHoldOnI & Unsploit")
tabs.Settings:AddLabel("Copyright(c) 2021 Unsploit Softwares.")


functions.Autofarm._autoClick = function()
	while _G.AutoClick do
		local A_1 = "swingKatana"
		local Event = game:GetService("Players").LocalPlayer.ninjaEvent
		Event:FireServer(A_1)
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	if _G.AutoClick == true then
		Unsploit.Notification.Notify("Autoclick Engaged", "Autoclick has started!")
	else
		Unsploit.Notification.Notify("Autoclick Disengaged", "Autoclick has stopped!")
	end
end)