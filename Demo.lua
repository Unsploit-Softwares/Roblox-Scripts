local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/development/Unsploit.lua"))()
local Console = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Unsploit/development/Modules/Console.lua"))()

local UnsploitConsole = Console.new(game:GetService("CoreGui"):FindFirstChild("A"))

local a = Unsploit.new("A", "Dark")

local b = a:AddTab("Testing")
b:AddLabel("Label")
b:AddButton("Button", function()
    print("Hello world!")
end)
b:AddToggle("Toggle", function(bool)
    print()
    UnsploitConsole:ToggleConsole(not bool)
end)
b:AddSlider("Slider", function(value)
    print(value)
    UnsploitConsole:WriteLine("Slider Value: " .. tostring(value))
end, {
    min = 100;
    max = math.random(1100, 10100)
})
b:AddDropdown("Dropdown", {"One", "Two", "Three"}, function(value)
    print(value)
    UnsploitConsole:WriteLine("Dropdown Value: " .. value)
end)
b:AddButton("Unload Unsploit", function()
    if game:GetService("CoreGui"):FindFirstChild("A") then
        game:GetService("CoreGui"):FindFirstChild("A"):Destroy()
        Console:Destroy()
    end
end)