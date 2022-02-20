_G.obbyFarm = false

-----------------------------------------------

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Mega Obby")
local farm = w:CreateFolder("Farming")
local shop = w:CreateFolder("Shop")

shop:Label("Trails/Pets are Free",{
    TextSize = 10; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

-----------------------------------------------

local petList = game:GetService("ReplicatedStorage"):FindFirstChild("Pets"):GetChildren()
local selectedPet = "Pet1"

shop:Dropdown("Pets", petList,true,function(pet)
    selectedPet = pet
end)

shop:Button("Equip Pet",function()
    equipPet(selectedPet)
end)

function equipPet(pet)
    local args = {
        [1] = pet,
        [2] = 0
    }
    
    game:GetService("ReplicatedStorage").EquipPet:FireServer(unpack(args))
end

-----------------------------------------------

local trailList = game:GetService("ReplicatedStorage"):FindFirstChild("Trails"):GetChildren()
local selectedTrail = "Rainbow"

shop:Dropdown("Trails", trailList,true,function(trail)
    selectedTrail = trail
end)

shop:Button("Equip Trail",function()
    equipTrail(selectedTrail)
end)

function equipTrail(trail)
    local args = {
        [1] = trail,
        [2] = 0
    }
    
    game:GetService("ReplicatedStorage").EquipTrails:FireServer(unpack(args))
end

-----------------------------------------------

farm:Toggle("Farm Obby",function(bool)
    _G.obbyFarm = bool
    if bool == true then
        farmStages()
    end
end)

function farmStages() 
    spawn(function()

        if not _G.obbyFarm then end

        local wrk = game:GetService("Workspace")
        local plr = workspace:FindFirstChild(tostring(game.Players.LocalPlayer)).HumanoidRootPart
        local start = game:GetService("Players").LocalPlayer.leaderstats.Stage.Value

        for i=start, 1000 do
            wait(.35)
            if wrk:FindFirstChild(tostring(i)) ~= nil then
                plr.CFrame = wrk:FindFirstChild(tostring(i)).CFrame
            end
        end
    end)
end

-----------------------------------------------

farm:DestroyGui()

