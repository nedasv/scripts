local prox = game:GetService("Workspace").Map.Jobs.InAndOut.FrieWork.ProximityAttachment.ProximityPrompt
local touch = game:GetService("Workspace").Map.Jobs.InAndOut.Takeout.TouchInterest
local body = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

_G.farm = false

while wait(.1) do
    if not _G.farm then break end
    fireproximityprompt(prox, 100)
end
