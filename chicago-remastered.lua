local prox = game:GetService("Workspace").Map.Jobs.InAndOut.FrieWork.ProximityAttachment.ProximityPrompt
local touch = game:GetService("Workspace").Map.Jobs.InAndOut.Takeout.TouchInterest
local body = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

_G.farm = false

while wait(.1) do
    if not _G.farm then break end
    fireproximityprompt(prox, 100)
end

-- needs to bypass tp

local plr = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local d1 = game:GetService("Workspace").Map.Jobs.Bodega.Pickup.Boxes.ClickDetector
local d2 = game:GetService("Workspace").Map.Jobs.Bodega.DropOff.Supply.ClickDetector

_G.farm = true

while wait(10) do
    if not _G.farm then break end
    plr.CFrame = d1.Parent.CFrame + Vector3.new(0, 0, 20)
end

fireclickdetector(d1, 1000)
fireclickdetector(d2, 1000)

local plr = game.Players.LocalPlayer

while wait() do
    fireproximityprompt(game:GetService("Workspace").Map.Jobs.InAndOut.FrieWork.ProximityAttachment.ProximityPrompt, 100)
    local Service = game:GetService("TweenService")
    local Info = TweenInfo.new()
    local Player = game.Players.LocalPlayer.Character.HumanoidRootPart
    local Anim = {CFrame = game:GetService("Workspace").Map.Jobs.InAndOut.Takeout.CFrame} 
    
    local Tween = Service:Create(Player,Info,Anim)
    Tween:Play()
end
