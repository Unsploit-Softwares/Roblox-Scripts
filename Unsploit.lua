local Draggify = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unsploit-Softwares/Roblox-Scripts/master/Modules/Draggify.lua"))();

local RGB = Color3.fromRGB
local HSV = Color3.fromHSV
local Color = Color3.new
local toHSV = Color3.toHSV

-- NAME: Library._instance UI Library
-- AUTHOR: Library._instance Softwares
-- DATE: June 2nd 2021 -- REWRITE #3
-- SOURCE BUILD: 155

--[[

    Library
		Constructors: 
			Library.new(name: string, gameTitle: string (Optional), theme: string) -- > Creates a new UI Window. themeData should only be added if theme argument is set to "Custom"
		
		Functions:
			-- Tabs
			TabLibrary:AddTab(name: string) --> Creates a new tab window
			TabLibrary:AddLabel(text: string) --> Creates a new tab window
			
			-- Options
			Options:AddButton(text: string, callback: function) --> Creates a new button and callback
			Options:AddLabel(text: string) --> Creates a new label
			Options:AddToggle(text: string, callback: function) --> Creates a new Toggle
			Options:AddDropdown(text: string) --> Creates a new Dropdown
			Options:AddSlider(text: string, callback: function, options: table) --> Creates a new Slider, Options table includes "min" and "max" values.

		Themes:
			Default,
			Dark,
			Light,
			Unsploit,
			Custom

		Methods: 
			Library:Destroy() --> Destroys the UI Object

    Utility
        Methods:
            Utility:GenerateName(length: number) --> Generates a random string character
            (DISABLED) Utility:Create(class: string, properties: table) --> Creates a new instance class with properties
]]

--getgenv().GlobalThemes = {}


-- ARROW_DOWN_WHITE = 	rbxassetid://6936536383
-- ARROW_UP_WHITE = 	rbxassetid://6936551482

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
	chosenTheme = ""
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

function Library.new(name, gameTitle,theme)
	gameTitle = gameTitle or "Universal"
	theme = theme or "Default"
	Library.Title = name or "Unsploit"

	--if not themeData then return; end

	if theme == "Default" then
		Library.chosenTheme = Library.Themes.Default
	elseif theme == "Light" then
		Library.chosenTheme = Library.Themes.Light
	elseif theme == "Dark" then
		Library.chosenTheme = Library.Themes.Dark
	elseif theme == "Unsploit" then
		Library.chosenTheme = Library.Themes.Unsploit
	--[[ elseif theme == "Custom" then
		Library.chosenTheme = themeData ]]
	end

	local function setTitle()
		local g_title;

		if gameTitle ~= "Universal" then
			g_title = name .. " | " .. gameTitle
		elseif gameTitle == "Universal" then
			g_title = name
		end
		return g_title
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
	Main.BackgroundColor3 = Library.chosenTheme.Accent
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 300)

	Library.Draggify(Main)

	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.BackgroundColor3 = Library.chosenTheme.Background
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
	titleLabel.TextColor3 = Library.chosenTheme.TextColor
	titleLabel.TextSize = 14.000
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Text = setTitle()

	exitBtn.Name = "exitBtn"
	exitBtn.Parent = TopBar
	exitBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	exitBtn.BorderSizePixel = 0
	exitBtn.Position = UDim2.new(0.920000017, 0, 0, 0)
	exitBtn.Size = UDim2.new(0.0799999982, 0, 1, 0)
	exitBtn.Font = Enum.Font.SourceSans
	exitBtn.Text = "X"
	exitBtn.TextColor3 = Library.chosenTheme.TextColor
	exitBtn.TextSize = 14.000

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = Main
	TabContainer.BackgroundColor3 = Library.chosenTheme.Background
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

	Functions.ExitBtnConnection = exitBtn.MouseButton1Click:Connect(function()
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
		local Container2 = Instance.new("ScrollingFrame")
		local UIGridLayout = Instance.new("UIGridLayout")
		local UIPadding_2 = Instance.new("UIPadding")

		TabBtn.Name = text
		TabBtn.BackgroundColor3 = Library.chosenTheme.Button
		TabBtn.Size = UDim2.new(0.899999976, 0, 0.100000001, 0)
		TabBtn.Font = Enum.Font.SourceSans
		TabBtn.TextColor3 = Library.chosenTheme.TextColor
		TabBtn.TextSize = 14.000
		TabBtn.Text = text or "Tab"
		TabBtn.Parent = TabContainer

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = TabBtn

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
					BackgroundColor3 = Library.chosenTheme.Button
				}):Play()
			else
				v.Visible = false
				game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					BackgroundColor3 = Library.chosenTheme.ButtonActive
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
						BackgroundColor3 = Library.chosenTheme.ButtonActive
					}):Play()
				end
			end

			game.TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = Library.chosenTheme.Button
			}):Play()
		end)

		local Options = {}
		-- Buttons
		function Options:AddButton(text: string, callback)
			callback = callback or function () end

			local Button = Instance.new("TextButton")
			local UIPadding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")

			Button.Name = text
			Button.Parent = Container2
			Button.BackgroundColor3 = Library.chosenTheme.Button
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.782999992, 0, 0.0599999987, 0)
			Button.Size = UDim2.new(0.200000003, 0, 0.899999976, 0)
			Button.Font = Enum.Font.SourceSans
			Button.Text = text or "Button"
			Button.TextColor3 = Library.chosenTheme.TextColor
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

			Label.Name = text
			Label.Parent = Container2
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Size = UDim2.new(0, 200, 0, 50)
			Label.Font = Enum.Font.SourceSans
			Label.TextColor3 = Library.chosenTheme.TextColor
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

			Toggle.Name = text
			Toggle.Parent = Container2
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 100, 0, 100)

			Label.Name = "Label"
			Label.Parent = Toggle
			Label.BackgroundColor3 = Library.chosenTheme.TextColor
			Label.BackgroundTransparency = 1.000
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0.76296705, 0, 1, 0)
			Label.Font = Enum.Font.SourceSans
			Label.TextColor3 = Library.chosenTheme.TextColor
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
			Bool.BackgroundColor3 = Library.chosenTheme.Button
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
				Bool:TweenPosition(enabled and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0, 0, 0, 0), "In", "Linear", 0.1)
				pcall(callback, args)
			end
			return Toggle
		end
		function Options:AddSlider(text: string, callback, options: table)
			text = text or "Slider"
			options.min = options.min or 0
			options.max = options.max or 100

			local callback = callback or function () end

			local mouse = game:GetService("Players").LocalPlayer:GetMouse ()
			local uis = game:GetService("UserInputService")
			local Value;

			local Slider = Instance.new("Frame")
			local OptionText = Instance.new("TextLabel")
			local SliderFrame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local sliderInner = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local valueText = Instance.new("TextLabel")
			local SliderButton = Instance.new("TextButton")

			Slider.Name = text
			Slider.Parent = Container2
			Slider.BackgroundColor3 = Library.chosenTheme.Button
			Slider.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0, 519, 0, 34)

			OptionText.Name = "OptionText"
			OptionText.Parent = Slider
			OptionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			OptionText.BackgroundTransparency = 1.000
			OptionText.Position = UDim2.new(0.0192307699, 0, 0, 0)
			OptionText.Size = UDim2.new(0.440769225, 0, 1, 0)
			OptionText.Font = Enum.Font.SourceSans
			OptionText.Text = text
			OptionText.TextColor3 = Library.chosenTheme.TextColor
			OptionText.TextSize = 15.000
			OptionText.TextXAlignment = Enum.TextXAlignment.Left

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Slider
			SliderFrame.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
			SliderFrame.Position = UDim2.new(0.481318712, 0, 0.508474588, 0)
			SliderFrame.Size = UDim2.new(0, 169, 0, 12)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = SliderFrame

			sliderInner.Name = "sliderInner"
			sliderInner.Parent = SliderFrame
			sliderInner.BackgroundColor3 = Color3.fromRGB(220, 20, 20)
			sliderInner.BorderSizePixel = 0
			sliderInner.Size = UDim2.new(0, 0, 1, 0)

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = sliderInner

			valueText.Name = "valueText"
			valueText.Parent = Slider
			valueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			valueText.BackgroundTransparency = 1.000
			valueText.Position = UDim2.new(0.501977921, 95, 0.338983059, -10)
			valueText.Size = UDim2.new(0.179890037, 0, 0.508474529, 0)
			valueText.Font = Enum.Font.Roboto
			valueText.Text = string.format("%s / %s", tostring(options.min), tostring(options.max))
			valueText.TextColor3 = Library.chosenTheme.TextColor
			valueText.TextSize = 14.000
			valueText.TextXAlignment = Enum.TextXAlignment.Right

			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Slider
			SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderButton.BackgroundTransparency = 1.000
			SliderButton.Position = UDim2.new(0.480999947, 0, 0.507999718, 0)
			SliderButton.Size = UDim2.new(0, 168, 0, 14)
			SliderButton.Font = Enum.Font.SourceSans
			SliderButton.Text = ""
			SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.TextSize = 14.000

			SliderButton.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(options.max) - tonumber(options.min)) / SliderFrame.AbsoluteSize.X) * sliderInner.AbsoluteSize.X) + tonumber(options.min)) or 0
				pcall(function()
					callback(Value)
				end)
				sliderInner.Size = UDim2.new(0, math.clamp(mouse.X - sliderInner.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 0, 12)
				Functions.moveconnection = mouse.Move:Connect(function()
					valueText.Text = string.format("%s / %s", Value, options.max)
					Value = math.floor((((tonumber(options.max) - tonumber(options.min)) / SliderFrame.AbsoluteSize.X) * sliderInner.AbsoluteSize.X) + tonumber(options.min))
					pcall(function()
						callback(Value)
					end)
					sliderInner.Size = UDim2.new(0, math.clamp(mouse.X - sliderInner.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 0, 12)
				end)
				Functions.releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(options.max) - tonumber(options.min)) / SliderFrame.AbsoluteSize.X) * sliderInner.AbsoluteSize.X) + tonumber(options.min))
						pcall(function()
							callback(Value)
						end)
						sliderInner.Size = UDim2.new(0, math.clamp(mouse.X - sliderInner.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 0, 12)
						Functions.moveconnection:Disconnect()
						Functions.releaseconnection:Disconnect()
					end
				end)
			end)
			return Slider
		end
		function Options:AddDropdown(text: string, data: table, callback)

			local DropYSize = 0
			local isDropped = false

			text = text or "Dropdown"
			data = data or {}

			callback = callback or function () end

			local Dropdown = Instance.new("Frame")
			local Label = Instance.new("TextLabel")
			local Holder = Instance.new("Frame")
			local Button = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local valueText = Instance.new("TextLabel")
			local dropdownContainer = Instance.new("ScrollingFrame")
			local UIPadding = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")

			Dropdown.Name = text
			Dropdown.Parent = Container2
			Dropdown.BackgroundColor3 = Library.chosenTheme.Button
			Dropdown.BorderSizePixel = 0
			Dropdown.Size = UDim2.new(0, 100, 0, 100)
			Dropdown.ZIndex = 2;

			Label.Name = "Label"
			Label.Parent = Dropdown
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.0192307699, 0, 0, 0)
			Label.Size = UDim2.new(0.381098866, 0, 1, 0)
			Label.Font = Enum.Font.SourceSans
			Label.Text = text
			Label.TextColor3 = Library.chosenTheme.TextColor
			Label.TextSize = 14.000
			Label.TextXAlignment = Enum.TextXAlignment.Left

			Holder.Name = "Holder"
			Holder.Parent = Dropdown
			Holder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Holder.BorderSizePixel = 0
			Holder.Position = UDim2.new(0.424758226, 0, 0.0677966028, 2)
			Holder.Size = UDim2.new(0.543000042, 0, 0.678711653, 0)

			Button.Name = "Button"
			Button.Parent = Holder
			Button.Active = false
			Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.862500012, 0, 0.0661021098, 0)
			Button.Selectable = false
			Button.Size = UDim2.new(0.113477945, 0, 0.85000056, 0)
			Button.Image = "rbxassetid://6936536383"

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = Button

			valueText.Name = "valueText"
			valueText.Parent = Holder
			valueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			valueText.BackgroundTransparency = 1.000
			valueText.Position = UDim2.new(0.0202372819, 0, 0, 0)
			valueText.Size = UDim2.new(0.822524846, -3, 1, 0)
			valueText.Font = Enum.Font.SourceSans
			valueText.Text = data[1]
			valueText.TextColor3 = Library.chosenTheme.TextColor
			valueText.TextSize = 14.000
			valueText.TextXAlignment = Enum.TextXAlignment.Left

			dropdownContainer.Name = "dropdownContainer"
			dropdownContainer.Parent = Holder
			dropdownContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			dropdownContainer.BorderSizePixel = 0
			dropdownContainer.Position = UDim2.new(0, 0, 1.00000048, 0)
			dropdownContainer.Selectable = false
			dropdownContainer.Size = UDim2.new(1, 0, 0, 0)
			dropdownContainer.Visible = false
			dropdownContainer.ScrollBarThickness = 0
			
 			UIListLayout.Parent = dropdownContainer
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 3)

			UIPadding.Parent = dropdownContainer
			UIPadding.PaddingBottom = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)

			Functions.DropdownConnection = Button.MouseButton1Click:Connect(function()
				if isDropped then
					isDropped = false
					dropdownContainer.Visible = false
					dropdownContainer.Size = UDim2.new(0, 197, 0, 0)
					Button.Image = "rbxassetid://6936536383"
					Container2.ScrollingEnabled = true
				else
					isDropped = true
					dropdownContainer.Visible = true
					dropdownContainer.Size = UDim2.new(0, 197, 0, DropYSize)
					Button.Image = "rbxassetid://6936551482"
					Container2.ScrollingEnabled = false
				end
			end)

			for i,v in next, data do
				local OptionButton = Instance.new("TextButton")
				local Padding = Instance.new("UIPadding")

				OptionButton.Name = v ..  "Btn"
				OptionButton.Parent = dropdownContainer
				OptionButton.BackgroundColor3 = Library.chosenTheme.Button
				OptionButton.BorderSizePixel = 0
				OptionButton.Size = UDim2.new(.95, 0, 0, 30)
				OptionButton.Position = UDim2.new(0, 5, 0, 0, 0)
				OptionButton.AutoButtonColor = false
				OptionButton.Font = Enum.Font.SourceSans
				OptionButton.Text = v
				OptionButton.TextColor3 = Library.chosenTheme.TextColor
				OptionButton.TextSize = 14.000

				DropYSize = DropYSize + 30

				Functions.DropdownOptionBtn = OptionButton.MouseButton1Click:Connect(function()
					valueText.Text = v
					callback(v)

					isDropped = false
					dropdownContainer.Visible = false
					dropdownContainer.Size = UDim2.new(0, 197, 0, 0)
					Button.Image = "rbxassetid://6936536383"
					Container2.ScrollingEnabled = true
				end)
			end
			return Dropdown
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
		Label.TextColor3 = Library.chosenTheme.TextColor
		Label.TextSize = 14.000
		return Label
	end
	Library.Notification.Notify("Unsploit UI Library", "Unsploit UI Library has successfully loaded!", "rbxassetid://4914902889")
	return TabLibrary
end

function Library:SetTheme(theme)
	theme = theme or "Default"

	if theme == "Default" then
		Library.chosenTheme = Library.Themes.Default
	elseif theme == "Light" then
		Library.chosenTheme = Library.Themes.Light
	elseif theme == "Dark" then
		Library.chosenTheme = Library.Themes.Dark
	elseif theme == "Unsploit" then
		Library.chosenTheme = Library.Themes.Unsploit
	end
end

function Library:GetName()
	return Library._instance.Name
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
			if Functions.ExitBtnConnection then
				Functions.ExitBtnConnection:Disconnect();
			end
			if Functions.DropdownConnection then
				Functions.DropdownConnection:Disconnect();
				Functions.DropdownOptionBtn:Disconnect();
			end
		end
	end
end)

return Library, Utility