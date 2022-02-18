_G.collect = false
_G.winners = false

local items = {}
local shop = workspace.ScriptImportance.Shop.GearDisplay:GetChildren()

for i = 1, #shop do
    table.insert(items, shop[i])
end

--- UI

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Tsunami Game")
local b = w:CreateFolder("Farming")

b:Toggle("TP Coins",function(bool)
    _G.collect = bool
    print("Coins TP to you ", bool)
    if bool == true then
        tpCoins()
        return
    end
end)

b:Toggle("Auto Winners",function(bool)
    _G.winners = bool
    print("Winners TP to you ", bool)
    if bool == true then
        tpWinner()
        return
    end
end)

b:Dropdown("Item Shop", items,true,function(mob)
    buyItems(mob)
end)

b:Slider("Walk Speed",{
    min = 10;
    max = 120;
    precise = true;
},function(value)
    workspace:FindFirstChild(tostring(game.Players.LocalPlayer)).Humanoid.WalkSpeed = value
end)

b:DestroyGui()

---------------------------------------------------------------------------------------------------------------

function playerPos()
    return workspace:FindFirstChild(tostring(game.Players.LocalPlaye)):FindFirstChild("HumanoidRootPart").Position
end

function tpCoins()
    while wait() do
        if not _G.collect then break end

        local pos = playerPos()
        local coins = workspace:WaitForChild("CurrentPointCoins"):GetChildren()

        if coins == nil then break end
            
        for i, v in pairs(coins[1]:GetChildren()) do
            v.Position = pos
        end
        wait(0.5)
    end
end

function buyItems(itemName)
    local args = {
        [1] = itemName
    }
    game:GetService("ReplicatedStorage").RemoteEvents.Gui.ShopItemPurchased:FireServer(unpack(args))
end

function tpWinner()
    while wait(3) do
        if not _G.winners then break end
        local player = workspace:FindFirstChild(tostring(game.Players.LocalPlayer)):FindFirstChild("HumanoidRootPart")
        player.CFrame = workspace:FindFirstChild("ScriptImportance").PlayAreaRocks.Rock18.CFrame + Vector3.new(-5, 25, -20)
        wait(30)
        player.CFrame = workspace:FindFirstChild("ScriptImportance").WinnersTunnel.WinnersPart.CFrame
    end
end
