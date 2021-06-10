local Console = {}

function Console.new(parent: Instance)
    Console._window = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Borders = Instance.new("Frame")
    local Borders_2 = Instance.new("Frame")
    local Borders_3 = Instance.new("Frame")
    local Borders_4 = Instance.new("Frame")
    local consoleText = Instance.new("TextLabel")
    
    Console._window.Name = "- Console"
    Console._window.Parent = parent
    Console._window.AnchorPoint = Vector2.new(0.5, 0.5)
    Console._window.BackgroundColor3 = Color3.fromRGB(147, 147, 147)
    Console._window.BorderSizePixel = 0
    Console._window.Position = UDim2.new(0.792490125, 0, 0.5, 0)
    Console._window.Size = UDim2.new(0, 376, 0, 300)
    Console._window.Visible = false

    TopBar.Name = "TopBar"
    TopBar.Parent = Console._window
    TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.Position = UDim2.new(0, 0, 0, -19)
    TopBar.Size = UDim2.new(1, 0, 0.0649999976, 0)

    TextLabel.Parent = TopBar
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.00799998827, 0, 0, 0)
    TextLabel.Size = UDim2.new(0.992000103, 0, 1, 0)
    TextLabel.Font = Enum.Font.Ubuntu
    TextLabel.Text = "CONSOLE"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    Borders.Name = "Borders"
    Borders.Parent = Console._window
    Borders.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Borders.BorderSizePixel = 0
    Borders.Size = UDim2.new(0, 3, 0, 300)

    Borders_2.Name = "Borders"
    Borders_2.Parent = Console._window
    Borders_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Borders_2.BorderSizePixel = 0
    Borders_2.Position = UDim2.new(0.992021263, 0, 0, 0)
    Borders_2.Size = UDim2.new(0, 3, 0, 300)

    Borders_3.Name = "Borders"
    Borders_3.Parent = Console._window
    Borders_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Borders_3.BorderSizePixel = 0
    Borders_3.Position = UDim2.new(0.00797872338, 0, 0.99000001, 0)
    Borders_3.Size = UDim2.new(0, 370, 0, 3)

    Borders_4.Name = "Borders"
    Borders_4.Parent = Console._window
    Borders_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Borders_4.BorderSizePixel = 0
    Borders_4.Position = UDim2.new(0.00797872338, 0, 0, 0)
    Borders_4.Size = UDim2.new(0, 370, 0, 3)

    consoleText.Name = "consoleText"
    consoleText.Parent = Console._window
    consoleText.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
    consoleText.BackgroundTransparency = 1.000
    consoleText.BorderSizePixel = 0
    consoleText.Position = UDim2.new(0.00797872338, 0, 0.00999999978, 0)
    consoleText.Size = UDim2.new(0, 370, 0, 294)
    consoleText.Font = Enum.Font.SourceSans
    consoleText.Text = ""
    consoleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    consoleText.TextSize = 14.000
    consoleText.TextXAlignment = Enum.TextXAlignment.Left
    consoleText.TextYAlignment = Enum.TextYAlignment.Top
end

function Console:WriteLine(to_write: any)
    Console._window:FindFirstChild("consoleText").Text = string.format("[CONSOLE]: %s\n", to_write)
end

function Console:ToggleWindow(toggle)
    Console._window.Visible = toggle
end

function Console:Destroy()
    Console._window:Destroy();
end

return Console