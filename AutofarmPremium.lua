-- AutofarmPremium.lua - Autofarm Tab Content

local Tab = _G.AFSE_Tabs.Autofarm

Tab:CreateParagraph({
   Title = "⚡ Premium Autofarm",
   Content = "All training features with improved reliability."
})

local TrainEnabled = false
Tab:CreateToggle({
   Name = "Auto Train Strength",
   Info = "Rapid strength training",
   CurrentValue = false,
   Flag = "AutoTrainStrength",
   Callback = function(state)
      TrainEnabled = state
      if state then
         spawn(function()
            while TrainEnabled do
               game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("Train", 1)
               wait(0.1)
            end
         end)
      end
   end
})

local DurabilityEnabled = false
Tab:CreateToggle({
   Name = "Auto Farm Durability",
   Info = "Fast durability gains",
   CurrentValue = false,
   Flag = "AutoDurability",
   Callback = function(state)
      DurabilityEnabled = state
      if state then
         spawn(function()
            while DurabilityEnabled do
               game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("Train", 2)
               wait(0.1)
            end
         end)
      end
   end
})

local ChakraEnabled = false
Tab:CreateToggle({
   Name = "Auto Farm Chakra",
   Info = "Efficient chakra farming",
   CurrentValue = false,
   Flag = "AutoChakra",
   Callback = function(state)
      ChakraEnabled = state
      if state then
         spawn(function()
            while ChakraEnabled do
               game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("Train", 3)
               wait(0.1)
            end
         end)
      end
   end
})

local SwordEnabled = false
Tab:CreateToggle({
   Name = "Auto Farm Sword",
   Info = "Activates sword and trains skill",
   CurrentValue = false,
   Flag = "AutoSword",
   Callback = function(state)
      SwordEnabled = state
      if state then
         local args = {"ActivateSword"}
         game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
         
         spawn(function()
            while SwordEnabled do
               game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("Train", 4)
               wait(0.1)
            end
         end)
      end
   end
})

local SpeedAgilityEnabled = false
Tab:CreateToggle({
   Name = "Auto Farm Speed & Agility",
   Info = "Alternates between speed and agility",
   CurrentValue = false,
   Flag = "AutoSpeedAgility",
   Callback = function(state)
      SpeedAgilityEnabled = state
      if state then
         spawn(function()
            while SpeedAgilityEnabled do
               game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("Train", 5)
               wait(0.1)
               game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("Train", 6)
               wait(0.1)
            end
         end)
      end
   end
})

print("AutofarmPremium.lua loaded successfully!")