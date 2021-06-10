local Unsploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Unsploit.lua"))()

local Window = Unsploit.new("Unsploit::LT2", "Dark")

local t1 = Window:AddTab("Test 1")

t1:AddLabel("This is a label")
t1:AddButton("Button", function()
	print("Button")
end)
t1:AddSlider("Slider", function(value)
	print(value)
end, {
	min = 100;
	max = 10000;
})
t1:AddDropdown("DropdownTest", {"A", "B", "C"}, function()
	return
end)