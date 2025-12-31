-- Chikara.lua - Standalone Chikara Tab for AFSE Premium (Rayfield)

local ChikaraTab = Window:CreateTab("Chikara", 4483362458)

ChikaraTab:CreateParagraph({
   Title = "💎 Chikara Autofarm",
   Content = "Fully functional with GUI open."
})

local AutoFarmChikaraEnabled = false

ChikaraTab:CreateToggle({
   Name = "Auto Farm Chikara Boxes",
   Info = "Teleports and double-clicks nearest crate",
   CurrentValue = false,
   Flag = "AutoFarmChikara",
   Callback = function(state)
      AutoFarmChikaraEnabled = state
      if state then
         spawn(function()
            while AutoFarmChikaraEnabled do
               local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
               local hrp = character:WaitForChild("HumanoidRootPart")
               local folder = workspace.Scriptable.ChikaraBoxes
               
               local closestBox = nil
               local closestDist = math.huge
               
               for _, box in ipairs(folder:GetChildren()) do
                  local clickBox = box:FindFirstChild("ClickBox")
                  if clickBox then
                     local clickDetector = clickBox:FindFirstChild("ClickDetector")
                     if clickDetector then
                        local dist = (hrp.Position - clickBox.Position).Magnitude
                        if dist < closestDist then
                           closestDist = dist
                           closestBox = box
                        end
                     end
                  end
               end
               
               if closestBox then
                  local clickBox = closestBox.ClickBox
                  local clickDetector = clickBox.ClickDetector
                  
                  hrp.CFrame = clickBox.CFrame
                  
                  fireclickdetector(clickDetector)
                  wait(0.5)
                  fireclickdetector(clickDetector)
               else
                  wait(0.5)
               end
            end
         end)
      end
   end
})

print("Chikara.lua loaded successfully!")