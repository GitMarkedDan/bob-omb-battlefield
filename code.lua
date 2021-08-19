success, response = pcall(function()
function createButton(name,position,text,func)
    Xpos = Xpos or 0.1
    unloop = false
    Button = Instance.new("TextButton")
    Button.Font = Enum.Font.SourceSansBold
    Button.TextColor3 = Color3.fromRGB(248,248,248)
    Button.Name = name
    Button.Position = position
    Button.Size = game.Players.LocalPlayer.PlayerGui.UI.pause.bg.pause.snap.Size
    Button.Text = text
    Button.ZIndex = 6
    Button.TextSize = 14
    Button.BackgroundTransparency = 1
    Button.Parent = game.Players.LocalPlayer.PlayerGui.UI.pause.bg.pause
    Button.TextScaled = true

    Outline = Instance.new("TextLabel")
    Outline.Name = "outline"
    Outline.Text = text
    Outline.Position = UDim2.new(0,0,0,3)
    Outline.TextScaled = true
    Outline.Size = UDim2.new(1,0,1,0)
    Outline.TextColor3 = Color3.new(0,0,0)
    Outline.TextTransparency = 0.8
    Outline.BackgroundTransparency = 1
    Outline.TextSize = 14
    Outline.Font = Button.Font
    Outline.Parent = Button
    Button.MouseEnter:Connect(function()
    stuff.textsel = Button
    end)
    Button.MouseButton1Click:Connect(func)
    return Button
end
thing = game:GetObjects("rbxassetid://7257376886")[1]
if thing.Version.Value ~= "0.2.7" then
    local othing = thing.Version.Value
    thing:Destroy()
    error("The version is outdated! The BOB version is " .. othing)
end
thing2 = game:GetObjects("rbxassetid://7265011904")[1]
if thing2.Version.Value ~= "0.1.1" then
    local othing = thing2.Version.Value
    thing2:Destroy()
    error("The version is outdated! The bomblord version is " .. othing)
end
stuff = getsenv(game.Players.LocalPlayer.PlayerScripts.CharacterScript)
clone = game:GetService("ReplicatedFirst").maps.hub.room1.TeleMap:Clone()
clone.cpu.Position = Vector3.new(-71.465, 15.831, 205.282)
clone.cpu.Orientation = Vector3.new(0, -45, 0)
clone.Position = Vector3.new(-69.129, 14.855, 202.93)
clone.Orientation = Vector3.new(0, -135.01, 0)
clone.Parent = game:GetService("ReplicatedFirst").maps.hub
clone.cpu.Transparency = 0
clone.to.Value = "BOB"
clone.where.Value = Vector3.new(-216.648, 8.699, 188.437)
clone.walkto.Value = Vector3.new(-0.5, 0, 0.5)
candyobj = game:GetService("ReplicatedFirst").candy
clone2 = candyobj:Clone()
clone2.Name = "coin"
clone2.Mesh.MeshId = "rbxassetid://7274595439"
clone2.Mesh.TextureId = "rbxassetid://7274595500"
clone2.Mesh.Scale = Vector3.new(0.35,0.35,0.35)
clone2.Parent = game:GetService("ReplicatedFirst")
eggobj = game:GetService("ReplicatedFirst").egg
clone3 = eggobj:Clone()
clone3.MeshId = "rbxassetid://7274739610"
clone3.TextureID = "http://www.roblox.com/asset/?id=7274798852"
clone3.Size = Vector3.new(6,8,6)
clone3.Parent = game:GetService("ReplicatedFirst")
iceobj = game:GetService("ReplicatedFirst").icedcream
clone4 = iceobj:Clone()
clone4.MeshId = "rbxassetid://491129029"
clone4.TextureID = "rbxassetid://491129030"
clone4.Size = Vector3.new(8,16,4)
clone4.Parent = game:GetService("ReplicatedFirst")
notobj = game:GetService("ReplicatedFirst").notcream
clone5 = notobj:Clone()
clone5.MeshId = "rbxassetid://491129029"
clone5.Size = Vector3.new(8,16,4)
clone5.Parent = game:GetService("ReplicatedFirst")

thing.Parent = game:GetService("ReplicatedFirst").maps
thing2.Parent = game:GetService("ReplicatedFirst").maps
workspace.char.Touched:connect(function(a,b)
    if stuff.map.Name == "BOB" and not a:IsDescendantOf(workspace.vis) then
        if a.Name == "flybit" then
            if a.seq.Value == 4 then
                stuff.spawnice("Finding Secrets in the Sky", 69, Vector3.new(-189.4, 43.878, -20.5))
                a:Destroy()
            end
        end
    end
end)
func = stuff.totext
stuff.totext = function(a,b)
    if stuff.map.Name == "BOB" then
        local race
        if a:FindFirstChild("INT") then
            if a.INT.Value == 11 then
                race = true
            end
        end
        func(a,b)
        if workspace.BOB.pole.finished.Value and race then
            stuff.spawnice("Race with Rabboy the Rushing Rabbit", 66, Vector3.new(67.733, 159, -120.691))
        end
    else
        func(a,b)
    end
end
changeobj = true
butt = createButton("texture", UDim2.new(0.03,0,-0.05,0),"Toggle retextured objects", function()
    changeobj = not changeobj
    if changeobj then
        game.Players.LocalPlayer.PlayerGui.UI.pause.bg.pause.texture.TextColor3 = Color3.new(0,1,0)
    else
        game.Players.LocalPlayer.PlayerGui.UI.pause.bg.pause.texture.TextColor3 = Color3.new(1,0,0)
    end
end, 0.75) 
butt.TextColor3 = Color3.new(0,1,0)
func2 = stuff.loadmap
stuff.loadmap = function(a)
    if changeobj and (a.Name == "BOB" or a.Name == "bomblord") then
        candyobj.Name = "disable"
        clone2.Name = "candy"
        clone3.Name = "egg"
        eggobj.Name = "eggdisabled"
        iceobj.Name = "icedisable"
        clone4.Name = "icedcream"
        notobj.Name = "notdisable"
        clone5.Name = "notcream"
    else
        candyobj.Name = "candy"
        clone2.Name = "coin"
        clone3.Name = "rcoin"
        eggobj.Name = "egg"
        iceobj.Name = "icedcream"
        clone4.Name = "stars"
        notobj.Name = "notcream"
        clone5.Name = "notstar"
    end
    if a.Name == "BOB" then
        coroutine.wrap(function()
            local candi = stuff.candy
            repeat wait() until stuff.candy - candi >= 100 or stuff.map.Name ~= "BOB"
            if stuff.candy - candi >= 100 then
                stuff.spawnice("100 candies in bob-omb battlefield", 71, workspace.char.Position + Vector3.new(0,10,0) )
            end
        end)()
        coroutine.wrap(function()
            repeat wait() until workspace.BOB.cactus.Position.Y <= 16.4 or stuff.map.Name ~= "BOB"
            if workspace.BOB.cactus.Position.Y <= 16.4 then
                workspace.BOB.gate:Destroy()
                workspace.BOB.cactus:Destroy()
            end
        end)()
        coroutine.wrap(function()
            repeat wait() until stuff.map.Name ~= "BOB" or stuff.eggs == 8
            if stuff.map.Name == "BOB" then
                stuff.spawnice("Hunting 8 eggs in Bob-Omb Battlefield", 68, Vector3.new(-189.916, 34.334, 92.334))
            end
        end)()
    else
        if a.Name == "bomblord" then
            coroutine.wrap(function()
                game:GetService("Workspace").vis.trs.board.TextureID = "rbxassetid://7265377600"
                repeat wait() until stuff.bossfight or stuff.map.Name ~= "bomblord"
                if stuff.bossfight then
                    wait(0.1)
                    workspace.bomblord.Hecklord.hp.Value = 3
                    workspace.bomblord.Hecklord.Position = workspace.bomblord.Hecklord.Position - Vector3.new(0,10,0)
                    workspace.bomblord["King Bomb Omb"]["King Bomb Omb"].tx:Destroy()
                    repeat wait() until not stuff.bossfight or stuff.map.Name ~= "bomblord"
                    if stuff.map.Name == "bomblord" then
                        workspace.bomblord["King Bomb Omb"]:Destroy()
                    end
                end
                game:GetService("Workspace").vis.trs.board.TextureID = "rbxassetid://1141950241"
            end)()
            coroutine.wrap(function()
                repeat
                    if stuff.skatestat[1] == "Cool as HECK!" then
                        stuff.skatestat[1] = "Loud and EXPLOSIVE!"
                    end
                    wait()
                until stuff.map.Name ~= "bomblord"
            end)()
        end
    end
    ret = func2(a)
    if a.Name == "BOB" then
        att = workspace.BOB.guard.col.force
        workspace.BOB.cactus.RC.Attachment1 = att
    end
    return ret
end
func3 = stuff.spawnice
stuff.spawnice = function(a,b,c)
    if b == 24 and stuff.map.Name == "bomblord" then
        b = 65
        a = "Bob-Omb Blastoff"
    end
    return func3(a,b,c) 
end
stuff.icrt[11] = "Bob-Omb Battlefield"
stuff.icr[11] = {
    c65 = "Bob-Omb Blastoff",
    c66 = "Race with Rabboy the Rushing Rabbit",
    c67 = "The Flying Island",
    c68 = "Hunting 8 eggs in Bob-Omb Battlefield",
    c69 = "Finding Secrets in the Sky",
    c70 = "Behind the (totally) chain chomp's gate",
    c71 = "100 candies in bob-omb battlefield"
}
end)
if success then
    print("BOB has finished loading! Head back to hub to enter it.")
else
    print("There was an error loading BOB, please post this error on discord:")
    print(response)
end
