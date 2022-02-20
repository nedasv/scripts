local wrk = game:GetService("Workspace")
local plr = workspace:FindFirstChild(tostring(game.Players.LocalPlayer)).HumanoidRootPart
local start = game:GetService("Players").LocalPlayer.leaderstats.Stage.Value


for i=start, 1000 do
    wait(.35)
    if wrk:FindFirstChild(tostring(i)) ~= nil then
        plr.CFrame = wrk:FindFirstChild(tostring(i)).CFrame
    end
end
        
