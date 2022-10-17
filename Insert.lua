if _G.NametagsRan == true then
    return
end
_G.NametagsRan = true
local plrs = game:GetService("Players")

local UI = game:GetObjects("rbxassetid://7437010836")[1]
if syn then
    syn.protect_gui(UI)
end

local cool = {
    {3207813237, "legendary", 1},
    {2751758317, "JD / Square", 8},
    {2635313420, "JD / Square", 8},
    {1446481032, "JD / Square", 8},
    {2635313420, "lix", 8},
    {2404946572, "lix", 8},
    {349796810, "lix", 8},
    {1698664417, "[staff] samy", 9},
    {3456244709, "[booster] trp", 0},
    {2364015091, "[booster] killhouse", 0},
    {3033176182, "DeathWalker", 10},
    {192866686, "lnxgo", 10},
    {34208724, "netrunner", 3},
    {2270834679, "Jaxsiee", 8},
    {2532809600, "night", 8},
    {770824, "[admin] IOC", 5}, 
    {1061095, "[N6]", 9},
    {1239668957, "icon1c / bike stealer ", 5},
    {3554350211, "[admin] IOC", 5}, 
    {2724995021, "fragile", 3},
    
}

local function isCool(player)
    local isCool = false
    local tag
    local num

    for i, v in next, cool do
        if player.UserId == v[1] then
            isCool = true
            tag = v[2]
            num = v[3]
        end
    end

    return {isCool, tag, num}
end

local function ApplyTag(player, text, num)
    local tag = UI:Clone()
    tag.Nameplate.Text = text
    if num == 1 then
        coroutine.wrap(
            function()
                while tag ~= nil do
                    wait()
                    local color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    tag.Nameplate.TextColor3 = color
                end
            end
        )()
    end
    if num == 0 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
    end
    if num == 2 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(250, 157, 179) -- Pink
    end
    if num == 3 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(157, 200, 251) -- Baby blue
    end
    if num == 4 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(165, 42, 42) -- Light red
    end
    if num == 5 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black
    end
    if num == 6 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(0, 255, 255) -- Very light blue
    end
    if num == 7 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(184, 124, 245) -- Purple
    end
    
    if num == 8 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
    end
    
    if num == 9 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(65, 24, 84) -- Dark purple
    end

    if num == 10 then
        tag.Nameplate.TextColor3 = Color3.fromRGB(177,156,217) -- Very light purple
    end
    
    
    tag.Parent = player.Character:WaitForChild("Head")
end

for _, v in next, game.Players:GetPlayers() do
    if isCool(v)[1] then
        ApplyTag(v, isCool(v)[2], isCool(v)[3])

        v.CharacterAdded:Connect(
            function()
                ApplyTag(v, isCool(v)[2], isCool(v)[3])
            end
        )
    end
end

game.Players.PlayerAdded:Connect(
    function(plr)
        if isCool(plr)[1] then
            plr.CharacterAdded:Connect(
                function()
                    ApplyTag(plr, isCool(plr)[2], isCool(plr)[3])
                end
            )
        end
    end
)

