--[[
    ========================================================================================
    ECCO .CLUB — DA HOOD COMPLETE SUITE
    Recreated for Volt / Modern Luau Execution Environments
    ========================================================================================
]]

script_key = script_key or "fIVgmgQPZfFpMHqACfhOTlMLqOwmsksq"

shared.Ecco = shared.Ecco or {
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
            ['Brand Color']     = Color3.fromRGB(255, 255, 255),
            ['Feature Color']   = Color3.fromRGB(255, 255, 255),
            ['Target Color']    = Color3.fromRGB(100, 255, 100),
            ['Watermark']       = 'ecco on top',
            ['Watermark Color'] = Color3.fromRGB(0, 0, 0),
        },

        ['Checks'] = {
            ['Visible']     = true,
            ['Knocked']     = true,
            ['Grabbed']     = true,
            ['Equipped']    = false, -- Prevents crashes when holding Combat/Fists
            ['Forcefield']  = true,
        },
    },

    ['Aim Assist'] = {
        ['Enabled']    = true,
        ['Distance']   = 1500,
        ['Smoothness'] = 0.850,
        ['Mode']       = 'Toggle',

        ['Easing'] = {
            ['Style']     = 'Sine',
            ['Direction'] = 'InOut',
        },

        ['Hit Part'] = 'HumanoidRootPart',
        ['Closest Point'] = {
            ['Mode']  = 'Regular',
            ['Scale'] = 40,
        },

        ['Prediction'] = {
            ['X'] = 0.135,
            ['Y'] = 0.135,
            ['Z'] = 0.135,
            ['Clamp Y Axis'] = {
                ['Override'] = 'Partial',
            },
        },
    },

    ['Silent Aim'] = {
        ['Enabled']            = true,
        ['Distance']           = 10000,
        ['Visual Redirection'] = true,

        ['Anti Curve'] = {
            ['Enabled']   = true,
            ['Visualize'] = true,
            ['Max Angle'] = 25,
        },

        ['Hit Part'] = 'Head',
        ['Closest Point'] = {
            ['Mode']  = 'Regular',
            ['Scale'] = 95,
        },

        ['Prediction'] = {
            ['X'] = 0.138,
            ['Y'] = 0.138,
            ['Z'] = 0.138,
            ['Y Axis'] = {
                ['Override'] = 'Full',
            },
        },

        ['Target Line'] = {
            ['Enabled'] = false,
            ['Regular'] = Color3.fromRGB(255, 255, 255),
            ['In FOV']  = Color3.fromRGB(255, 0, 0),
        },

        ['FOV'] = {
            ['Enabled'] = true,
            ['Visible'] = false,
            ['Scan']    = 250,
            ['Method']  = 'Automatic',
            ['Ignore']  = true,
            ['Mode'] = {
                ['Type'] = 'Circle',
                ['Mode'] = 'Circle',
                ['Size'] = {
                    ['Circle']  = 250,
                    ['2D_Box']  = {100, 100},
                    ['3D_Box']  = {2, 2, 2},
                },
            },
        },
    },

    ['Trigger Bot'] = {
        ['Enabled']  = true,
        ['Mode']     = 'Hitbox',
        ['Distance'] = 1000,
        ['Cooldown'] = 0,

        ['Activation'] = {
            ['Mode'] = 'Keybind',
            ['Type'] = 'Hold',
        },

        ['Hit Part'] = {
            ['Enabled'] = true,
            ['Part']    = 'HumanoidRootPart',
        },

        ['Prediction'] = {
            ['X'] = 0.135,
            ['Y'] = 0.135,
            ['Z'] = 0.135,
        },

        ['FOV'] = {
            ['Enabled'] = true,
            ['Visible'] = false,
            ['Scan']    = math.huge,
            ['Sync']    = false,
            ['2D_Box']  = {50, 50},
        },
    },

    ['Player Modifications'] = {
        ['Anti Trip']  = true,
        ['Anti Stomp'] = false,

        ['Speed'] = {
            ['Enabled']    = false,
            ['Low Health'] = {['Value'] = 16},
            ['Reloading']  = {['Value'] = 16},
            ['Default']    = {['Value'] = 16},
        },

        ['Jump Power'] = {
            ['Enabled'] = false,
            ['Value']   = 50,
        },

        ['Flying'] = {
            ['Enabled'] = false,
            ['Speed']   = 100,
        },

        ['Anti Jump Cooldown'] = {
            ['Enabled'] = true,
        },

        ['Panic Ground'] = {
            ['Enabled'] = false,
        },

        ['Wall Hop'] = {
            ['Enabled']        = true, 
            ['Jump Strength']  = 50,
            ['Knife Strength'] = 60,
        },
    },

    ['Weapon Modifications'] = {
        ['Spread Changer'] = {
            ['Enabled']            = true,
            ['[Double-Barrel SG]'] = {['Value'] = 0.7},
            ['[TacticalShotgun]']  = {['Value'] = 0.7},
            ['[Shotgun]']          = {['Value'] = 0.7},
        },

        ['Double Tap'] = {
            ['Enabled']    = false,
            ['[Revolver]'] = {['Value'] = true},
            ['[Silencer]'] = {['Value'] = false},
            ['[Glock]']    = {['Value'] = false},
        },

        ['Delay Changer'] = {
            ['Enabled']            = true,
            ['[Double-Barrel SG]'] = {['Value'] = 0.22},
            ['[TacticalShotgun]']  = {['Value'] = 0.18},
            ['[Revolver]']         = {['Value'] = 0},
            ['[Deagle]']           = {['Value'] = 0},
        },
    },

    ['Weapon Override'] = {
        ['Enabled'] = true,
        ['Weapons'] = {
            ['[Double-Barrel SG]'] = { 'Full' },
            ['[Revolver]']         = { 'Full' },
            ['[TacticalShotgun]']  = { 'Full' },
            ['[LMG]']              = { 'Full' },
        },
    },

    ['Inventory Sorter'] = {
        ['Enabled'] = true,
        ['Order'] = {
            '[Double-Barrel SG]',
            '[Revolver]',
            '[TacticalShotgun]',
            '[Knife]',
        },
    },

    ['Rage Mode'] = {
        ['Enabled']     = false,
        ['Mode']        = 'Rabbit',
        ['Visualize']   = false,
        ['Full Damage'] = false,
    },

    ['Hitbox Expander'] = {
        ['Enabled'] = true,
        ['Size']    = 32,
        ['Link']    = false,
    },

    ['Future'] = {
        ['Enabled'] = true,
        ['Flow']    = 12,
        ['Sanity']  = 2,
        ['Bait']    = 12,
    },

    ['Hood Customs'] = {
        ['Force Hit'] = true,
        ['Cooldown']  = 0.05,
    },

    ['ESP'] = {
        ['Enabled'] = false,
        ['Nametag'] = false,
        ['Normal']  = Color3.fromRGB(255, 255, 255),
        ['Target']  = Color3.fromRGB(255, 100, 100),
    },

    ['Visualization'] = {
        ['Load Check'] = false,
        ['Global ESP'] = {
            ['Enabled']           = false,
            ['Team Check']        = false,
            ['Max Draw Distance'] = math.huge,
            ['Text Size']         = 13,
            ['Text Font']         = 'Smallest Pixel',
            ['Fade Effect'] = {
                ['On Distance'] = false,
            },
            ['Drawing'] = {
                ['Names'] = {
                    ['Enabled'] = false,
                    ['Color']   = Color3.fromRGB(227, 180, 206),
                },
                ['Distance'] = {
                    ['Enabled'] = false,
                    ['Docked']  = true,
                    ['Color']   = Color3.fromRGB(175, 194, 223),
                },
                ['Health'] = {
                    ['Enabled']        = false,
                    ['Text']           = false,
                    ['Position']       = 'Left',
                    ['Health Based']   = false,
                    ['Text Color']     = Color3.fromRGB(195, 193, 239),
                    ['Width']          = 1.5,
                    ['Gradient']       = true,
                    ['Alpha Color']    = Color3.fromRGB(189, 185, 235),
                    ['Depth Color']    = Color3.fromRGB(239, 193, 193),
                    ['Color Keypoint'] = Color3.fromRGB(202, 219, 247),
                },
                ['Boxes'] = {
                    ['Enabled']  = false,
                    ['Box Type'] = 'Corner',
                    ['Bounding Box'] = {
                        ['Animate']            = false,
                        ['Animate Speed']      = 360,
                        ['Gradient']           = false,
                        ['Alpha Color']        = Color3.fromRGB(205, 160, 227),
                        ['Depth Color']        = Color3.fromRGB(204, 177, 188),
                        ['Filled Color Scheme'] = false,
                        ['Fill Color']         = Color3.fromRGB(204, 244, 215),
                        ['Fill Glow']          = Color3.fromRGB(226, 191, 188),
                        ['Filled'] = {
                            ['Enabled']      = false,
                            ['Transparency'] = 0.75,
                            ['Color']        = Color3.fromRGB(193, 177, 214),
                        },
                    },
                    ['Corner'] = {
                        ['Color'] = Color3.fromRGB(226, 181, 181),
                    },
                },
            },
        },
        ['Crosshair'] = {
            ['Visible']        = false,
            ['Stutter']        = 0,
            ['Docked']         = false,
            ['Width']          = 1.5,
            ['Length']         = 15,
            ['Radius']         = 5,
            ['Color']          = Color3.fromRGB(180, 207, 227),
            ['Rotate']         = true,
            ['Rotate Speed']   = 150,
            ['Max Angle']      = 360,
            ['Lerp Style']     = Enum.EasingStyle.Linear,
            ['Fluctuate']      = true,
            ['Fluctuate Speed'] = 150,
            ['Fluctuate Min']  = 5,
            ['Fluctuate Max']  = 22,
            ['Labels'] = {
                ['Name'] = {
                    ['Visible'] = false,
                    ['Text']    = 'Ecco',
                    ['Color']   = Color3.fromRGB(180, 207, 227),
                },
                ['Extension'] = {
                    ['Visible'] = false,
                    ['Text']    = '.Club',
                    ['Color']   = Color3.fromRGB(180, 207, 227),
                },
                ['Current Target'] = {
                    ['Visible'] = false,
                    ['Color']   = Color3.fromRGB(255, 255, 255),
                },
                ['Current Target Health'] = {
                    ['Visible'] = false,
                    ['Color']   = Color3.fromRGB(165, 255, 191),
                },
            },
        },
    },

    ['Skin Modifications'] = {
        ['Da Hood']      = true,
        ['Dee Hood']     = false,
        ['Hood Customs'] = false,
        ['Unlock All']   = true,
        ['Selected Weapons'] = {
            ['[Revolver]']         = 'Golden Age',
            ['[Double-Barrel SG]'] = 'Galaxy',
            ['[TacticalShotgun]']  = 'Luck',
            ['[Knife]']            = 'Golden Age Tanto',
        },
    },

    ['Da Hood'] = {
        ['Armor Aura'] = {
            ['Enabled']  = false,
            ['Distance'] = 100,
        },
        ['Wall Bang'] = {
            ['Enabled']  = true,
            ['Distance'] = 200,
            ['Hit Part'] = 'HumanoidRootPart',
        },
    },

    ['Das Hood'] = {
        ['Infinite Range'] = {
            ['Enabled'] = true,
            ['Range']   = 10e10,
        },
    },

    ['Des Hood'] = {
        ['Wall Bang']      = {['Enabled'] = true},
        ['Infinite Range'] = {['Enabled'] = true, ['Range'] = 9e9},
    },

    ['Der Hood'] = {
        ['Wall Bang']      = {['Enabled'] = true},
        ['Infinite Range'] = {['Enabled'] = true, ['Range'] = 9e9},
    },

    ['Safety Mode'] = {
        ['Enabled']     = false,
        ['Crew Mode']   = false,
        ['Friend Mode'] = false,
        ['Crew ID']     = 4705120,
        ['Tryouts Mode'] = {
            ['Enabled'] = false,
        },
        ['Report Detector'] = {
            ['Enabled']     = true,
            ['Auto Kick']   = true,
            ['Report Back'] = true,
        },
    },

    ['Anti Future'] = {
        ['Enabled']      = true,
        ['Visible']      = false,
        ['Detection']    = 27,
        ['Still']        = false,
        ['Above']        = true,
        ['Above Height'] = 36,
        ['Behind']       = true,
        ['Color']        = {255, 255, 255, Rainbow = false},
    },

    ['Character Spoofing'] = {
        ['Body Spoofer'] = {
            ['Enabled']    = false,
            ['Memory']     = false,
            ['Korblox']    = false,
            ['Headless']   = false,
            ['Animations'] = false,
        },
        ['Hat Spoofer'] = {
            ['Enabled']        = false,
            ['Apply Respawn']  = true,
            ['Remove Active']  = false,
            ['List']           = {89171071, 172309919, 187848395, 398674411},
        },
        ['Avatar Spoofer'] = {
            ['Enabled']       = true,
            ['Apply Respawn'] = true,
            ['User']          = '665640628',
            ['Copy Emotes']   = true,
            ['Morph Spoofer'] = {
                ['Enabled'] = false,
                ['Mode']    = 'Default',
            },
            ['Animation Spoofer'] = {
                ['Enabled'] = false,
                ['Animations'] = {
                    ['Idle'] = 'Zombie',
                    ['Jump'] = 'Ninja',
                    ['Walk'] = 'Zombie',
                    ['Run']  = 'Zombie',
                    ['Fall'] = 'Ninja',
                },
            },
        },
        ['Interface Spoofer'] = {
            ['Enabled'] = false,
            ['User']    = '10400567910',
        },
    },
}

----------------------------------------------------------------------------------------
-- CORE INITIALIZATION & DEPENDENCIES
----------------------------------------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local MainEvent = ReplicatedStorage:WaitForChild("MainEvent", 10)

-- State Variables
local CurrentTarget = nil
local AimAssistLocked = false
local TriggerBotActive = false
local FlyingActive = false
local FlightBodyVelocity = nil
local FlightBodyGyro = nil

----------------------------------------------------------------------------------------
-- DRAWING FOV & VISUAL OVERLAYS
----------------------------------------------------------------------------------------
local FOVCircle = nil
local TargetLine = nil

if Drawing then
    pcall(function()
        FOVCircle = Drawing.new("Circle")
        FOVCircle.Thickness = 1.5
        FOVCircle.NumSides = 64
        FOVCircle.Filled = false
        FOVCircle.Transparency = 1
        FOVCircle.Color = Color3.fromRGB(255, 255, 255)
        FOVCircle.Visible = false

        TargetLine = Drawing.new("Line")
        TargetLine.Thickness = 1.5
        TargetLine.Transparency = 1
        TargetLine.Color = Color3.fromRGB(255, 255, 255)
        TargetLine.Visible = false
    end)
end

-- Watermark & Hotkey HUD
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Ecco_Overlay"
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
WatermarkLabel.Position = UDim2.new(0, 15, 0, 15)
WatermarkLabel.Size = UDim2.new(0, 200, 0, 20)
WatermarkLabel.Font = Enum.Font.Code
WatermarkLabel.Text = shared.Ecco.General['Show Hotkeys'].Watermark
WatermarkLabel.TextColor3 = shared.Ecco.General['Show Hotkeys']['Brand Color']
WatermarkLabel.TextSize = 14
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.Visible = shared.Ecco.General['Show Hotkeys'].Enabled

local HotkeyList = Instance.new("TextLabel")
HotkeyList.Name = "HotkeyList"
HotkeyList.Parent = ScreenGui
HotkeyList.BackgroundTransparency = 1
HotkeyList.Position = UDim2.new(0, 15, 0, 40)
HotkeyList.Size = UDim2.new(0, 300, 0, 150)
HotkeyList.Font = Enum.Font.Code
HotkeyList.Text = ""
HotkeyList.TextColor3 = shared.Ecco.General['Show Hotkeys']['Feature Color']
HotkeyList.TextSize = 12
HotkeyList.TextXAlignment = Enum.TextXAlignment.Left
HotkeyList.TextYAlignment = Enum.TextYAlignment.Top
HotkeyList.Visible = shared.Ecco.General['Show Hotkeys'].Enabled

local function UpdateHotkeyHUD()
    if not shared.Ecco.General['Show Hotkeys'].Enabled then
        HotkeyList.Visible = false
        WatermarkLabel.Visible = false
        return
    end
    WatermarkLabel.Visible = true
    HotkeyList.Visible = true
    local text = "--- [ Binds ] ---\n"
    for name, bind in pairs(shared.Ecco.General.Binds) do
        text = text .. string.format("[%s] : %s\n", string.upper(bind), name)
    end
    if CurrentTarget then
        text = text .. string.format("\nTarget: %s (%d HP)", CurrentTarget.Name, math.floor((CurrentTarget.Character and CurrentTarget.Character:FindFirstChild("Humanoid") and CurrentTarget.Character.Humanoid.Health) or 0))
    end
    HotkeyList.Text = text
end
UpdateHotkeyHUD()

----------------------------------------------------------------------------------------
-- UTILITY FUNCTIONS & SANITY CHECKS
----------------------------------------------------------------------------------------
local function IsAlive(player)
    if not player or not player.Character then return false end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    return humanoid and hrp and humanoid.Health > 0
end

local function PassesChecks(player)
    if not player or not player.Character then return false end
    local char = player.Character
    local checks = shared.Ecco.General.Checks

    -- ForceField check
    if checks.Forcefield and char:FindFirstChildOfClass("ForceField") then
        return false
    end

    local bodyEffects = char:FindFirstChild("BodyEffects")
    if bodyEffects then
        -- Knocked check
        if checks.Knocked then
            local ko = bodyEffects:FindFirstChild("K.O")
            if ko and ko.Value == true then return false end
        end

        -- Grabbed check
        if checks.Grabbed then
            local grabbed = bodyEffects:FindFirstChild("Grabbed")
            if grabbed and grabbed.Value ~= nil then return false end
        end
    end

    -- Visible raycast check
    if checks.Visible then
        local myChar = LocalPlayer.Character
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetHrp = char:FindFirstChild("HumanoidRootPart")
        if myHrp and targetHrp then
            local rayParams = RaycastParams.new()
            rayParams.FilterDescendantsInstances = {myChar, char, Workspace:FindFirstChild("Ignored")}
            rayParams.FilterType = Enum.RaycastFilterType.Exclude
            rayParams.IgnoreWater = true
            local hit = Workspace:Raycast(myHrp.Position, (targetHrp.Position - myHrp.Position).Unit * 1500, rayParams)
            if hit and not hit.Instance:IsDescendantOf(char) then
                return false
            end
        end
    end

    return true
end

local function GetClosestPlayerToCursor(fovRadius, maxDistance)
    local closestPlayer = nil
    local shortestDistance = fovRadius or math.huge
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and IsAlive(player) and PassesChecks(player) then
            local char = player.Character
            local hitPartName = shared.Ecco['Silent Aim']['Hit Part'] or "HumanoidRootPart"
            local part = char:FindFirstChild(hitPartName) or char:FindFirstChild("HumanoidRootPart")
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local distToMouse = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    local worldDist = (part.Position - Camera.CFrame.Position).Magnitude
                    if distToMouse < shortestDistance and (not maxDistance or worldDist <= maxDistance) then
                        shortestDistance = distToMouse
                        closestPlayer = player
                    end
                end
            end
        end
    end
    return closestPlayer
end

local function CalculatePredictedPosition(targetPart, predictionConfig)
    if not targetPart then return Vector3.zero end
    local vel = targetPart.Velocity
    local predX = predictionConfig.X or 0.138
    local predY = predictionConfig.Y or 0.138
    local predZ = predictionConfig.Z or 0.138
    return targetPart.Position + Vector3.new(vel.X * predX, vel.Y * predY, vel.Z * predZ)
end

----------------------------------------------------------------------------------------
-- METAMETHOD HOOKS (SILENT AIM & MOUSE INTERCEPTION)
----------------------------------------------------------------------------------------
local oldNamecall = nil
local oldIndex = nil

local function GetSilentAimHitPart()
    local target = CurrentTarget or GetClosestPlayerToCursor(shared.Ecco['Silent Aim'].FOV.Scan, shared.Ecco['Silent Aim'].Distance)
    if target and target.Character then
        local hitPartName = shared.Ecco['Silent Aim']['Hit Part']
        local part = target.Character:FindFirstChild(hitPartName) or target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
        return part, target
    end
    return nil, nil
end

oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if not checkcaller() and shared.Ecco['Silent Aim'].Enabled then
        if self == MainEvent and method == "FireServer" then
            local eventName = args[1]

            -- Intercept UpdateMousePos
            if eventName == "UpdateMousePos" then
                local part, target = GetSilentAimHitPart()
                if part then
                    local predicted = CalculatePredictedPosition(part, shared.Ecco['Silent Aim'].Prediction)
                    args[2] = predicted
                    return oldNamecall(self, unpack(args))
                end
            end

            -- Intercept ShootGun: (self, "ShootGun", handle, origin, hitPart, hitPos, hitNormal, serverTime)
            if eventName == "ShootGun" then
                local part, target = GetSilentAimHitPart()
                if part then
                    local predicted = CalculatePredictedPosition(part, shared.Ecco['Silent Aim'].Prediction)
                    args[4] = part
                    args[5] = predicted
                    args[6] = Vector3.new(0, 1, 0)
                    return oldNamecall(self, unpack(args))
                end
            end
        end
    end

    return oldNamecall(self, ...)
end))

oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if not checkcaller() and shared.Ecco['Silent Aim'].Enabled then
        if self == Mouse and (key == "Hit" or key == "Target") then
            local part, target = GetSilentAimHitPart()
            if part then
                local predicted = CalculatePredictedPosition(part, shared.Ecco['Silent Aim'].Prediction)
                if key == "Hit" then
                    return CFrame.new(predicted)
                elseif key == "Target" then
                    return part
                end
            end
        end
    end
    return oldIndex(self, key)
end))

----------------------------------------------------------------------------------------
-- AIM ASSIST (CAMERA LOCK & SMOOTH LERP)
----------------------------------------------------------------------------------------
RunService.RenderStepped:Connect(function(dt)
    -- Silent Aim FOV Circle Visualizer
    if FOVCircle then
        local fovConfig = shared.Ecco['Silent Aim'].FOV
        if fovConfig.Enabled and fovConfig.Visible then
            FOVCircle.Visible = true
            FOVCircle.Radius = fovConfig.Scan
            FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        else
            FOVCircle.Visible = false
        end
    end

    -- Aim Assist Smooth Camera Lerp
    if shared.Ecco['Aim Assist'].Enabled and AimAssistLocked and CurrentTarget and IsAlive(CurrentTarget) then
        local hitPartName = shared.Ecco['Aim Assist']['Hit Part']
        local part = CurrentTarget.Character:FindFirstChild(hitPartName) or CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
        if part then
            local predPos = CalculatePredictedPosition(part, shared.Ecco['Aim Assist'].Prediction)
            local currentCF = Camera.CFrame
            local targetCF = CFrame.new(currentCF.Position, predPos)
            local smoothness = math.clamp(1 - shared.Ecco['Aim Assist'].Smoothness, 0.01, 1)
            Camera.CFrame = currentCF:Lerp(targetCF, smoothness)
        end
    end

    -- Target Line Tracer
    if TargetLine then
        local lineConfig = shared.Ecco['Silent Aim']['Target Line']
        if lineConfig.Enabled and CurrentTarget and IsAlive(CurrentTarget) then
            local part = CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    TargetLine.Visible = true
                    TargetLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    TargetLine.To = Vector2.new(screenPos.X, screenPos.Y)
                    TargetLine.Color = lineConfig.Regular
                else
                    TargetLine.Visible = false
                end
            else
                TargetLine.Visible = false
            end
        else
            TargetLine.Visible = false
        end
    end
end)

----------------------------------------------------------------------------------------
-- TRIGGER BOT LOOP
----------------------------------------------------------------------------------------
task.spawn(function()
    while true do
        task.wait(0.05)
        if shared.Ecco['Trigger Bot'].Enabled and TriggerBotActive then
            local target = Mouse.Target
            if target and target.Parent then
                local player = Players:GetPlayerFromCharacter(target.Parent) or Players:GetPlayerFromCharacter(target.Parent.Parent)
                if player and player ~= LocalPlayer and IsAlive(player) and PassesChecks(player) then
                    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    end
                end
            end
        end
    end
end)

----------------------------------------------------------------------------------------
-- PLAYER & WEAPON MODIFICATIONS
----------------------------------------------------------------------------------------
-- Anti Trip
task.spawn(function()
    while true do
        task.wait(0.5)
        if shared.Ecco['Player Modifications']['Anti Trip'] and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end
        end
    end
end)

-- Hitbox Expander
task.spawn(function()
    while true do
        task.wait(1)
        if shared.Ecco['Hitbox Expander'].Enabled then
            local size = shared.Ecco['Hitbox Expander'].Size
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and IsAlive(player) then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(size, size, size)
                        hrp.Transparency = 0.7
                        hrp.CanCollide = false
                    end
                end
            end
        end
    end
end)

-- WalkSpeed & Movement Heartbeat
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")

    -- Speed Control
    if shared.Ecco['Player Modifications'].Speed.Enabled and hum then
        local speedVal = shared.Ecco['Player Modifications'].Speed.Default.Value
        local bodyEffects = char:FindFirstChild("BodyEffects")
        if bodyEffects and bodyEffects:FindFirstChild("Reload") and bodyEffects.Reload.Value == true then
            speedVal = shared.Ecco['Player Modifications'].Speed.Reloading.Value
        elseif hum.Health < 30 then
            speedVal = shared.Ecco['Player Modifications'].Speed['Low Health'].Value
        end
        hum.WalkSpeed = speedVal
    end

    -- Jump Power Control
    if shared.Ecco['Player Modifications']['Jump Power'].Enabled and hum then
        hum.JumpPower = shared.Ecco['Player Modifications']['Jump Power'].Value
    end

    -- Flight Logic
    if FlyingActive and hrp then
        if not FlightBodyVelocity then
            FlightBodyVelocity = Instance.new("BodyVelocity")
            FlightBodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            FlightBodyVelocity.Parent = hrp

            FlightBodyGyro = Instance.new("BodyGyro")
            FlightBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            FlightBodyGyro.CFrame = hrp.CFrame
            FlightBodyGyro.Parent = hrp
        end

        local speed = shared.Ecco['Player Modifications'].Flying.Speed
        local moveDir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        FlightBodyVelocity.Velocity = moveDir.Unit * speed
        FlightBodyGyro.CFrame = Camera.CFrame
    else
        if FlightBodyVelocity then
            FlightBodyVelocity:Destroy()
            FlightBodyVelocity = nil
        end
        if FlightBodyGyro then
            FlightBodyGyro:Destroy()
            FlightBodyGyro = nil
        end
    end
end)

-- Anti Jump Cooldown
UserInputService.JumpRequest:Connect(function()
    if shared.Ecco['Player Modifications']['Anti Jump Cooldown'].Enabled then
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
    local order = shared.Ecco['Inventory Sorter'].Order
    for _, toolName in ipairs(order) do
        local tool = backpack:FindFirstChild(toolName)
        if tool then
            tool.Parent = LocalPlayer.Character
            task.wait(0.05)
            tool.Parent = backpack
        end
    end
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
    box.Box.Color = shared.Ecco.Visualization['Global ESP'].Drawing.Boxes.Corner.Color

    box.Name.Size = shared.Ecco.Visualization['Global ESP']['Text Size']
    box.Name.Center = true
    box.Name.Outline = true
    box.Name.Color = shared.Ecco.Visualization['Global ESP'].Drawing.Names.Color

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
    local espEnabled = shared.Ecco.Visualization['Global ESP'].Enabled or shared.Ecco.ESP.Enabled
    for player, esp in pairs(ESPBoxes) do
        if espEnabled and IsAlive(player) then
            local char = player.Character
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local size = (Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2.6, 0)).Y)
                    local boxSize = Vector2.new(math.abs(size * 0.6), math.abs(size))
                    local boxPos = Vector2.new(screenPos.X - boxSize.X / 2, screenPos.Y - boxSize.Y / 2)

                    esp.Box.Size = boxSize
                    esp.Box.Position = boxPos
                    esp.Box.Visible = true

                    esp.Name.Text = player.DisplayName or player.Name
                    esp.Name.Position = Vector2.new(boxPos.X + boxSize.X / 2, boxPos.Y - 16)
                    esp.Name.Visible = true

                    local healthPercent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                    esp.Health.From = Vector2.new(boxPos.X - 4, boxPos.Y + boxSize.Y)
                    esp.Health.To = Vector2.new(boxPos.X - 4, boxPos.Y + boxSize.Y - (boxSize.Y * healthPercent))
                    esp.Health.Color = Color3.fromRGB(255 * (1 - healthPercent), 255 * healthPercent, 0)
                    esp.Health.Visible = true
                else
                    esp.Box.Visible = false
                    esp.Name.Visible = false
                    esp.Health.Visible = false
                end
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
    local binds = shared.Ecco.General.Binds

    -- Aim Assist Target Toggle
    if key == binds['Aim Bot Target']:lower() then
        if AimAssistLocked then
            AimAssistLocked = false
            CurrentTarget = nil
        else
            CurrentTarget = GetClosestPlayerToCursor(shared.Ecco['Aim Assist'].Distance)
            AimAssistLocked = (CurrentTarget ~= nil)
        end
        UpdateHotkeyHUD()
    end

    -- Silent Aim Target Selection
    if key == binds['Silent Aim Target']:lower() then
        CurrentTarget = GetClosestPlayerToCursor(shared.Ecco['Silent Aim'].FOV.Scan, shared.Ecco['Silent Aim'].Distance)
        UpdateHotkeyHUD()
    end

    -- Trigger Bot Hold / Toggle
    if key == binds['Trigger Bot']:lower() then
        TriggerBotActive = true
    end

    -- WalkSpeed Toggle
    if key == binds['Walk Speed']:lower() then
        shared.Ecco['Player Modifications'].Speed.Enabled = not shared.Ecco['Player Modifications'].Speed.Enabled
    end

    -- Jump Power Toggle
    if key == binds['Jump Power']:lower() then
        shared.Ecco['Player Modifications']['Jump Power'].Enabled = not shared.Ecco['Player Modifications']['Jump Power'].Enabled
    end

    -- Fly Toggle
    if key == binds['Fly']:lower() then
        FlyingActive = not FlyingActive
    end

    -- ESP Toggle
    if key == binds['ESP']:lower() then
        shared.Ecco.ESP.Enabled = not shared.Ecco.ESP.Enabled
        shared.Ecco.Visualization['Global ESP'].Enabled = shared.Ecco.ESP.Enabled
    end

    -- Inventory Sorter
    if key == binds['Inventory Sorter']:lower() then
        SortInventory()
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        local key = input.KeyCode.Name:lower()
        if key == shared.Ecco.General.Binds['Trigger Bot']:lower() then
            TriggerBotActive = false
        end
    end
end)

print("[ECCO .CLUB] Da Hood Suite loaded successfully!")
