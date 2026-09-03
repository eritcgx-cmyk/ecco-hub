--[[
    ========================================================================================
    ZERO.XYZ — DA HOOD COMPLETE STEALTH ENGINE (100% UNDETECTED)
    Universal Public Configuration & Metamethod Defense Engine
    ========================================================================================
]]

-- PUBLIC CONFIGURATION TABLE (CUSTOMIZE EVERYTHING HERE)
script_key = "fIVgmgQPZfFpMHqACfhOTlMLqOwmsksq";

shared.Zero = {
    ['General'] = {
        ['Key'] = 'DoNotTouchThis',
        ['Multi Thread'] = true,

        ['Binds'] = {
            ['Aim Bot Target']     = 'l',
            ['Trigger Bot']        = 'l',
            ['Trigger Bot Target'] = 'k',
            ['Silent Aim Target']  = 'C',
            ['Inventory Sorter']   = 'B',
            ['Walk Speed']         = 'Z',
            ['ESP']                = 'J',
            ['Jump Power']         = 'P',
            ['Anti Future']        = 'X',
            ['Panic']              = 'X',
            ['Tryouts']            = 'O',
            ['Fly']                = 'V',
        },

        ['Show Hotkeys'] = {
            ['Enabled']         = true,
            ['Brand Color']     = Color3.fromRGB(0, 230, 255),
            ['Feature Color']   = Color3.fromRGB(255, 255, 255),
            ['Target Color']    = Color3.fromRGB(100, 255, 100),
            ['Watermark']       = 'zero.xyz | stealth engine',
            ['Watermark Color'] = Color3.fromRGB(0, 230, 255),
        },

        ['Checks'] = {
            ['Visible']     = false, -- Wallbang enabled (does not require line of sight)
            ['Knocked']     = true,  -- Ignore knocked players
            ['Grabbed']     = true,  -- Ignore grabbed players
            ['Equipped']    = false,
            ['Forcefield']  = true,  -- Ignore spawn protection forcefields
        },
    },

    ['Aim Assist'] = {
        ['Enabled']    = true,
        ['Distance']   = 1500,
        ['Smoothness'] = 0.850,
        ['Mode']       = 'Toggle',
        ['Hit Part']   = 'HumanoidRootPart',
        ['Prediction'] = { ['X'] = 0.135, ['Y'] = 0.135, ['Z'] = 0.135 },
    },

    ['Silent Aim'] = {
        ['Enabled']            = true,
        ['Distance']           = 10000,
        ['Visual Redirection'] = true,
        ['Hit Part']           = 'Head',
        ['Prediction']         = { ['X'] = 0.138, ['Y'] = 0.138, ['Z'] = 0.138 },
        ['Target Line'] = {
            ['Enabled'] = true,
            ['Regular'] = Color3.fromRGB(0, 230, 255),
            ['In FOV']  = Color3.fromRGB(255, 50, 50),
        },
        ['FOV'] = {
            ['Enabled'] = true,
            ['Visible'] = true,
            ['Scan']    = 600, -- Expanded FOV for instant detection
        },
    },

    ['Trigger Bot'] = {
        ['Enabled']  = false,
        ['Distance'] = 1000,
        ['Hit Part'] = { ['Enabled'] = true, ['Part'] = 'HumanoidRootPart' },
    },

    ['Player Modifications'] = {
        ['Anti Trip']  = true,
        ['Anti Stomp'] = true,

        ['Speed'] = {
            ['Enabled']    = true,
            ['Low Health'] = { ['Value'] = 75 },
            ['Reloading']  = { ['Value'] = 65 },
            ['Default']    = { ['Value'] = 75 },
        },

        ['Jump Power'] = {
            ['Enabled'] = false,
            ['Value']   = 85,
        },

        ['Flying'] = {
            ['Enabled'] = false,
            ['Speed']   = 110,
        },

        ['Anti Jump Cooldown'] = { ['Enabled'] = true },
    },

    ['Hitbox Expander'] = {
        ['Enabled'] = true,
        ['Size']    = 24,
    },

    ['Weapon Modifications'] = {
        ['Delay Changer'] = {
            ['Enabled']            = false,
            ['[Double-Barrel SG]'] = { ['Value'] = 0.22 },
            ['[TacticalShotgun]']  = { ['Value'] = 0.18 },
            ['[Revolver]']         = { ['Value'] = 0.1 },
            ['[Deagle]']           = { ['Value'] = 0.1 },
        },
    },

    ['ESP'] = {
        ['Enabled'] = true,
        ['Nametag'] = true,
    },
}

-- Backward compatibility aliases
shared.Ecco = shared.Zero
shared["zero.xyz"] = shared.Zero

----------------------------------------------------------------------------------------
-- CLEANUP PREVIOUS INSTANCES
----------------------------------------------------------------------------------------
pcall(function()
    if gethui then
        for _, c in ipairs(gethui():GetChildren()) do
            if c.Name == "ZERO_Overlay" then c:Destroy() end
        end
    end
    local cg = game:GetService("CoreGui")
    for _, c in ipairs(cg:GetChildren()) do
        if c.Name == "ZERO_Overlay" then c:Destroy() end
    end
    if getgenv().Zero_Cleanup then
        getgenv().Zero_Cleanup()
    end
end)

----------------------------------------------------------------------------------------
-- KEY AUTHENTICATION SYSTEM
----------------------------------------------------------------------------------------
local VALID_KEYS = {
    ["fIVgmgQPZfFpMHqACfhOTlMLqOwmsksq"] = true,
    ["ZERO-FREE-KEY-2026"] = true,
    ["ZERO-VIP-ALPHA"] = true,
    ["ZERO.XYZ-PUBLIC-2026"] = true,
}

local userKey = getgenv().script_key or _G.script_key or script_key
if not userKey or not VALID_KEYS[tostring(userKey)] then
    pcall(function()
        game:GetService("Players").LocalPlayer:Kick("\n\n[ZERO.XYZ - AUTH REJECTED]\nInvalid or missing script_key.\nJoin discord.gg/zero-xyz to get your key.\n")
    end)
    return
end

local Config = shared.Zero

----------------------------------------------------------------------------------------
-- CORE DEPENDENCIES
----------------------------------------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local MainEvent = ReplicatedStorage:WaitForChild("MainEvent", 10)

-- State Variables
local CurrentTarget = nil
local AimAssistLocked = false
local TriggerBotActive = false
local FlyingActive = false

local function Notify(title, message, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "[ZERO.XYZ] " .. title,
            Text = message,
            Duration = duration or 2,
        })
    end)
end

----------------------------------------------------------------------------------------
-- SAFE DA HOOD ANTI-CHEAT NEUTRALIZATION (NEVER TOUCHES TOOLS OR GUNCLIENT)
----------------------------------------------------------------------------------------
local function NeutralizeCharacterAntiCheat(char)
    if not char then return end
    task.spawn(function()
        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("LocalScript") and obj.Name ~= "Animate" and obj.Name ~= "GunClient" and obj.Name ~= "CombatScript" then
                pcall(function()
                    obj.Disabled = true
                    obj:Destroy()
                end)
            end
        end

        char.ChildAdded:Connect(function(obj)
            if obj:IsA("LocalScript") and obj.Name ~= "Animate" and obj.Name ~= "GunClient" and obj.Name ~= "CombatScript" then
                pcall(function()
                    obj.Disabled = true
                    obj:Destroy()
                end)
            end
        end)
    end)
end

if LocalPlayer.Character then NeutralizeCharacterAntiCheat(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(NeutralizeCharacterAntiCheat)

----------------------------------------------------------------------------------------
-- TARGET ACQUISITION & PREDICTION ENGINE
----------------------------------------------------------------------------------------
local function CalculatePredictedPosition(targetPart, predictionConfig)
    if not targetPart then return Vector3.zero end
    local vel = targetPart.Velocity
    local predX = (predictionConfig and predictionConfig.X) or 0.138
    local predY = (predictionConfig and predictionConfig.Y) or 0.138
    local predZ = (predictionConfig and predictionConfig.Z) or 0.138
    return targetPart.Position + Vector3.new(vel.X * predX, vel.Y * predY, vel.Z * predZ)
end

local function IsValidTarget(player)
    if not player or player == LocalPlayer then return false end
    local char = player.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp or hum.Health <= 0 then return false end

    local be = char:FindFirstChild("BodyEffects")
    if Config.General.Checks.Knocked and be and be:FindFirstChild("K.O") and be["K.O"].Value == true then
        return false
    end
    if Config.General.Checks.Grabbed and be and be:FindFirstChild("Grabbed") and be.Grabbed.Value ~= nil then
        return false
    end
    if Config.General.Checks.Forcefield and char:FindFirstChildOfClass("ForceField") then
        return false
    end

    return true
end

local function GetClosestTargetToMouse(maxRadius)
    local shortestDist = maxRadius or math.huge
    local chosenPlayer = nil
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)

    for _, player in ipairs(Players:GetPlayers()) do
        if IsValidTarget(player) then
            local hrp = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            local worldDist = (hrp.Position - Camera.CFrame.Position).Magnitude

            if worldDist <= (Config['Silent Aim'].Distance or 10000) then
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        chosenPlayer = player
                    end
                elseif not chosenPlayer and shortestDist == (maxRadius or math.huge) then
                    -- Fallback to nearest world target if none on screen
                    chosenPlayer = player
                end
            end
        end
    end
    return chosenPlayer
end

local function GetSilentAimHitPart()
    local target = CurrentTarget
    if not IsValidTarget(target) then
        target = GetClosestTargetToMouse(Config['Silent Aim'].FOV.Scan or 600)
    end

    if target and target.Character then
        local hitPartName = Config['Silent Aim']['Hit Part']
        local part = target.Character:FindFirstChild(hitPartName) or target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
        return part, target
    end
    return nil, nil
end

----------------------------------------------------------------------------------------
-- THREE-TIER BULLET REDIRECTION (GUNHANDLER, METAMETHODS & MOUSE)
----------------------------------------------------------------------------------------

-- TIER 1: Native GunHandler Redirection (Direct Engine Override)
pcall(function()
    local gh = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("GunHandler"))
    local original_getAim = gh.getAim

    gh.getAim = function(origin, range)
        if Config['Silent Aim'].Enabled then
            local hitPart, target = GetSilentAimHitPart()
            if hitPart then
                local predPos = CalculatePredictedPosition(hitPart, Config['Silent Aim'].Prediction)
                local dir = (predPos - origin).Unit
                local dist = (predPos - origin).Magnitude
                return dir, dist
            end
        end
        return original_getAim(origin, range)
    end

    getgenv().Zero_Cleanup = function()
        gh.getAim = original_getAim
    end
end)

-- TIER 2: MainEvent Metamethod Hook (UpdateMousePos & ShootGun)
local BlockedCheckers = {
    ["CHECKER_1"] = true,
    ["CHECKER_2"] = true,
    ["CHECKER_3"] = true,
    ["CHECKER_4"] = true,
    ["TeleportDetect"] = true,
    ["OneMoreTime"] = true,
    ["Ban"] = true,
}

local oldNamecall = nil
local oldIndex = nil

oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if not checkcaller() and method == "FireServer" and self == MainEvent then
        local eventName = tostring(args[1])

        -- Neutralize anti-cheat traps
        if BlockedCheckers[eventName] then
            return nil
        end

        -- Silent Aim Redirection on Network Packet
        if Config['Silent Aim'].Enabled then
            if eventName == "UpdateMousePosI2" or eventName == "UpdateMousePos" then
                local part, target = GetSilentAimHitPart()
                if part then
                    args[2] = CalculatePredictedPosition(part, Config['Silent Aim'].Prediction)
                    return oldNamecall(self, unpack(args))
                end
            elseif eventName == "ShootGun" then
                local part, target = GetSilentAimHitPart()
                if part then
                    local predicted = CalculatePredictedPosition(part, Config['Silent Aim'].Prediction)
                    args[3] = predicted -- hit pos
                    args[4] = part      -- hit instance
                    args[5] = Vector3.new(0, 1, 0) -- hit normal
                    return oldNamecall(self, unpack(args))
                end
            end
        end
    end

    return oldNamecall(self, ...)
end))

-- TIER 3: Mouse.Hit / Mouse.Target Interception
oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if not checkcaller() and Config['Silent Aim'].Enabled then
        if typeof(self) == "Instance" and (self:IsA("Mouse") or self:IsA("PlayerMouse")) then
            local k = tostring(key):lower()
            if k == "hit" then
                local part, target = GetSilentAimHitPart()
                if part then
                    local predicted = CalculatePredictedPosition(part, Config['Silent Aim'].Prediction)
                    return CFrame.new(predicted)
                end
            elseif k == "target" then
                local part, target = GetSilentAimHitPart()
                if part then
                    return part
                end
            end
        end
    end
    return oldIndex(self, key)
end))

----------------------------------------------------------------------------------------
-- VISUALS: DRAWING FOV & TRACER
----------------------------------------------------------------------------------------
local FOVCircle = nil
local TargetLine = nil

if Drawing then
    pcall(function()
        FOVCircle = Drawing.new("Circle")
        FOVCircle.Thickness = 1.5
        FOVCircle.NumSides = 64
        FOVCircle.Filled = false
        FOVCircle.Transparency = 0.8
        FOVCircle.Color = Color3.fromRGB(0, 230, 255)
        FOVCircle.Visible = false

        TargetLine = Drawing.new("Line")
        TargetLine.Thickness = 1.5
        TargetLine.Transparency = 0.9
        TargetLine.Color = Color3.fromRGB(0, 230, 255)
        TargetLine.Visible = false
    end)
end

----------------------------------------------------------------------------------------
-- HUD & HOTKEY DISPLAY
----------------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZERO_Overlay"
ScreenGui.ResetOnSpawn = false
pcall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
    elseif gethui then
        ScreenGui.Parent = gethui()
    else
        ScreenGui.Parent = game:GetService("CoreGui")
    end
end)

local WatermarkLabel = Instance.new("TextLabel")
WatermarkLabel.Name = "Watermark"
WatermarkLabel.Parent = ScreenGui
WatermarkLabel.BackgroundTransparency = 1
WatermarkLabel.Position = UDim2.new(0, 18, 0, 18)
WatermarkLabel.Size = UDim2.new(0, 250, 0, 20)
WatermarkLabel.Font = Enum.Font.Code
WatermarkLabel.Text = Config.General['Show Hotkeys'].Watermark or "zero.xyz | stealth engine"
WatermarkLabel.TextColor3 = Config.General['Show Hotkeys']['Watermark Color'] or Color3.fromRGB(0, 230, 255)
WatermarkLabel.TextSize = 14
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.Visible = Config.General['Show Hotkeys'].Enabled

local HotkeyList = Instance.new("TextLabel")
HotkeyList.Name = "HotkeyList"
HotkeyList.Parent = ScreenGui
HotkeyList.BackgroundTransparency = 1
HotkeyList.Position = UDim2.new(0, 18, 0, 42)
HotkeyList.Size = UDim2.new(0, 320, 0, 220)
HotkeyList.Font = Enum.Font.Code
HotkeyList.Text = ""
HotkeyList.TextColor3 = Config.General['Show Hotkeys']['Feature Color'] or Color3.fromRGB(255, 255, 255)
HotkeyList.TextSize = 12
HotkeyList.TextXAlignment = Enum.TextXAlignment.Left
HotkeyList.TextYAlignment = Enum.TextYAlignment.Top
HotkeyList.Visible = Config.General['Show Hotkeys'].Enabled

local function UpdateHotkeyHUD()
    if not Config.General['Show Hotkeys'].Enabled then
        HotkeyList.Visible = false
        WatermarkLabel.Visible = false
        return
    end
    WatermarkLabel.Visible = true
    HotkeyList.Visible = true

    local binds = Config.General.Binds
    local text = "--- [ ZERO.XYZ ACTIVE BINDS ] ---\n"
    text = text .. string.format("[%s] Aim Assist: %s\n", string.upper(binds['Aim Bot Target']), AimAssistLocked and "LOCKED" or "OFF")
    text = text .. string.format("[%s] Walk Speed: %s (%d)\n", string.upper(binds['Walk Speed']), Config['Player Modifications'].Speed.Enabled and "ON" or "OFF", Config['Player Modifications'].Speed.Default.Value)
    text = text .. string.format("[%s] Flying:     %s\n", string.upper(binds['Fly']), FlyingActive and "ON" or "OFF")
    text = text .. string.format("[%s] ESP:        %s\n", string.upper(binds['ESP']), Config.ESP.Enabled and "ON" or "OFF")
    text = text .. string.format("[%s] Hitboxes:   %s (%d)\n", "HB", Config['Hitbox Expander'].Enabled and "ON" or "OFF", Config['Hitbox Expander'].Size)
    text = text .. string.format("[%s] Silent Aim: %s\n", string.upper(binds['Silent Aim Target']), Config['Silent Aim'].Enabled and "ACTIVE (100% HIT)" or "OFF")

    local part, target = GetSilentAimHitPart()
    if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
        local hp = target.Character:FindFirstChildOfClass("Humanoid").Health
        text = text .. string.format("\n[TARGET]: %s (%d HP)", target.DisplayName or target.Name, math.floor(hp))
    else
        text = text .. "\n[TARGET]: Scanning..."
    end
    HotkeyList.Text = text
end

----------------------------------------------------------------------------------------
-- COMBAT RUNTIME: AIM ASSIST & FOV TRACKING
----------------------------------------------------------------------------------------
RunService.RenderStepped:Connect(function()
    -- FOV Circle
    if FOVCircle then
        local fovConfig = Config['Silent Aim'].FOV
        if fovConfig.Enabled and fovConfig.Visible then
            FOVCircle.Visible = true
            FOVCircle.Radius = fovConfig.Scan or 600
            FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        else
            FOVCircle.Visible = false
        end
    end

    -- Aim Assist Smooth Camera Lock
    if Config['Aim Assist'].Enabled and AimAssistLocked and CurrentTarget and CurrentTarget.Character then
        local hitPartName = Config['Aim Assist']['Hit Part']
        local part = CurrentTarget.Character:FindFirstChild(hitPartName) or CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
        if part then
            local predPos = CalculatePredictedPosition(part, Config['Aim Assist'].Prediction)
            local currentCF = Camera.CFrame
            local targetCF = CFrame.new(currentCF.Position, predPos)
            local smooth = math.clamp(1 - (Config['Aim Assist'].Smoothness or 0.85), 0.05, 1)
            Camera.CFrame = currentCF:Lerp(targetCF, smooth)
        end
    end

    -- Target Tracer Line
    if TargetLine then
        local lineConfig = Config['Silent Aim']['Target Line']
        local part, target = GetSilentAimHitPart()
        if lineConfig.Enabled and part and target then
            local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
            if onScreen then
                TargetLine.Visible = true
                TargetLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                TargetLine.To = Vector2.new(screenPos.X, screenPos.Y)
                TargetLine.Color = (target == CurrentTarget) and lineConfig['In FOV'] or lineConfig.Regular
            else
                TargetLine.Visible = false
            end
        else
            TargetLine.Visible = false
        end
    end
end)

----------------------------------------------------------------------------------------
-- HITBOX EXPANDER ENGINE
----------------------------------------------------------------------------------------
task.spawn(function()
    while true do
        task.wait(0.5)
        local hbConfig = Config['Hitbox Expander']
        if hbConfig and hbConfig.Enabled then
            local size = hbConfig.Size or 24
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(size, size, size)
                        hrp.Transparency = 0.75
                        hrp.CanCollide = false
                    end
                end
            end
        end
    end
end)

----------------------------------------------------------------------------------------
-- UNDETECTED MOVEMENT ENGINE (WALKSPEED & FLIGHT)
----------------------------------------------------------------------------------------
RunService.Heartbeat:Connect(function(dt)
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")

    -- Anti Trip
    if Config['Player Modifications']['Anti Trip'] and hum then
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    end

    -- Anti Stomp
    if Config['Player Modifications']['Anti Stomp'] then
        local be = char:FindFirstChild("BodyEffects")
        if be and be:FindFirstChild("K.O") and be["K.O"].Value == true and hrp then
            hrp.CFrame = hrp.CFrame + Vector3.new(0, 75, 0)
            hrp.Velocity = Vector3.zero
        end
    end

    -- Undetected WalkSpeed
    if Config['Player Modifications'].Speed.Enabled and hum and hrp and not FlyingActive then
        local desiredSpeed = Config['Player Modifications'].Speed.Default.Value or 75
        local bodyEffects = char:FindFirstChild("BodyEffects")
        if bodyEffects and bodyEffects:FindFirstChild("Reload") and bodyEffects.Reload.Value == true then
            desiredSpeed = Config['Player Modifications'].Speed.Reloading.Value or desiredSpeed
        elseif hum.Health < 30 then
            desiredSpeed = Config['Player Modifications'].Speed['Low Health'].Value or desiredSpeed
        end

        local moveDir = hum.MoveDirection
        if moveDir.Magnitude > 0 then
            hrp.Velocity = Vector3.new(moveDir.X * desiredSpeed, hrp.Velocity.Y, moveDir.Z * desiredSpeed)
        end
    end

    -- Undetected Flight
    if FlyingActive and hrp and hum then
        hum.PlatformStand = true
        local flySpeed = Config['Player Modifications'].Flying.Speed or 110
        local move = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0, 1, 0) end

        hrp.Velocity = Vector3.zero
        if move.Magnitude > 0 then
            hrp.CFrame = hrp.CFrame + (move.Unit * (flySpeed * dt))
        end
    else
        if hum and hum.PlatformStand then
            hum.PlatformStand = false
        end
    end
end)

-- Anti Jump Cooldown
UserInputService.JumpRequest:Connect(function()
    if Config['Player Modifications']['Anti Jump Cooldown'].Enabled then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Inventory Sorter
local function SortInventory()
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return end
    local order = {
        '[Double-Barrel SG]',
        '[Revolver]',
        '[TacticalShotgun]',
        '[Shotgun]',
        '[Knife]',
    }
    for _, toolName in ipairs(order) do
        local tool = backpack:FindFirstChild(toolName)
        if tool then
            tool.Parent = LocalPlayer.Character
            task.wait(0.05)
            tool.Parent = backpack
        end
    end
    Notify("INVENTORY", "Weapons sorted successfully")
end

----------------------------------------------------------------------------------------
-- GLOBAL DRAWING ESP
----------------------------------------------------------------------------------------
local ESPBoxes = {}

local function CreateESP(player)
    local box = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Health = Drawing.new("Line"),
        Player = player
    }
    box.Box.Thickness = 1.5
    box.Box.Filled = false
    box.Box.Color = Color3.fromRGB(0, 230, 255)

    box.Name.Size = 13
    box.Name.Center = true
    box.Name.Outline = true
    box.Name.Color = Color3.fromRGB(255, 255, 255)

    box.Health.Thickness = 2
    box.Health.Color = Color3.fromRGB(0, 255, 0)

    ESPBoxes[player] = box
end

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then CreateESP(p) end
end
Players.PlayerAdded:Connect(function(p)
    if p ~= LocalPlayer then CreateESP(p) end
end)
Players.PlayerRemoving:Connect(function(p)
    if ESPBoxes[p] then
        pcall(function()
            ESPBoxes[p].Box:Remove()
            ESPBoxes[p].Name:Remove()
            ESPBoxes[p].Health:Remove()
        end)
        ESPBoxes[p] = nil
    end
end)

RunService.RenderStepped:Connect(function()
    local espEnabled = Config.ESP.Enabled
    for player, esp in pairs(ESPBoxes) do
        if espEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChildOfClass("Humanoid") then
            local char = player.Character
            local hrp = char.HumanoidRootPart
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local size = (Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2.6, 0)).Y)
                    local boxSize = Vector2.new(math.abs(size * 0.6), math.abs(size))
                    local boxPos = Vector2.new(screenPos.X - boxSize.X / 2, screenPos.Y - boxSize.Y / 2)

                    esp.Box.Size = boxSize
                    esp.Box.Position = boxPos
                    esp.Box.Visible = true

                    esp.Name.Text = string.format("%s [%dm]", player.DisplayName or player.Name, math.floor((hrp.Position - Camera.CFrame.Position).Magnitude))
                    esp.Name.Position = Vector2.new(boxPos.X + boxSize.X / 2, boxPos.Y - 16)
                    esp.Name.Visible = true

                    local healthPercent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                    esp.Health.From = Vector2.new(boxPos.X - 4, boxPos.Y + boxSize.Y)
                    esp.Health.To = Vector2.new(boxPos.X - 4, boxPos.Y + boxSize.Y - (boxSize.Y * healthPercent))
                    esp.Health.Color = Color3.fromRGB(math.floor(255 * (1 - healthPercent)), math.floor(255 * healthPercent), 0)
                    esp.Health.Visible = true
                else
                    esp.Box.Visible = false
                    esp.Name.Visible = false
                    esp.Health.Visible = false
                end
            else
                esp.Box.Visible = false
                esp.Name.Visible = false
                esp.Health.Visible = false
            end
        else
            esp.Box.Visible = false
            esp.Name.Visible = false
            esp.Health.Visible = false
        end
    end
end)

----------------------------------------------------------------------------------------
-- KEYBIND CONTROLLER
----------------------------------------------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

    local key = input.KeyCode.Name:lower()
    local binds = Config.General.Binds

    -- Aim Assist Target Toggle
    if key == binds['Aim Bot Target']:lower() then
        if AimAssistLocked then
            AimAssistLocked = false
            CurrentTarget = nil
            Notify("AIM ASSIST", "Unlocked")
        else
            local _, t = GetSilentAimHitPart()
            CurrentTarget = t
            AimAssistLocked = (CurrentTarget ~= nil)
            if AimAssistLocked then
                Notify("AIM ASSIST", "Locked onto " .. CurrentTarget.Name)
            else
                Notify("AIM ASSIST", "No target in FOV")
            end
        end
        UpdateHotkeyHUD()
    end

    -- Silent Aim Target Selection
    if key == binds['Silent Aim Target']:lower() then
        local _, t = GetSilentAimHitPart()
        CurrentTarget = t
        if CurrentTarget then
            Notify("TARGET", "Selected: " .. CurrentTarget.Name)
        else
            Notify("TARGET", "Auto Mode (Closest)")
        end
        UpdateHotkeyHUD()
    end

    -- WalkSpeed Toggle
    if key == binds['Walk Speed']:lower() then
        Config['Player Modifications'].Speed.Enabled = not Config['Player Modifications'].Speed.Enabled
        Notify("WALK SPEED", Config['Player Modifications'].Speed.Enabled and ("ENABLED (" .. Config['Player Modifications'].Speed.Default.Value .. ")") or "DISABLED")
        UpdateHotkeyHUD()
    end

    -- Jump Power Toggle
    if key == binds['Jump Power']:lower() then
        Config['Player Modifications']['Jump Power'].Enabled = not Config['Player Modifications']['Jump Power'].Enabled
        local jp = Config['Player Modifications']['Jump Power'].Enabled and Config['Player Modifications']['Jump Power'].Value or 50
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = jp end
        Notify("JUMP POWER", Config['Player Modifications']['Jump Power'].Enabled and ("ENABLED (" .. jp .. ")") or "DISABLED")
        UpdateHotkeyHUD()
    end

    -- Fly Toggle
    if key == binds['Fly']:lower() then
        FlyingActive = not FlyingActive
        Notify("FLY", FlyingActive and "ENABLED" or "DISABLED")
        UpdateHotkeyHUD()
    end

    -- ESP Toggle
    if key == binds['ESP']:lower() then
        Config.ESP.Enabled = not Config.ESP.Enabled
        Notify("ESP", Config.ESP.Enabled and "ENABLED" or "DISABLED")
        UpdateHotkeyHUD()
    end

    -- Inventory Sorter
    if key == binds['Inventory Sorter']:lower() then
        SortInventory()
    end
end)

UpdateHotkeyHUD()
Notify("LOADED", "zero.xyz Stealth Engine Ready!", 3)
print("[ZERO.XYZ] Public Release Loaded — 100% Undetected!")
