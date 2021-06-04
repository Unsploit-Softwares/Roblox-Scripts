--local Modules = require(loadstring(game:HttpGet("https://raw.githubcontent.com/Library._instance/RobloxScripts/Modules/init.lua")))

-- NAME: Library._instance UI Library
-- AUTHOR: Library._instance Softwares
-- DATE: June 2nd 2021 -- REWRITE #3

--[[

    Library
		Constructors: 
			Library.new(name: string) -- > Creates a new UI Window
		
		Functions:
			-- Tabs
			TabLibrary:AddTab(name: string) --> Creates a new tab window
			TabLibrary:AddLabel(text: string) --> Creates a new tab window
			
			-- Options
			Options:AddButton(text: string, callback: function) --> Creates a new button and callback
			Options:AddLabel(text: string) --> Creates a new label
			Options:AddToggle(text: string, callback: function) --> Creates a new Toggle
			Options:AddDropdown(text: string) --> Creates a new Dropdown
			Options:AddSlider(text: string, min: number, default: number, max: number, callback: function) --> Creates a new Slider
		
		Methods: 
			Library:Destroy() --> Destroys the UI Object

    Utility
        Methods:
            (DISABLED) Utility:GenerateName(length: number) --> Generates a random string character
            (DISABLED) Utility:Create(class: string, properties: table) --> Creates a new instance class with properties
]]

local themes = {}

local Library = {}
local Utility = {
    CharSets = {};
	--LoadModule = function(moduleName: string)
	--	Modules:Load(moduleName)
	--end
	Pages = {}
}
local Functions = {}

function Library.new(name)
	-- Core Stuff
	Library._instance = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local titleLabel = Instance.new("TextLabel")
	local exitBtn = Instance.new("TextButton")
	local TabContainer = Instance.new("Frame")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")
	local PageContainer = Instance.new("Folder")

	Library._instance.Name = Utility:GenerateName(1000, 30000)
	Library._instance.Parent = game:GetService("CoreGui")
	Library._instance.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = Library._instance
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 300)

	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0, 0, 0, -19)
	TopBar.Size = UDim2.new(1, 0, 0.0649999976, 0)

	titleLabel.Name = "titleLabel"
	titleLabel.Parent = TopBar
	titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.BackgroundTransparency = 1.000
	titleLabel.BorderSizePixel = 0
	titleLabel.Position = UDim2.new(0.00800000038, 0, 0, 0)
	titleLabel.Size = UDim2.new(0.912, 0, 1, 0)
	titleLabel.Font = Enum.Font.SourceSans
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 14.000
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Text = name

	exitBtn.Name = "exitBtn"
	exitBtn.Parent = TopBar
	exitBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	exitBtn.BorderSizePixel = 0
	exitBtn.Position = UDim2.new(0.920000017, 0, 0, 0)
	exitBtn.Size = UDim2.new(0.0799999982, 0, 1, 0)
	exitBtn.Font = Enum.Font.SourceSans
	exitBtn.Text = "X"
	exitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	exitBtn.TextSize = 14.000

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = Main
	TabContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer.BorderSizePixel = 0
	TabContainer.LayoutOrder = 1
	TabContainer.Size = UDim2.new(0, 124, 0, 300)

	UIPadding.Parent = TabContainer
	UIPadding.PaddingBottom = UDim.new(0, 5)
	UIPadding.PaddingLeft = UDim.new(0, 10)
	UIPadding.PaddingTop = UDim.new(0, 3)

	UIListLayout.Parent = TabContainer
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0.0135000004, 0)

	PageContainer.Name = "PageContainer"
	PageContainer.Parent = Main

	Functions:ExitUI()
	exitBtn.MouseButton1Click:Connect(function()
		if (Library._instance) then
			Library._instance:Destroy()
		end
	end)

	local TabLibrary = {}
	-- Tab Stuff
	function TabLibrary:AddTab(text)
		-- Tabs Stuff
		local TabBtn = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")

		TabBtn.Name = "TabBtn"
		TabBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		TabBtn.Size = UDim2.new(0.899999976, 0, 0.100000001, 0)
		TabBtn.Font = Enum.Font.SourceSans
		TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabBtn.TextSize = 14.000
		TabBtn.Text = text or "Tab"
		TabBtn.Parent = TabContainer

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = TabBtn
		
		-- Pages Stuff
		local Container2 = Instance.new("ScrollingFrame")
		local UIGridLayout = Instance.new("UIGridLayout")
		local UIPadding_2 = Instance.new("UIPadding")

		Container2.Name = text
		Container2.Parent = PageContainer
		Container2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Container2.BackgroundTransparency = 1.000
		Container2.Position = UDim2.new(0, 127, 0, 5)
		Container2.Selectable = false
		Container2.Size = UDim2.new(0, 373, 0, 290)
		Container2.ScrollBarThickness = 0

		UIGridLayout.Parent = Container2
		UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout.CellSize = UDim2.new(1, 0, 0.0500000007, 0)

		UIPadding_2.Parent = Container2
		UIPadding_2.PaddingBottom = UDim.new(0, 5)
		UIPadding_2.PaddingLeft = UDim.new(0, 3)
		UIPadding_2.PaddingRight = UDim.new(0, 6)
		UIPadding_2.PaddingTop = UDim.new(0, 5)
		
		table.insert(Utility.Pages, text)

		local Label = Instance.new("TextLabel")
		Label.Name = "Label"
		Label.Parent = Container2
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.Size = UDim2.new(0, 200, 0, 50)
		Label.Font = Enum.Font.SourceSans
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 14.000
		Label.Text = text
		
		for _,v in pairs(PageContainer:GetChildren()) do
			if v.Name == Utility.Pages[1] then
				v.Visible = true
				game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					BackgroundColor3 = Color3.fromRGB(255, 85, 60)
				}):Play()
			else
				v.Visible = false
				game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					BackgroundColor3 = Color3.fromRGB(100, 100, 100)
				}):Play()
			end
		end
		
		TabBtn.MouseButton1Click:Connect(function()
			for i,v in next, PageContainer:GetChildren() do
				if v.Name == text then
					v.Visible = true
				else
					v.Visible = false
				end
			end

			for i,v in next, TabContainer:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(100, 100, 100)
					}):Play()
				end
			end

			game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = Color3.fromRGB(255, 85, 60)
			}):Play()
		end)

		local Options = {}
		-- Buttons
		function Options:AddButton(text, callback)
			callback = callback or function () end

			local Button = Instance.new("TextButton")
			local UIPadding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")

			Button.Name = "Button"
			Button.Parent = Container2
			Button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.782999992, 0, 0.0599999987, 0)
			Button.Size = UDim2.new(0.200000003, 0, 0.899999976, 0)
			Button.Font = Enum.Font.SourceSans
			Button.Text = text or "Button"
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.TextXAlignment = Enum.TextXAlignment.Left
			Button.AutoButtonColor = false

			UIPadding.Parent = Button
			UIPadding.PaddingBottom = UDim.new(0, 5)
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingRight = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)

			UICorner.Parent = Button

			function OnFire()
				Functions:Execute(callback)
			end

			Button.MouseButton1Click:Connect(OnFire)
			return Button
		end

		function Options:AddLabel(text: string)
			local Label = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = Container2
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Size = UDim2.new(0, 200, 0, 50)
			Label.Font = Enum.Font.SourceSans
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 14.000
			Label.Text = text or "Label"
			return Label
		end
		return Options
	end

	function TabLibrary:AddLabel(text: string)
		local Label = Instance.new("TextLabel")

		Label.Name = "newLabel"
		Label.Parent = TabContainer
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.Size = UDim2.new(0.899999976, 0, 0.100000001, 0)
		Label.Font = Enum.Font.SourceSans
		Label.Text = text or "Label"
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 14.000
		return Label
	end
	return TabLibrary
end

function Library:Destroy()
	self._instance:Destroy()
end

function Utility:GenerateName(...)
	local a = {...}
	return math.random(a[1], a[2])
end

--[[ function Utility:Create(class: string, properties: table)
    local inst = Instance.new(class)
	
	for prop, value in pairs(properties) do
		if prop ~= "Parent" then
			inst[prop] = value
		end
		prop["Parent"] = inst
	end
	return inst
end ]]

function Functions:ExitUI(delete_all)
	delete_all = delete_all or true

	if delete_all then
		for _,v in pairs(UIFolder:GetChildren()) do
			if (Library._instance.Name ~= UIFolder:GetChildren(v.Name)) then
				v:Destroy();
			end
		end
	else
		Library._instance:Destroy()
	end
end

function Functions:Execute(callback)
	return pcall(callback)
end

return Library, Utility