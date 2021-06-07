local Games = {
	3956818381;
	137877687;
	155615604;
}

local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "Unsploit - " .. game.Name
local Window = Unsploit.new(name, "Dark")

if game.PlaceId == Games[1] then
	getgenv().Autoclick = false

	local version = {major = 0; minor = 1; subminor = 12; build = 27;}

	local variables = {}
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
	tabs.GameVersion = Window:AddLabel("Game Version: v" .. game.PlaceVersion)
	tabs.MenuVersion = Window:AddLabel("Menu Version: v".. version)

	tabs.Autofarm:AddToggle("Autoclick", function(state)
		getgenv().Autoclick = state
		functions.Autofarm._autoClick();
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

	connections.guiQuitConnection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
		if child.Name == name then
			if (connections.guiQuitConnection) then
				getgenv().Autoclick = false;

				Unsploit.Notification.Notify ("Unsploit", "Unsploit disconnected!", "")
				connections.guiQuitConnection:Disconnect()
			end
		end
	end)
elseif game.PlaceId == Games[2] then
	local tabs = {}
	local variables = {}
	local functions = {
		General = {};
		Network = {};
		Setting = {};
	}
	local connections = {}
	
	tabs.General = Window:AddTab("General")
	tabs.Network = Window:AddTab("Network")
	tabs.Setting = Window:AddTab("Setting")
	tabs.Credits = Window:AddTab("Credits")

	tabs.General:AddToggle("Fast Run", function(state)
		local player = game:GetService("Players").LocalPlayer
		local character = player.Character
		local human = character:WaitForChild("Humanoid")

		variables.walkspeed = state and 16 or 50
	end)

	connections.renderStepped = game:GetService("RunService").RenderStepped:Connect(function()
		if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = 0 then
				game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = variables.walkspeed;
			end
		end
	end)

	connections.UnsploitExitConnection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
		if child.Name == name then
			if (connections.UnsploitExitConnection) then
				
				variables.walkspeed = 16;
				variables.jumppower = 50;
				
				Unsploit.Notification.Notify ("Unsploit", "Unsploit disconnected!", "")
				connections.renderStepped:Disconnect();
				connections.UnsploitExitConnection:Disconnect()
			end
		end
	end)
else
	Unsploit.Notification.Notify("Unsploit Game Detection", "Unsploit could not identify " .. game.Name .. " in database.", "rbxassetid://5107154082")
end