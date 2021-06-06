local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()
local name = "web.roblox.com"
local version = {major = 0; minor = 1; subminor = 12; build = 27;}

local Window = Unsploit.new(name, "Dark")

local tabs = {}
local pages = {}
local functions = {}
local connections = {}

tabs.General = Window:AddTab("General")
tabs.Settings = Window:AddTab("Settings")

tabs.Settings:AddLabel("Developers")
tabs.Settings:AddLabel("UI Library - Unsploit")
tabs.Settings:AddLabel("Unsploit Hub - IHoldOnI & Unsploit")
tabs.Settings:AddLabel("Copyright(c) 2021 Unsploit Softwares.")