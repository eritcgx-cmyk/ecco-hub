local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local parent = CoreGui
if gethui then parent = gethui() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EccoHubLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = parent

local Dim = Instance.new("Frame", ScreenGui)
Dim.Size = UDim2.fromScale(1, 1)
Dim.BackgroundColor3 = Color3.fromRGB(8, 8, 15)
Dim.BackgroundTransparency = 1
Dim.BorderSizePixel = 0
Dim.ZIndex = 1

local dimTween = TweenService:Create(Dim, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.4})
if dimTween then dimTween:Play() end

local Card = Instance.new("Frame", ScreenGui)
Card.Name = "LoaderCard"
Card.Size = UDim2.new(0, 380, 0, 280)
Card.Position = UDim2.new(0.5, -190, 0.6, -140)
Card.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
Card.BackgroundTransparency = 1
Card.BorderSizePixel = 0
Card.ZIndex = 2
Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 20)

local CardStroke = Instance.new("UIStroke", Card)
CardStroke.Thickness = 2
CardStroke.Color = Color3.fromRGB(100, 80, 200)
CardStroke.Transparency = 1

local cardTween = TweenService:Create(Card, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -190, 0.5, -140), BackgroundTransparency = 0})
if cardTween then cardTween:Play() end

local strokeTween = TweenService:Create(CardStroke, TweenInfo.new(0.45), {Transparency = 0})
if strokeTween then strokeTween:Play() end

local TopBar = Instance.new("Frame", Card)
TopBar.Size = UDim2.new(1, 0, 0, 5)
TopBar.BackgroundColor3 = Color3.fromRGB(120, 90, 255)
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 3
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 20)

local DiamondContainer = Instance.new("Frame", Card)
DiamondContainer.Size = UDim2.new(0, 80, 0, 80)
DiamondContainer.Position = UDim2.new(0.5, -40, 0, 15)
DiamondContainer.BackgroundTransparency = 1
DiamondContainer.BorderSizePixel = 0
DiamondContainer.ZIndex = 3

local Diamond = Instance.new("TextLabel", DiamondContainer)
Diamond.Size = UDim2.new(1, 0, 1, 0)
Diamond.BackgroundTransparency = 1
Diamond.Text = "💎"
Diamond.TextSize = 64
Diamond.Font = Enum.Font.Gotham
Diamond.ZIndex = 3

task.spawn(function()
    local rotation = 0
    while Diamond and Diamond.Parent do
        rotation = (rotation + 2) % 360
        Diamond.Rotation = rotation
        task.wait(0.016)
    end
end)

local MainTitle = Instance.new("TextLabel", Card)
MainTitle.Size = UDim2.new(1, -30, 0, 35)
MainTitle.Position = UDim2.new(0, 15, 0, 100)
MainTitle.BackgroundTransparency = 1
MainTitle.Text = "ECCO HUB"
MainTitle.TextColor3 = Color3.fromRGB(200, 150, 255)
MainTitle.TextSize = 28
MainTitle.Font = Enum.Font.GothamBold
MainTitle.ZIndex = 3

local Subtitle = Instance.new("TextLabel", Card)
Subtitle.Size = UDim2.new(1, -30, 0, 20)
Subtitle.Position = UDim2.new(0, 15, 0, 135)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Sell Lemons"
Subtitle.TextColor3 = Color3.fromRGB(100, 200, 255)
Subtitle.TextSize = 14
Subtitle.Font = Enum.Font.GothamBold
Subtitle.ZIndex = 3

local StatusLabel = Instance.new("TextLabel", Card)
StatusLabel.Size = UDim2.new(1, -30, 0, 22)
StatusLabel.Position = UDim2.new(0, 15, 0, 165)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Initializing..."
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.ZIndex = 3

local Track = Instance.new("Frame", Card)
Track.Size = UDim2.new(1, -40, 0, 8)
Track.Position = UDim2.new(0, 20, 0, 195)
Track.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
Track.BorderSizePixel = 0
Track.ZIndex = 3
Instance.new("UICorner", Track).CornerRadius = UDim.new(1, 0)

local Bar = Instance.new("Frame", Track)
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(120, 90, 255)
Bar.BorderSizePixel = 0
Bar.ZIndex = 4
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

local function setProgress(pct, msg, delay_)
    task.delay(delay_ or 0, function()
        if not Bar or not Bar.Parent then return end
        local barTween = TweenService:Create(Bar, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = UDim2.new(pct, 0, 1, 0)})
        if barTween then barTween:Play() end
        if StatusLabel and StatusLabel.Parent then
            StatusLabel.Text = msg
        end
    end)
end

setProgress(0.15, "Connecting to premium servers...", 0.3)
setProgress(0.40, "Fetching encrypted hub...", 0.9)
setProgress(0.65, "Decrypting modules...", 1.5)
setProgress(0.85, "Initializing environment...", 2.1)
setProgress(1.00, "Ready! Launching Ecco Hub...", 2.7)

task.delay(3.3, function()
    local fadeOutCard = TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 1, Position = UDim2.new(0.5, -190, 0.45, -140)})
    if fadeOutCard then fadeOutCard:Play() end
    
    local fadeOutStroke = TweenService:Create(CardStroke, TweenInfo.new(0.4), {Transparency = 1})
    if fadeOutStroke then fadeOutStroke:Play() end
    
    local fadeOutDim = TweenService:Create(Dim, TweenInfo.new(0.4), {BackgroundTransparency = 1})
    if fadeOutDim then fadeOutDim:Play() end

    task.wait(0.45)
    
    if ScreenGui and ScreenGui.Parent then
        ScreenGui:Destroy()
    end
    
    local ok, err = pcall(function()
        loadstring(game:HttpGet("https://dpaste.com/BALNHG3T7.txt"))()
    end)
    
    if not ok then
        warn("[Ecco Hub] Launch Error: " .. tostring(err))
    end
end)
