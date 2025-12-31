-- Mobs.lua - Standalone Mobs Tab for AFSE Premium (Rayfield)

local MobsTab = Window:CreateTab("Mobs", 4483362458)

MobsTab:CreateParagraph({
   Title = "⚔️ Mob Autofarm",
   Content = "Auto-teleport and attack selected mob types.\nMobs must be spawned to be detected."
})

-- Global variables for mob farming states
local autoFarmSarkaEnabled = false
local autoFarmGenEnabled = false
local autoFarmIgichoEnabled = false
local autoFarmBoohEnabled = false
local autoFarmRemgonukEnabled = false
local autoFarmSaytamuEnabled = false
local autoAttackEnabled = false

-- Enable auto-attack remote
local function enableAutoAttack()
   if autoAttackEnabled then return end
   local args = {"Setting", 10}
   pcall(function()
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
   end)
   autoAttackEnabled = true
end

-- Check if any mob farm is active (to disable auto-attack when all off)
local function checkAnyMobFarmActive()
   return autoFarmSarkaEnabled or autoFarmGenEnabled or autoFarmIgichoEnabled 
      or autoFarmBoohEnabled or autoFarmRemgonukEnabled or autoFarmSaytamuEnabled
end

-- Reusable function to create mob autofarm toggles
local function createMobAutoFarm(mobName, flagName, title)
   MobsTab:CreateToggle({
      Name = title,
      Info = "Auto targets nearest " .. title:lower(),
      CurrentValue = false,
      Flag = flagName,
      Callback = function(state)
         _G[flagName] = state

         if state then
            enableAutoAttack()
            spawn(function()
               while _G[flagName] do
                  local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                  local hrp = character:WaitForChild("HumanoidRootPart")
                  local mobFolder = workspace.Scriptable.Mobs
                  local closestMob = nil
                  local closestDist = math.huge

                  for _, mob in ipairs(mobFolder:GetChildren()) do
                     if mob.Name == mobName and mob:FindFirstChild("HumanoidRootPart") then
                        local mobRoot = mob:FindFirstChild("HumanoidRootPart")
                        local dist = (hrp.Position - mobRoot.Position).Magnitude
                        if dist < closestDist then
                           closestDist = dist
                           closestMob = mob
                        end
                     end
                  end

                  if closestMob and closestMob:FindFirstChild("HumanoidRootPart") then
                     hrp.CFrame = closestMob.HumanoidRootPart.CFrame
                  end

                  wait(0.1)
               end
            end)
         else
            if not checkAnyMobFarmActive() then
               autoAttackEnabled = false
            end
         end
      end
   })
end

-- Create all mob autofarms
createMobAutoFarm("1", "AutoFarmSarka", "Auto Farm Sarka")
createMobAutoFarm("2", "AutoFarmGen", "Auto Farm Gen")
createMobAutoFarm("3", "AutoFarmIgicho", "Auto Farm Igicho")
createMobAutoFarm("5", "AutoFarmBooh", "Auto Farm Booh")
createMobAutoFarm("7", "AutoFarmRemgonuk", "Auto Farm Remgonuk")
createMobAutoFarm("6", "AutoFarmSaytamu", "Auto Farm Saytamu")

print("Mobs.lua loaded successfully!")