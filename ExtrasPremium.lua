-- ExtrasPremium.lua - Premium Extras Tab Content

local Tab = _G.AFSE_Tabs.Extras

Tab:CreateParagraph({
   Title = "👑 Premium Extras",
   Content = "Advanced premium features available to all users."
})

Tab:CreateButton({
   Name = "Get Wind Grimore",
   Info = "Teleports to Wind Grimore spot (manual summon required)",
   Callback = function()
      local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
      if character and character:FindFirstChild("HumanoidRootPart") then
         local hrp = character.HumanoidRootPart
         local targetPos = Vector3.new(1045.88, 238.05, -971.62)
         hrp.CFrame = CFrame.new(targetPos)
      end

      Rayfield:Notify({
         Title = "Wind Grimore Spot",
         Content = "Teleported! Manually summon Grimore now.",
         Duration = 5
      })
   end
})

local SakraFarmFastEnabled = false
Tab:CreateToggle({
   Name = "Sakra Farm (Fast)",
   Info = "Teleports to optimal Sarka spot + auto Wind Grimore loop",
   CurrentValue = false,
   Flag = "SakraFarmFast",
   Callback = function(state)
      SakraFarmFastEnabled = state
      if state then
         local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
         if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local targetPos = Vector3.new(277.47, 60.99, 305.44)
            local targetLookVector = Vector3.new(-0.017, -0.000, -1.000)
            local targetCFrame = CFrame.new(targetPos, targetPos + targetLookVector)
            hrp.CFrame = targetCFrame
         end

         local summonArgs = {"SummonSpecial", "Grimoires"}
         pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(summonArgs))
         end)

         spawn(function()
            while SakraFarmFastEnabled do
               local useArgs = {"UseSpecialPower", Enum.KeyCode.Z}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(useArgs))
               end)
               wait(1.55)
            end
         end)
      end
   end
})

local GenFarmFastEnabled = false
Tab:CreateToggle({
   Name = "Gen Farm (Fast)",
   Info = "Teleports to optimal Gen spot + auto Wind Grimore loop",
   CurrentValue = false,
   Flag = "GenFarmFast",
   Callback = function(state)
      GenFarmFastEnabled = state
      if state then
         local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
         if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local targetPos = Vector3.new(-424.06512451171875, 60.99999237060547, 723.4719848632812)
            local targetLookVector = Vector3.new(1.000, 0.000, 0.026)
            local targetCFrame = CFrame.new(targetPos, targetPos + targetLookVector)
            hrp.CFrame = targetCFrame
         end

         local summonArgs = {"SummonSpecial", "Grimoires"}
         pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(summonArgs))
         end)

         spawn(function()
            while GenFarmFastEnabled do
               local useArgs = {"UseSpecialPower", Enum.KeyCode.Z}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(useArgs))
               end)
               wait(1.55)
            end
         end)
      end
   end
})

local IgichoFarmFastEnabled = false
Tab:CreateToggle({
   Name = "Igicho Farm (Fast)",
   Info = "Teleports to optimal Igicho spot + auto Wind Grimore loop",
   CurrentValue = false,
   Flag = "IgichoFarmFast",
   Callback = function(state)
      IgichoFarmFastEnabled = state
      if state then
         local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
         if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local targetPos = Vector3.new(535.10, 60.99, -1538.90)
            local targetLookVector = Vector3.new(1.000, 0.000, 0.017)
            local targetCFrame = CFrame.new(targetPos, targetPos + targetLookVector)
            hrp.CFrame = targetCFrame
         end

         local summonArgs = {"SummonSpecial", "Grimoires"}
         pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(summonArgs))
         end)

         spawn(function()
            while IgichoFarmFastEnabled do
               local useArgs = {"UseSpecialPower", Enum.KeyCode.Z}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(useArgs))
               end)
               wait(1.55)
            end
         end)
      end
   end
})

local BoohFarmFastEnabled = false
Tab:CreateToggle({
   Name = "Booh Farm (Fast)",
   Info = "Teleports to optimal Booh spot + auto Wind Grimore loop",
   CurrentValue = false,
   Flag = "BoohFarmFast",
   Callback = function(state)
      BoohFarmFastEnabled = state
      if state then
         local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
         if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local targetPos = Vector3.new(931.16, 242.99, 919.85)
            local targetLookVector = Vector3.new(-0.259, -0.000, 0.966)
            local targetCFrame = CFrame.new(targetPos, targetPos + targetLookVector)
            hrp.CFrame = targetCFrame
         end

         local summonArgs = {"SummonSpecial", "Grimoires"}
         pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(summonArgs))
         end)

         spawn(function()
            while BoohFarmFastEnabled do
               local useArgs = {"UseSpecialPower", Enum.KeyCode.Z}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(useArgs))
               end)
               wait(1.55)
            end
         end)
      end
   end
})

local RemgonukFarmFastEnabled = false
Tab:CreateToggle({
   Name = "Remgonuk Farm (Fast)",
   Info = "Teleports to optimal Remgonuk spot + auto Wind Grimore loop",
   CurrentValue = false,
   Flag = "RemgonukFarmFast",
   Callback = function(state)
      RemgonukFarmFastEnabled = state
      if state then
         local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
         if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local targetPos = Vector3.new(3077.19, 59.99, -491.97)
            local targetLookVector = Vector3.new(-0.933, 0.000, -0.122)
            local targetCFrame = CFrame.new(targetPos, targetPos + targetLookVector)
            hrp.CFrame = targetCFrame
         end

         local summonArgs = {"SummonSpecial", "Grimoires"}
         pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(summonArgs))
         end)

         spawn(function()
            while RemgonukFarmFastEnabled do
               local useArgs = {"UseSpecialPower", Enum.KeyCode.Z}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(useArgs))
               end)
               wait(1.55)
            end
         end)
      end
   end
})

local SaytamuFarmFastEnabled = false
Tab:CreateToggle({
   Name = "Saytamu Farm (Fast)",
   Info = "Teleports to optimal Saytamu spot + auto Wind Grimore loop",
   CurrentValue = false,
   Flag = "SaytamuFarmFast",
   Callback = function(state)
      SaytamuFarmFastEnabled = state
      if state then
         local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
         if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local targetPos = Vector3.new(527.87, 61.00, 1761.96)
            local targetLookVector = Vector3.new(-1.000, -0.000, 0.000)
            local targetCFrame = CFrame.new(targetPos, targetPos + targetLookVector)
            hrp.CFrame = targetCFrame
         end

         local summonArgs = {"SummonSpecial", "Grimoires"}
         pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(summonArgs))
         end)

         spawn(function()
            while SaytamuFarmFastEnabled do
               local useArgs = {"UseSpecialPower", Enum.KeyCode.Z}
               pcall(function()
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(useArgs))
               end)
               wait(1.55)
            end
         end)
      end
   end
})

print("ExtrasPremium.lua loaded successfully!")