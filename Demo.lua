local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name

local Games = {
	3956818381;
	137877687;
	155615604;
}

if game.PlaceId == Games[1] then
	getgenv().Autoclick = false

	name = "Unsploit - Ninja Legends"
	local version = {major = 0; minor = 1; subminor = 12; build = 27;}
	
	Unsploit.Notification.Notify("Unsploit Game Detection", "Unsploit has detected " .. game.Name .. "! Loading UI", "rbxassetid://4914902889")
	
	local variables = {}
	local tabs = {}
	local functions = {
		General = {};
		Autofarm = {};
		Settings = {};
	}
	local connections = {}
	
	local Window = Unsploit.new(name, "Dark")

	tabs.General = Window:AddTab("General")
	tabs.Autofarm = Window:AddTab("Autofarm")
	tabs.Settings = Window:AddTab("Settings")
	tabs.Credits = Window:AddTab("Credits")
	tabs.GameVersion = Window:AddLabel(string.format("Game Version: v%s",  game.PlaceVersion))
	tabs.MenuVersion = Window:AddLabel(string.format("Menu Version: v%s.%s.%s", version.major, version.minor, version.subminor))

	tabs.General:AddSlider("Walkspeed", function(value)
		variables.walkspeed = value
	end, {
		min = 16;
		max = 24;
	})

	tabs.Autofarm:AddToggle("Autoclick", function(state)
		getgenv().Autoclick = state
		functions.Autofarm._autoClick();
	end)

	tabs.Settings:AddButton("Unload Unsploit!", function()
		 if game:GetService("CoreGui"):FindFirstChild(name) then
			game:GetService("CoreGui"):FindFirstChild(name):Destroy()
		 end
	end)

	local devTitle = tabs.Credits:AddLabel("Developers")
	local dev1 = tabs.Credits:AddLabel("UI Library - Unsploit")
	local dev2 = tabs.Credits:AddLabel("Unsploit Hub - IHoldOnI & Unsploit")
	local trademrk = tabs.Credits:AddLabel("Copyright(c) 2021 Unsploit Softwares.")

	devTitle.BackgroundTransparency = 0;
	devTitle.BackgroundColor3 = Unsploit.chosenTheme.Button

	dev1.BackgroundTransparency = 0;
	dev1.BackgroundColor3 = Unsploit.chosenTheme.Button

	dev2.BackgroundTransparency = 0;
	dev2.BackgroundColor3 = Unsploit.chosenTheme.Button

	dev2.BackgroundTransparency = 0;
	dev2.BackgroundColor3 = Unsploit.chosenTheme.Button

	trademrk.BackgroundTransparency = 0;
	trademrk.BackgroundColor3 = Unsploit.chosenTheme.Button


	functions.Autofarm._autoClick = function()
		while getgenv().Autoclick == true do
			wait(0.1)
			local A_1 = "swingKatana"
			local Event = game:GetService("Players").LocalPlayer.ninjaEvent
			Event:FireServer(A_1)
		end
	end

	game:GetService("RunService").RenderStepped:Connect(function()
		if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed == 0 then
				game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = variables.walkspeed;
			end
		end
	end)

	connections.guiQuitConnection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
		if child.Name == name then
			if (connections.guiQuitConnection) then
				getgenv().Autoclick = false;

				Unsploit.Notification.Notify ("Unsploit", "Unsploit disconnected!", "")
				variables.walkspeed = 16;
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

	tabs.General:AddSlider("Walkspeed", function(val)
		local player = game:GetService("Players").LocalPlayer
		local character = player.Character
		local human = character:WaitForChild("Humanoid")

		variables.walkspeed = val
	end, {
		min = 16;
		max = 90;
	})

	connections.renderStepped = game:GetService("RunService").RenderStepped:Connect(function()
		if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed == 0 then
				game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = variables.walkspeed;
			end
		end
	end)

	connections.UnsploitExitConnection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
		if child.Name == name then
			if (connections.UnsploitExitConnection) then
				
				variables.walkspeed = 16;
				variables.jumppower = 50;
				
				connections.renderStepped:Disconnect();
				connections.UnsploitExitConnection:Disconnect()
			end
		end
	end)
else
	Unsploit.Notification.Notify("Unsploit Game Detection", "Unsploit could not identify " .. game.Name .. " in database.", "rbxassetid://5107154082")
end