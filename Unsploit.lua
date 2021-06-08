local Modules = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Modules/init.lua"))()
local Draggify = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Modules/Draggify.lua"))();

local RGB = Color3.fromRGB
local HSV = Color3.fromHSV
local Color = Color3.new
local toHSV = Color3.toHSV

-- NAME: Library._instance UI Library
-- AUTHOR: Library._instance Softwares
-- DATE: June 2nd 2021 -- REWRITE #3

--[[

    Library
		Constructors: 
			Library.new(name: string, theme: string) -- > Creates a new UI Window
		
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

		Themes:
			Default,
			Dark,
			Light,
			Unsploit

		Methods: 
			Library:Destroy() --> Destroys the UI Object

    Utility
        Methods:
            Utility:GenerateName(length: number) --> Generates a random string character
            (DISABLED) Utility:Create(class: string, properties: table) --> Creates a new instance class with properties
]]

local Library: Unsploit = {
	Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))();
	Draggify = function(Frame)
		dragToggle = nil
		dragSpeed = .25 -- You can edit this.
		dragInput = nil
		dragStart = nil
		dragPos = nil
		
		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
		end
		
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
					if (input.UserInputState == Enum.UserInputState.End) then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				dragInput = input
			end
		end)
		
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if (input == dragInput and dragToggle) then
				updateInput(input)
			end
		end)
	end;
	Version = {
		maj = 0,
		min = 1,
		submin = 12
	};
}

local Utility: Utility = {
    CharSets = {};
	--LoadModule = function(moduleName: string)
	--	Modules:Load(moduleName)
	--end
	Pages = {}
}
local Functions = {}

Library.Themes = {
	Default = {
		["Background"] = RGB(59, 59, 59),
		["Accent"] =  RGB(117, 117, 117),
		["Button"] = RGB(15, 15, 15),
		["ButtonActive"] = RGB(84, 84, 84),
		["TextColor"] = RGB(255, 255, 255)
	},
	Dark = {
		["Background"] = RGB(0, 0, 0),
		["Accent"] =  RGB(86, 86, 86),
		["Button"] = RGB(194, 57, 57),
		["ButtonActive"] = RGB(114, 33, 33),
		["TextColor"] = RGB(255, 255, 255)
	},
	Light = {
		["Background"] = RGB(0, 0, 0),
		["Accent"] =  RGB(86, 86, 86),
		["Button"] = RGB(127, 127, 127),
		["ButtonActive"] = RGB(),
		["TextColor"] = RGB(18, 18, 18)
	},
	Unsploit = {
		["Background"] = RGB(152, 44, 44),
		["Accent"] =  RGB(111, 0, 0),
		["Button"] = RGB(197, 62, 62),
		["ButtonActive"] = RGB(104, 34, 34),
		["TextColor"] = RGB(255, 255, 255)
	}
}

function Library.new(name, theme)
	theme = theme or "Default"
	Library.Title = name or "Unsploit"

	local chosenTheme

	if theme == "Default" then
		chosenTheme = Library.Themes.Default
	elseif theme == "Light" then
		chosenTheme = Library.Themes.Light
	elseif theme == "Dark" then
		chosenTheme = Library.Themes.Dark
	elseif theme == "Unsploit" then
		chosenTheme = Library.Themes.Unsploit
	end

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

	Library._instance.Name = name
	Library._instance.Parent = game:GetService("CoreGui")
	Library._instance.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = Library._instance
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = chosenTheme.Accent
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 300)

	Library.Draggify(Main)

	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.BackgroundColor3 = chosenTheme.Background
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
	TabContainer.BackgroundColor3 = chosenTheme.Background
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

	Functions.UnsploitExitConnection = exitBtn.MouseButton1Click:Connect(function()
		if (Library._instance) then
			Functions:ExitUI()
		end
	end)

	local TabLibrary = {}
	-- Tab Stuff
	function TabLibrary:AddTab(text)
		-- Tabs Stuff
		local TabBtn = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")

		TabBtn.Name = "TabBtn"
		TabBtn.BackgroundColor3 = chosenTheme.Button
		TabBtn.Size = UDim2.new(0.899999976, 0, 0.100000001, 0)
		TabBtn.Font = Enum.Font.SourceSans
		TabBtn.TextColor3 = chosenTheme.TextColor
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
		
		for _,v in pairs(PageContainer:GetChildren()) do
			if v.Name == Utility.Pages[1] then
				v.Visible = true
				game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					BackgroundColor3 = chosenTheme.Button
				}):Play()
			else
				v.Visible = false
				game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					BackgroundColor3 = chosenTheme.ButtonActive
				}):Play()
			end
		end
		
		Functions.TabBtnConnection = TabBtn.MouseButton1Click:Connect(function()
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
						BackgroundColor3 = chosenTheme.ButtonActive
					}):Play()
				end
			end

			game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = chosenTheme.Button
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
			Button.BackgroundColor3 = chosenTheme.Button
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.782999992, 0, 0.0599999987, 0)
			Button.Size = UDim2.new(0.200000003, 0, 0.899999976, 0)
			Button.Font = Enum.Font.SourceSans
			Button.Text = text or "Button"
			Button.TextColor3 = chosenTheme.TextColor
			Button.TextSize = 14.000
			Button.TextXAlignment = Enum.TextXAlignment.Left
			Button.AutoButtonColor = false

			UIPadding.Parent = Button
			UIPadding.PaddingBottom = UDim.new(0, 5)
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingRight = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)

			UICorner.Parent = Button

			Functions.ButtonOptionConnection = Button.MouseButton1Click:Connect(function()
				Functions:Execute(callback)
			end)
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
			Label.TextColor3 = chosenTheme.TextColor
			Label.TextSize = 14.000
			Label.Text = text or "Label"
			return Label
		end

		function Options:AddToggle(text: string, callback, default)
			local actions = {}
			local enabled = default or false
			text = text

			local Toggle = Instance.new("Frame")
			local Label = Instance.new("TextLabel")
			local ToggleFrame = Instance.new("Frame")
			local Bool = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")
			local ToggleBtn = Instance.new("TextButton")

			Toggle.Name = "Toggle"
			Toggle.Parent = Container2
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 100, 0, 100)

			Label.Name = "Label"
			Label.Parent = Toggle
			Label.BackgroundColor3 = chosenTheme.TextColor
			Label.BackgroundTransparency = 1.000
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0.76296705, 0, 1, 0)
			Label.Font = Enum.Font.SourceSans
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 14.000
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.Text = text

			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = Toggle
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
			ToggleFrame.Position = UDim2.new(0.779999971, 0, 0.0359999985, 0)
			ToggleFrame.Size = UDim2.new(0.165000007, 0, 0.850000024, 0)

			Bool.Name = "Bool"
			Bool.Parent = ToggleFrame
			Bool.BackgroundColor3 = chosenTheme.Button
			Bool.Size = UDim2.new(0.5, 0, 1, 0)

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = Bool

			UICorner_2.CornerRadius = UDim.new(0, 6)
			UICorner_2.Parent = ToggleFrame

			ToggleBtn.Name = "ToggleBtn"
			ToggleBtn.Parent = Toggle
			ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleBtn.BackgroundTransparency = 1.000
			ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
			ToggleBtn.Font = Enum.Font.SourceSans
			ToggleBtn.Text = ""
			ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleBtn.TextSize = 14.000

			local function Fire()
				enabled = not enabled
				Bool:TweenPosition(enabled and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0, 0, 0, 0), "In", "Linear", 0.1)
				pcall(callback, enabled)
			end

			Functions.ToggleBtnConnection = ToggleBtn.MouseButton1Click:Connect(Fire)
			
			function actions:Set(args)
				ool:TweenPosition(enabled and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0, 0, 0, 0), "In", "Linear", 0.1)
				pcall(callback, args)
			end
		end

		function Options:AddSlider(text: string, callback, options: table)
			text = text or "Slider"
			options.min = options.min or 0
			options.max = options.max or 100

			local callback = callback or function () end

			local mouse = game:GetService("Players").LocalPlayer:GetMouse ()
			local uis = game:GetService("UserInputService")
			local val;

			local Slider = Instance.new("Frame")
			local OptionText = Instance.new("TextLabel")
			local SliderFrame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local sliderImg = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local valueText = Instance.new("TextLabel")

			Slider.Name = "Slider"
			Slider.Parent = Container2
			Slider.Active = false
			Slider.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
			Slider.BackgroundTransparency = 1.000
			Slider.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Slider.BorderSizePixel = 0
			Slider.Selectable = false
			Slider.Size = UDim2.new(0, 519, 0, 34)

			OptionText.Name = "OptionText"
			OptionText.Parent = Slider
			OptionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			OptionText.BackgroundTransparency = 1.000
			OptionText.Size = UDim2.new(0.300000012, 0, 1, 0)
			OptionText.Font = Enum.Font.SourceSans
			OptionText.Text = text
			OptionText.TextColor3 = chosenTheme.TextColor
			OptionText.TextSize = 15.000
			OptionText.TextXAlignment = Enum.TextXAlignment.Left

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Slider
			SliderFrame.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
			SliderFrame.Position = UDim2.new(0.600000024, 0, 0.349999994, 2)
			SliderFrame.Size = UDim2.new(0.349999994, 0, 0.25, 0)

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = SliderFrame

			sliderImg.Name = "sliderImg"
			sliderImg.Parent = SliderFrame
			sliderImg.Active = false
			sliderImg.BackgroundColor3 = chosenTheme.Button
			sliderImg.BorderSizePixel = 0
			sliderImg.Selectable = false
			sliderImg.Text = ""
			sliderImg.Size = UDim2.new(0.100000001, 0, 1, 0)

			UICorner_2.CornerRadius = UDim.new(0, 6)
			UICorner_2.Parent = sliderImg

			valueText.Name = "valueText"
			valueText.Parent = Slider
			valueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			valueText.BackgroundTransparency = 1.000
			valueText.Position = UDim2.new(0.5, 95, 0.25, -10)
			valueText.Size = UDim2.new(0.179670483, 0, 0.5, 0)
			valueText.Font = Enum.Font.Roboto
			valueText.Text = ""
			valueText.TextColor3 = chosenTheme.TextColor
			valueText.TextSize = 14.000
			valueText.TextXAlignment = Enum.TextXAlignment.Right

			sliderImg.MouseButton1Down:Connect(function()
				val = math.floor((((tonumber(options.max) - tonumber(options.min)) / 127) * sliderImg.AbsolutePosition.X) + tonumber(options.min)) or 0
				pcall(function()
					callback(val)
				end)
				sliderImg.Size = UDim2.new(0, math.clamp(mouse.X - sliderImg.AbsolutePosition.X, 0, 127), 1, 0)
				Functions.MoveConnection = mouse.Move:Connect(function()
					valueText.Text = string.format("%s / %s", val, options.max)
					val = math.floor((((tonumber(options.max) - tonumber(options.min)) / 127) * sliderImg.AbsolutePosition.X) + tonumber(options.min))
					pcall(function()
						callback(val)
					end)
					Slider.Size = UDim2.new(0, math.clamp(mouse.X - sliderImg.AbsolutePosition.X, 0, 127), 1, 0)
				end)
				Functions.ReleaseConnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						val = math.floor((((tonumber(options.max) - tonumber(options.min)) / 127) * sliderImg.AbsolutePosition.X) + tonumber(options.min))
						pcall(function()
							callback(val)
						end)
						sliderImg.Size = UDim2.new(0, math.clamp(mouse.X - sliderImg.AbsolutePosition.X, 0, 127), 1, 0)
						Functions.ReleaseConnection:Disconnect()
						Functions.MoveConnection:Disconnect()
					end
				end)
			end)
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
		Label.TextColor3 = chosenTheme.TextColor
		Label.TextSize = 14.000
		return Label
	end
	Library.Notification.Notify("Unsploit UI Library", "Unsploit UI Library has successfully loaded!", "rbxassetid://4914902889")
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

function Functions:ExitUI()
	Library:Destroy();
end

function Functions:Execute(callback)
	return pcall(callback)
end

Functions.UnsploitLeaving = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
	if child.Name == Library.Title then
		if (Functions.UnsploitLeaving) then
			child:Destroy()
			if Functions.UnsploitLeaving then
				Functions.UnsploitLeaving:Disconnect();
			end
			if Functions.TabBtnConnection then
				Functions.TabBtnConnection:Disconnect();
			end
			if Functions.ToggleBtnConnection then
				Functions.ToggleBtnConnection:Disconnect();
			end
			if Functions.ButtonOptionConnection then
				Functions.ButtonOptionConnection:Disconnect();
			end
			if Functions.UnsploitExitConnection then
				Functions.UnsploitExitConnection:Disconnect();
			end
		end
	end
end)

return Library, Utility