local level = game:GetService("Players").LocalPlayer.Data.Level.Value
print(level)
function Quest()
    if level == 1 or level <= 15 then
        NameQuest = "BanditQuest1"
        LevelQuest = 1
        Mon = "Bandit [Lv. 5]"
        CFrameQuest = CFrame.new(1059.8006591796875, 16.393522262573242, 1548.5750732421875)
    end
end

function Farm()
    Quest()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
    local args = {
        [1] = "StartQuest",
        [2] = NameQuest,
        [3] = LevelQuest
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == Mon then
                if v.Humanoid.Health > 0 then
                repeat task.wait()
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                until v.Humanoid.Health == 0 or v.Humanoid.Health < 0 or not v.Parent
                end
            end
        end
    end
end
while task.wait() do
Farm()
end

