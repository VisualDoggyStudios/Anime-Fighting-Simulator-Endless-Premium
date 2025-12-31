-- EspPremium.lua - ESP Tab Content (Rayfield - Chikara Shard ESP Only)

local Tab = _G.AFSE_Tabs.ESP

Tab:CreateParagraph({
   Title = "👁️ Premium ESP",
   Content = "Toggle Chikara Shard ESP below."
})

-- Variables for Chikara ESP
local chikaraHighlights = {}
local chikaraConnection = nil

-- Fixed colors (you can change these if you want defaults)
local ChikaraFill = Color3.fromRGB(0, 255, 255)      -- Cyan fill
local ChikaraOutline = Color3.fromRGB(255, 255, 255) -- White outline

-- Chikara Shard ESP Toggle
Tab:CreateToggle({
   Title = "Chikara Shards ESP",
   Description = "Highlights all Chikara shards on the map",
   Default = false,
   Flag = "ChikaraShardsESP",  -- Saves state in config
   Callback = function(state)
      local folder = workspace.Scriptable.ChikaraBoxes

      local function addHighlight(obj)
         if not chikaraHighlights[obj] then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = ChikaraFill
            highlight.OutlineColor = ChikaraOutline
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.Parent = obj
            chikaraHighlights[obj] = highlight

            obj.Destroying:Connect(function()
               chikaraHighlights[obj] = nil
            end)
         end
      end

      if state then
         -- Turn ON: highlight existing shards and listen for new ones
         for _, obj in ipairs(folder:GetChildren()) do
            addHighlight(obj)
         end
         chikaraConnection = folder.ChildAdded:Connect(addHighlight)
      else
         -- Turn OFF: remove all highlights
         for _, highlight in pairs(chikaraHighlights) do
            if highlight then
               highlight:Destroy()
            end
         end
         chikaraHighlights = {}
         if chikaraConnection then
            chikaraConnection:Disconnect()
            chikaraConnection = nil
         end
      end
   end
})

print("EspPremium.lua loaded successfully! (Chikara Shard ESP toggle ready)")