-- Boot the Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "Moto Ride And Slide ",
    LoadingTitle = "Moto Ride And Slide",
    LoadingSubtitle = "by Duy Trường",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Create Main Tab
local MainTab = Window:CreateTab("Main Controls", 4483362458)

------------------------------------------------------------
-- 1️⃣ Infinite Money Button (One-Time Execution)
------------------------------------------------------------
MainTab:CreateButton({
    Name = "Infinite Money 💰",
    Callback = function()
        local args = {
            "ToQuit",
            30827123641967773000000000000000000000000000
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Race"):FireServer(unpack(args))
        Rayfield:Notify({
            Title = "Infinite Money Activated",
            Content = "You just got infinite money!",
            Duration = 4
        })
    end,
})

------------------------------------------------------------
-- 2️⃣ Infinite Win Button (Loop Execution)
------------------------------------------------------------
local InfiniteWinLoop = false
MainTab:CreateToggle({
    Name = "Infinite Wins 🏆",
    CurrentValue = false,
    Flag = "InfiniteWinToggle",
    Callback = function(Value)
        InfiniteWinLoop = Value
        while InfiniteWinLoop do
            local args = {
                "GetWin"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Race"):FireServer(unpack(args))
            task.wait(0.2)
        end
    end,
})

------------------------------------------------------------
-- 3️⃣ Best Egg In Game Button (Loop Execution)
------------------------------------------------------------
local EggLoop = false
MainTab:CreateToggle({
    Name = "Best Egg In Game 🥚",
    CurrentValue = false,
    Flag = "EggLoopToggle",
    Callback = function(Value)
        EggLoop = Value
        while EggLoop do
            local args = {
                "TryOpenEgg",
                "Egg12",
                20
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Egg"):FireServer(unpack(args))
            task.wait(0.2)
        end
    end,
})

------------------------------------------------------------
-- 4️⃣ Claim All Daily 7 At Once Button (Executes 7 Times)
------------------------------------------------------------
MainTab:CreateButton({
    Name = "Claim All Daily 7 At Once 🎁",
    Callback = function()
        for i = 1, 7 do
            local args = {
                "TryClaim"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Daily"):FireServer(unpack(args))
            task.wait(0.2)
        end
        Rayfield:Notify({
            Title = "Daily Rewards Claimed ✅",
            Content = "All 7 daily rewards have been claimed!",
            Duration = 4
        })
    end,
})

------------------------------------------------------------
-- Done
------------------------------------------------------------
Rayfield:Notify({
    Title = "GUI Loaded 🎮",
    Content = "Moto Ride And Slide || By Duy Trường loaded successfully!",
    Duration = 5
})