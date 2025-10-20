local gui = Instance.new("ScreenGui")
gui.Name = "Skid"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 130)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui


local UICorner = Instance.new("UICorner", frame)
UICorner.CornerRadius = UDim.new(0, 15)


local uiStroke = Instance.new("UIStroke", frame)
uiStroke.Thickness = 3
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
local strokeGradient = Instance.new("UIGradient", uiStroke)
strokeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 80, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 200, 255))
}
strokeGradient.Rotation = 90


local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "Duy Android Hub"-- CHỈ ĐỔI CÁI TÊN THÔI SKID NGU LÀ HỐC CỨT
title.TextColor3 = Color3.fromRGB(60, 60, 60)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = frame


local luckyButton = Instance.new("TextButton")
luckyButton.Size = UDim2.new(0, 200, 0, 45)
luckyButton.Position = UDim2.new(0.5, -100, 0.5, -15)
luckyButton.Text = "x10 Lucky"
luckyButton.Font = Enum.Font.GothamBold
luckyButton.TextSize = 18
luckyButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200) 
luckyButton.TextColor3 = Color3.fromRGB(40, 40, 40) 
luckyButton.AutoButtonColor = false
luckyButton.Parent = frame

local btnCorner = Instance.new("UICorner", luckyButton)
btnCorner.CornerRadius = UDim.new(0, 12)


local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 80, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 200, 255))
}
UIGradient.Rotation = 45


local raining = false
local clovers = {}

local function spawnClover()
    local clover = Instance.new("TextLabel")
    clover.Size = UDim2.new(0, 22, 0, 22)
    clover.BackgroundTransparency = 1
    clover.Text = "🍀"
    clover.Font = Enum.Font.Gotham
    clover.TextSize = 22
    clover.TextColor3 = Color3.fromRGB(60, 180, 60)
    clover.Position = UDim2.new(math.random(), 0, 0, 0)
    clover.Parent = frame

    table.insert(clovers, clover)

    task.spawn(function()
        local y = 0
        while raining and clover.Parent do
            task.wait(0.03)
            y = y + 3
            clover.Position = UDim2.new(clover.Position.X.Scale, 0, 0, y)
            if y > frame.AbsoluteSize.Y then
                clover:Destroy()
                break
            end
        end
        if not raining then
            clover:Destroy()
        end
    end)
end


local luckyOn = false
luckyButton.MouseButton1Click:Connect(function()
    luckyOn = not luckyOn
    if luckyOn then
        
        UIGradient.Parent = luckyButton
        luckyButton.Text = "x10 Lucky "
        luckyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        
        title.TextColor3 = Color3.fromRGB(150, 0, 255)

        
        strokeGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 255))
        }

        raining = true
        task.spawn(function()
            while raining do
                spawnClover()
                task.wait(0.3)
            end
        end)
    else
        
        UIGradient.Parent = nil
        luckyButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        luckyButton.TextColor3 = Color3.fromRGB(40, 40, 40)
        luckyButton.Text = "x10 Lucky"

        
        title.TextColor3 = Color3.fromRGB(60, 60, 60)

        
        strokeGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 80, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 200, 255))
        }

        raining = false
        for _, c in ipairs(clovers) do
            if c and c.Parent then
                c:Destroy()
            end
        end
        clovers = {}
    end
end)


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer


pcall(function()
    if LocalPlayer:FindFirstChild("LuckMultiplier") then
        LocalPlayer.LuckMultiplier.Value = 100
    end
end)