-- Sell Lemons Hub | Encrypted Loader
-- This loader includes encryption/decryption for the main script

local CoreGui      = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService   = game:GetService("RunService")

local HUB_URL = "https://dpaste.com/HD2BRP534.txt"

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
ScreenGui.Name           = "SellLemonsLoader"
ScreenGui.ResetOnSpawn   = false
ScreenGui.DisplayOrder   = 999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent         = parent

-- =========================================
-- Full-screen dim
-- =========================================
local Dim = Instance.new("Frame", ScreenGui)
Dim.Size                 = UDim2.fromScale(1, 1)
Dim.BackgroundColor3     = Color3.fromRGB(0, 0, 0)
Dim.BackgroundTransparency = 1
Dim.BorderSizePixel      = 0
Dim.ZIndex               = 1

TweenService:Create(Dim, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.35}):Play()

-- =========================================
-- Card
-- =========================================
local Card = Instance.new("Frame", ScreenGui)
Card.Name                = "LoaderCard"
Card.Size                = UDim2.new(0, 360, 0, 220)
Card.Position            = UDim2.new(0.5, -180, 0.6, -110)
Card.BackgroundColor3    = Color3.fromRGB(10, 10, 10)
Card.BackgroundTransparency = 1
Card.BorderSizePixel     = 0
Card.ZIndex              = 2
Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 16)

local CardStroke = Instance.new("UIStroke", Card)
CardStroke.Thickness = 1.5
CardStroke.Color     = Color3.fromRGB(60, 60, 60)
CardStroke.Transparency = 1

TweenService:Create(Card, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -180, 0.5, -110),
    BackgroundTransparency = 0,
}):Play()
TweenService:Create(CardStroke, TweenInfo.new(0.45), {Transparency = 0}):Play()

-- =========================================
-- Gradient top bar
-- =========================================
local TopBar = Instance.new("Frame", Card)
TopBar.Size             = UDim2.new(1, 0, 0, 4)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 210, 50)
TopBar.BorderSizePixel  = 0
TopBar.ZIndex           = 3
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 16)
local TBGrad = Instance.new("UIGradient", TopBar)
TBGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(255, 230, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 140, 20)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(230, 60,  20)),
})

-- =========================================
-- Lemon icon (bounces)
-- =========================================
local Lemon = Instance.new("TextLabel", Card)
Lemon.Size                = UDim2.new(0, 60, 0, 60)
Lemon.Position            = UDim2.new(0.5, -30, 0, 18)
Lemon.BackgroundTransparency = 1
Lemon.Text                = "🍋"
Lemon.TextSize            = 48
Lemon.Font                = Enum.Font.Gotham
Lemon.ZIndex              = 3

local bounceUp = true
local function bounceLemon()
    if not Lemon or not Lemon.Parent then return end
    local target = bounceUp
        and UDim2.new(0.5, -30, 0, 10)
        or  UDim2.new(0.5, -30, 0, 22)
    bounceUp = not bounceUp
    TweenService:Create(Lemon, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Position = target
    }):Play()
end

local bounceConn
bounceConn = RunService.Heartbeat:Connect(function()
    if not Lemon or not Lemon.Parent then bounceConn:Disconnect() return end
end)

task.spawn(function()
    while Lemon and Lemon.Parent do
        bounceLemon()
        task.wait(0.5)
    end
end)

-- =========================================
-- Title
-- =========================================
local Title = Instance.new("TextLabel", Card)
Title.Size                = UDim2.new(1, -20, 0, 28)
Title.Position            = UDim2.new(0, 10, 0, 86)
Title.BackgroundTransparency = 1
Title.Text                = "Sell Lemons Hub"
Title.TextColor3          = Color3.fromRGB(255, 235, 59)
Title.TextSize            = 22
Title.Font                = Enum.Font.GothamBold
Title.ZIndex              = 3

-- =========================================
-- Status label
-- =========================================
local StatusLabel = Instance.new("TextLabel", Card)
StatusLabel.Size                = UDim2.new(1, -30, 0, 22)
StatusLabel.Position            = UDim2.new(0, 15, 0, 120)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text                = "Initializing..."
StatusLabel.TextColor3          = Color3.fromRGB(160, 160, 160)
StatusLabel.TextSize            = 13
StatusLabel.Font                = Enum.Font.Gotham
StatusLabel.ZIndex              = 3

-- =========================================
-- Progress bar track
-- =========================================
local Track = Instance.new("Frame", Card)
Track.Size             = UDim2.new(1, -40, 0, 6)
Track.Position         = UDim2.new(0, 20, 0, 152)
Track.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Track.BorderSizePixel  = 0
Track.ZIndex           = 3
Instance.new("UICorner", Track).CornerRadius = UDim.new(1, 0)

local Bar = Instance.new("Frame", Track)
Bar.Size             = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(255, 200, 30)
Bar.BorderSizePixel  = 0
Bar.ZIndex           = 4
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

local BarGrad = Instance.new("UIGradient", Bar)
BarGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(255, 230, 50)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(255, 120, 0)),
})

task.spawn(function()
    local rotation = 0
    while Bar and Bar.Parent do
        rotation = (rotation + 3) % 360
        BarGrad.Rotation = rotation
        task.wait(0.016)
    end
end)

-- =========================================
-- Version / credit label
-- =========================================
local Credit = Instance.new("TextLabel", Card)
Credit.Size                = UDim2.new(1, -20, 0, 18)
Credit.Position            = UDim2.new(0, 10, 0, 190)
Credit.BackgroundTransparency = 1
Credit.Text                = "ecco hub v1.0 • sell lemons"
Credit.TextColor3          = Color3.fromRGB(70, 70, 70)
Credit.TextSize            = 11
Credit.Font                = Enum.Font.Gotham
Credit.ZIndex              = 3

-- =========================================
-- Animated progress steps
-- =========================================
local function setProgress(pct, msg, delay_)
    task.delay(delay_ or 0, function()
        if not Bar or not Bar.Parent then return end
        TweenService:Create(Bar, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
            Size = UDim2.new(pct, 0, 1, 0)
        }):Play()
        if StatusLabel and StatusLabel.Parent then
            StatusLabel.Text = msg
        end
    end)
end

setProgress(0.15, "Connecting to servers...",   0.3)
setProgress(0.40, "Fetching hub script...",     0.9)
setProgress(0.65, "Decrypting modules...",      1.5)
setProgress(0.85, "Loading environment...",     2.1)
setProgress(1.00, "Ready! Launching hub...",    2.7)

-- =========================================
-- Load hub then destroy loader (with encryption)
-- =========================================
task.delay(3.2, function()
    TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, -180, 0.45, -110),
    }):Play()
    TweenService:Create(CardStroke, TweenInfo.new(0.4), {Transparency = 1}):Play()
    TweenService:Create(Dim, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()

    task.wait(0.45)
    
    -- Fetch and decrypt the hub
    local ok, hubScript = pcall(function()
        return game:HttpGet(HUB_URL)
    end)
    
    if ok and hubScript then
        -- Encrypt the downloaded script
        local encrypted = xorEncrypt(hubScript, ENCRYPTION_KEY)
        local encoded = base64Encode(encrypted)
        
        -- Now create a working encrypted loadstring
        local encryptedLoader = string.format([[
            local xorDecrypt, base64Decode
            
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
            warn("[Sell Lemons Hub] Execution Error: " .. tostring(execErr))
        end
    else
        warn("[Sell Lemons Hub] Failed to fetch hub script")
        if ScreenGui and ScreenGui.Parent then
            ScreenGui:Destroy()
        end
    end
end)
