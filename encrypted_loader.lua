-- Ecco Hub - Sell Lemons | Encrypted Loader
-- This loader includes encryption/decryption for the main script

local CoreGui      = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService   = game:GetService("RunService")

local HUB_URL = "https://raw.githubusercontent.com/eritcgx-cmyk/ecco-hub/main/encrypted_loader.lua"

-- =========================================
-- Encryption/Decryption Functions
-- =========================================
local function base64Encode(data)
    local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    return ((data:gsub(".", function(x)
        local r, b = "", x:byte()
        for i = 8, 1, -1 do r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and "1" or "0") end
        return r
    end) .. "0000"):gsub("%d%d%d%d%d%d", function(x)
        if #x < 6 then return "" end
        local c = 0
        for i = 1, 6 do c = c + c + (x:sub(i, i) == "1" and 1 or 0) end
        return b:sub(c + 1, c + 1)
    end) .. ({
        "", "==", "="
    })[#data % 3 + 1])
end

local function base64Decode(data)
    local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    data = data:gsub("[^" .. b .. "=]", "")
    return (data:gsub(".", function(x)
        if x == "=" then return "" end
        local r, f = "", b:find(x) - 1
        for i = 6, 1, -1 do r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and "1" or "0") end
        return r
    end) .. "0000"):gsub("%d%d%d%d%d%d%d%d", function(x)
        if #x < 8 then return "" end
        local c = 0
        for i = 1, 8 do c = c + c + (x:sub(i, i) == "1" and 1 or 0) end
        return string.char(c)
    end)
end

local function xorEncrypt(data, key)
    local result = ""
    for i = 1, #data do
        local byte = string.byte(data, i)
        local keyByte = string.byte(key, ((i - 1) % #key) + 1)
        result = result .. string.char(bit32.bxor(byte, keyByte))
    end
    return result
end

local function xorDecrypt(data, key)
    return xorEncrypt(data, key)
end

local ENCRYPTION_KEY = "ecco_hub_security_key_2024"

-- =========================================
-- Parent
-- =========================================
local parent = CoreGui
if gethui then parent = gethui() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name           = "EccoHubLoader"
ScreenGui.ResetOnSpawn   = false
ScreenGui.DisplayOrder   = 999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent         = parent

-- =========================================
-- Full-screen dim with gradient
-- =========================================
local Dim = Instance.new("Frame", ScreenGui)
Dim.Size                 = UDim2.fromScale(1, 1)
Dim.BackgroundColor3     = Color3.fromRGB(8, 8, 15)
Dim.BackgroundTransparency = 1
Dim.BorderSizePixel      = 0
Dim.ZIndex               = 1

TweenService:Create(Dim, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.4}):Play()

-- =========================================
-- Card with premium styling
-- =========================================
local Card = Instance.new("Frame", ScreenGui)
Card.Name                = "LoaderCard"
Card.Size                = UDim2.new(0, 380, 0, 280)
Card.Position            = UDim2.new(0.5, -190, 0.6, -140)
Card.BackgroundColor3    = Color3.fromRGB(12, 12, 20)
Card.BackgroundTransparency = 1
Card.BorderSizePixel     = 0
Card.ZIndex              = 2
Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 20)

local CardStroke = Instance.new("UIStroke", Card)
CardStroke.Thickness = 2
CardStroke.Color     = Color3.fromRGB(100, 80, 200)
CardStroke.Transparency = 1

TweenService:Create(Card, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -190, 0.5, -140),
    BackgroundTransparency = 0,
}):Play()
TweenService:Create(CardStroke, TweenInfo.new(0.45), {Transparency = 0}):Play()

-- =========================================
-- Premium gradient top bar
-- =========================================
local TopBar = Instance.new("Frame", Card)
TopBar.Size             = UDim2.new(1, 0, 0, 5)
TopBar.BackgroundColor3 = Color3.fromRGB(120, 90, 255)
TopBar.BorderSizePixel  = 0
TopBar.ZIndex           = 3
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 20)
local TBGrad = Instance.new("UIGradient", TopBar)
TBGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(150, 100, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 150, 255)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(150, 100, 255)),
})

-- =========================================
-- Diamond icon (rotating)
-- =========================================
local DiamondContainer = Instance.new("Frame", Card)
DiamondContainer.Size                = UDim2.new(0, 80, 0, 80)
DiamondContainer.Position            = UDim2.new(0.5, -40, 0, 15)
DiamondContainer.BackgroundTransparency = 1
DiamondContainer.BorderSizePixel     = 0
DiamondContainer.ZIndex              = 3

local Diamond = Instance.new("TextLabel", DiamondContainer)
Diamond.Size                = UDim2.new(1, 0, 1, 0)
Diamond.BackgroundTransparency = 1
Diamond.Text                = "💎"
Diamond.TextSize            = 64
Diamond.Font                = Enum.Font.Gotham
Diamond.ZIndex              = 3

-- Rotating diamond effect
task.spawn(function()
    local rotation = 0
    while Diamond and Diamond.Parent do
        rotation = (rotation + 2) % 360
        Diamond.Rotation = rotation
        task.wait(0.016)
    end
end)

-- Pulse effect on diamond
task.spawn(function()
    while Diamond and Diamond.Parent do
        TweenService:Create(Diamond, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextTransparency = 0.3
        }):Play()
        task.wait(1)
        TweenService:Create(Diamond, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextTransparency = 0
        }):Play()
        task.wait(1)
    end
end)

-- =========================================
-- Main title
-- =========================================
local MainTitle = Instance.new("TextLabel", Card)
MainTitle.Size                = UDim2.new(1, -30, 0, 35)
MainTitle.Position            = UDim2.new(0, 15, 0, 100)
MainTitle.BackgroundTransparency = 1
MainTitle.Text                = "ECCO HUB"
MainTitle.TextColor3          = Color3.fromRGB(200, 150, 255)
MainTitle.TextSize            = 28
MainTitle.Font                = Enum.Font.GothamBold
MainTitle.ZIndex              = 3

-- =========================================
-- Subtitle
-- =========================================
local Subtitle = Instance.new("TextLabel", Card)
Subtitle.Size                = UDim2.new(1, -30, 0, 20)
Subtitle.Position            = UDim2.new(0, 15, 0, 135)
Subtitle.BackgroundTransparency = 1
Subtitle.Text                = "Sell Lemons"
Subtitle.TextColor3          = Color3.fromRGB(100, 200, 255)
Subtitle.TextSize            = 14
Subtitle.Font                = Enum.Font.GothamBold
Subtitle.ZIndex              = 3

-- =========================================
-- Status label
-- =========================================
local StatusLabel = Instance.new("TextLabel", Card)
StatusLabel.Size                = UDim2.new(1, -30, 0, 22)
StatusLabel.Position            = UDim2.new(0, 15, 0, 165)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text                = "Initializing..."
StatusLabel.TextColor3          = Color3.fromRGB(180, 180, 200)
StatusLabel.TextSize            = 12
StatusLabel.Font                = Enum.Font.Gotham
StatusLabel.ZIndex              = 3

-- =========================================
-- Progress bar track
-- =========================================
local Track = Instance.new("Frame", Card)
Track.Size             = UDim2.new(1, -40, 0, 8)
Track.Position         = UDim2.new(0, 20, 0, 195)
Track.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
Track.BorderSizePixel  = 0
Track.ZIndex           = 3
Instance.new("UICorner", Track).CornerRadius = UDim.new(1, 0)

local BarStroke = Instance.new("UIStroke", Track)
BarStroke.Thickness = 1
BarStroke.Color     = Color3.fromRGB(80, 60, 180)
BarStroke.Transparency = 0.5

local Bar = Instance.new("Frame", Track)
Bar.Size             = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(120, 90, 255)
Bar.BorderSizePixel  = 0
Bar.ZIndex           = 4
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

local BarGrad = Instance.new("UIGradient", Bar)
BarGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(150, 100, 255)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(100, 150, 255)),
})

-- Shimmer effect on bar
task.spawn(function()
    local rotation = 0
    while Bar and Bar.Parent do
        rotation = (rotation + 4) % 360
        BarGrad.Rotation = rotation
        task.wait(0.016)
    end
end)

-- =========================================
-- Version / credit label
-- =========================================
local Credit = Instance.new("TextLabel", Card)
Credit.Size                = UDim2.new(1, -20, 0, 18)
Credit.Position            = UDim2.new(0, 10, 0, 245)
Credit.BackgroundTransparency = 1
Credit.Text                = "Ecco Hub v2.0 • Premium Loader"
Credit.TextColor3          = Color3.fromRGB(80, 80, 120)
Credit.TextSize            = 10
Credit.Font                = Enum.Font.Gotham
Credit.ZIndex              = 3

-- =========================================
-- Animated progress steps
-- =========================================
local function setProgress(pct, msg, delay_)
    task.delay(delay_ or 0, function()
        if not Bar or not Bar.Parent then return end
        TweenService:Create(Bar, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
            Size = UDim2.new(pct, 0, 1, 0)
        }):Play()
        if StatusLabel and StatusLabel.Parent then
            StatusLabel.Text = msg
        end
    end)
end

setProgress(0.15, "Connecting to premium servers...",   0.3)
setProgress(0.40, "Fetching encrypted hub...",          0.9)
setProgress(0.65, "Decrypting modules...",              1.5)
setProgress(0.85, "Initializing environment...",        2.1)
setProgress(1.00, "Ready! Launching Ecco Hub...",       2.7)

-- =========================================
-- Load hub then destroy loader (with encryption)
-- =========================================
task.delay(3.3, function()
    TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, -190, 0.45, -140),
    }):Play()
    TweenService:Create(CardStroke, TweenInfo.new(0.4), {Transparency = 1}):Play()
    TweenService:Create(Dim, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()

    task.wait(0.45)
    
    -- Fetch and decrypt the hub
    local ok, hubScript = pcall(function()
        return game:HttpGet("https://dpaste.com/HD2BRP534.txt")
    end)
    
    if ok and hubScript then
        -- Encrypt the downloaded script
        local encrypted = xorEncrypt(hubScript, ENCRYPTION_KEY)
        local encoded = base64Encode(encrypted)
        
        -- Now create a working encrypted loadstring
        local encryptedLoader = string.format([[
            local function base64Decode(data)
                local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
                data = data:gsub("[^" .. b .. "=]", "")
                return (data:gsub(".", function(x)
                    if x == "=" then return "" end
                    local r, f = "", b:find(x) - 1
                    for i = 6, 1, -1 do r = r .. (f %% 2 ^ i - f %% 2 ^ (i - 1) > 0 and "1" or "0") end
                    return r
                end) .. "0000"):gsub("%%d%%d%%d%%d%%d%%d%%d%%d", function(x)
                    if #x < 8 then return "" end
                    local c = 0
                    for i = 1, 8 do c = c + c + (x:sub(i, i) == "1" and 1 or 0) end
                    return string.char(c)
                end)
            end
            
            local function xorDecrypt(data, key)
                local result = ""
                for i = 1, #data do
                    local byte = string.byte(data, i)
                    local keyByte = string.byte(key, ((i - 1) %% #key) + 1)
                    result = result .. string.char(bit32.bxor(byte, keyByte))
                end
                return result
            end
            
            local ENCRYPTION_KEY = "%s"
            local encrypted = base64Decode("%s")
            local decrypted = xorDecrypt(encrypted, ENCRYPTION_KEY)
            loadstring(decrypted)()
        ]], ENCRYPTION_KEY, encoded)
        
        if ScreenGui and ScreenGui.Parent then
            ScreenGui:Destroy()
        end
        
        -- Execute the encrypted loader
        local execOk, execErr = pcall(function()
            loadstring(encryptedLoader)()
        end)
        if not execOk then
            warn("[Ecco Hub] Execution Error: " .. tostring(execErr))
        end
    else
        warn("[Ecco Hub] Failed to fetch hub script")
        if ScreenGui and ScreenGui.Parent then
            ScreenGui:Destroy()
        end
    end
end)
