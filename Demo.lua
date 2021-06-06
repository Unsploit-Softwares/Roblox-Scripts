local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "web.roblox.com"
local version = {major = 0; minor = 1; subminor = 12; build = 27;}

local Window = Unsploit.new(name, "Light")

local tabs = {}
local pages = {}
local functions = {}
local connections = {}

-- Format Tabs: tabs.NAME = ...
-- Format Pages: pages.NAME = ...
-- Format Functions: functions.Name/functions:FUNCTION_NAME()  ... end)

-- #region Tabs
tabs.General = Window:AddTab("General")
tabs.Players = Window:AddTab("Players")
tabs.Settings = Window:AddTab("Settings")
-- #endregion

-- #region Pages
--#region Home
tabs.General:AddButton("Test", function()
	print("Hello world")
end)

--#endregion
-- #endregion

--#region Functions
--#region Home

--#endregion
--#endregion

--#region Signals

--#endregion