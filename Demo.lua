getgenv().Autoclick = false


local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "web.roblox.com"
local version = {major = 0; minor = 1; subminor = 12; build = 27;}

local Window = Unsploit.new(name, "Dark")

local tabs = {}
local functions = {
	General = {};
	Autofarm = {};
	Settings = {};
}
local connections = {}

tabs.General = Window:AddTab("General")
tabs.Autofarm = Window:AddTab("Autofarm")
tabs.Settings = Window:AddTab("Settings")

tabs.Autofarm:AddToggle("Autoclick", function(state)
	getgenv().Autoclick = state
	functions.Autofarm._autoClick();

	Unsploit.Notification.Notify(state and "Autoclick Engaged" or "Autoclick Disengaged", state and "Autoclick has started!" or "Autoclick has stopped!", "")
end)

tabs.Settings:AddLabel("Developers")
tabs.Settings:AddLabel("UI Library - Unsploit")
tabs.Settings:AddLabel("Unsploit Hub - IHoldOnI & Unsploit")
tabs.Settings:AddLabel("Copyright(c) 2021 Unsploit Softwares.")


functions.Autofarm._autoClick = function()
	while getgenv().Autoclick == true do
		wait(0.1)
		local A_1 = "swingKatana"
		local Event = game:GetService("Players").LocalPlayer.ninjaEvent
		Event:FireServer(A_1)
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	
end)