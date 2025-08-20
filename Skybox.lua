local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local respawnConnection

local function ApplyRainbowSky()
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Atmosphere") or child:IsA("BloomEffect") or child:IsA("SunRaysEffect") or child:IsA("Sky") then
            child:Destroy()
        end
    end

    local atmosphere = Instance.new("Atmosphere")
    atmosphere.Name = "Atmosphere"
    atmosphere.Density = 0.3
    atmosphere.Offset = 0.25
    atmosphere.Color = Color3.new(0.780392, 0.780392, 0.780392)
    atmosphere.Decay = Color3.new(0.415686, 0.439216, 0.490196)
    atmosphere.Glare = 0
    atmosphere.Haze = 0
    atmosphere.Parent = Lighting

    local bloom = Instance.new("BloomEffect")
    bloom.Name = "Bloom"
    bloom.Enabled = true
    bloom.Intensity = 1
    bloom.Size = 24
    bloom.Threshold = 2
    bloom.Parent = Lighting

    local sunRays = Instance.new("SunRaysEffect")
    sunRays.Name = "SunRays"
    sunRays.Enabled = true
    sunRays.Intensity = 0.01
    sunRays.Spread = 0.1
    sunRays.Parent = Lighting

    local sky = Instance.new("Sky")
    sky.Name = "Sky"
    sky.SkyboxBk = "rbxassetid://16573631102"
    sky.SkyboxDn = "rbxassetid://16573631950"
    sky.SkyboxFt = "rbxassetid://16573632795"
    sky.SkyboxLf = "rbxassetid://16573633258"
    sky.SkyboxRt = "rbxassetid://16573633908"
    sky.SkyboxUp = "rbxassetid://16573634370"
    sky.StarCount = 3000
    sky.SunAngularSize = 21
    sky.SunTextureId = "rbxasset://sky/sun.jpg"
    sky.MoonTextureId = "rbxasset://sky/moon.jpg"
    sky.Parent = Lighting
end

local function ClearSkyEffects()
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Atmosphere") or child:IsA("BloomEffect") or child:IsA("SunRaysEffect") or child:IsA("Sky") then
            child:Destroy()
        end
    end
end

ApplyRainbowSky()

if respawnConnection then
    respawnConnection:Disconnect()
end

respawnConnection = player.CharacterAdded:Connect(function()
    ApplyRainbowSky()
end)
