local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/DreamIslandTycoonScript/main/DreamIslandTycoon.lua')))()
local w = library:CreateWindow("Dream Island Tycoon")
local b = w:CreateFolder("AutoFarm")
local g = w:CreateFolder("Teleport")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

if game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp") then
    game:GetService("CoreGui").PurchasePromptApp:Destroy()
end

if game:GetService("StarterGui").Main.Frame:FindFirstChild("NotEnoughMoney") then
    game:GetService("StarterGui").Main.Frame.NotEnoughMoney:Destroy()
end
if game:GetService("Players").LocalPlayer.PlayerGui.Main.Frame:FindFirstChild("NotEnoughMoney") then
    game:GetService("Players").LocalPlayer.PlayerGui.Main.Frame.NotEnoughMoney:Destroy()
end

b:Toggle("Collect Money",function(bool)
    shared.toggle = bool
    automoney = bool
end)

b:Toggle("Buy Buttons",function(bool)
    shared.toggle = bool
    autobutton = bool
end)

g:Dropdown("Select Tycoon",{"Blue Tycoon","Red Tycoon","Green Tycoon","Orange Tycoon"},true,function(mob)
    tycoonselect = mob
end)

g:Button("TP Tycoon",function()
    if tycoonselect == "Blue Tycoon" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Tycoons.Tycoon1.Base.CurrencyGiver.Button.CFrame.Position + Vector3.new(0,3,0))
    elseif tycoonselect == "Red Tycoon" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Tycoons.Tycoon2.Base.CurrencyGiver.Button.CFrame.Position + Vector3.new(0,3,0))
    elseif tycoonselect == "Green Tycoon" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Tycoons.Tycoon4.Base.CurrencyGiver.Button.CFrame.Position + Vector3.new(0,3,0))
    elseif tycoonselect == "Orange Tycoon" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Tycoons.Tycoon3.Base.CurrencyGiver.Button.CFrame.Position + Vector3.new(0,3,0))
    end
end)

e:Slider("WalkSpeed",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

e:Slider("JumpPower",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discrod Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)


while wait() do

    spawn(function()
        if automoney == true then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Tycoons.Tycoon1.Base.CurrencyGiver.Button, 0)
                    wait()
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Tycoons.Tycoon1.Base.CurrencyGiver.Button, 1)
        end
    end)
    spawn(function()
        if autobutton == true then
            for i,v in pairs(game:GetService("Workspace").Tycoons.Tycoon1.Buttons:GetDescendants()) do
                if v.ClassName == "TouchTransmitter" then
                    for i,v1 in pairs(v.Parent.Parent:GetDescendants()) do
                        if v1.Name == "Type" and v1.Value == "Purchase" then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                            wait()
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                        end
                    end
                end
            end
        end
    end)

    spawn(function()
        if AntiAfk == true then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end)
end