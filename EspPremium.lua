-- ESP.lua - Standalone ESP Tab for AFSE Premium (Rayfield)

local ESPTab = Window:CreateTab("ESP", 4483362458)

ESPTab:CreateParagraph({
   Title = "👁️ Premium ESP",
   Content = "Customizable highlights with smooth real-time updates."
})

-- Chikara ESP Variables
local CurrentChikaraFill = Color3.fromRGB(0, 255, 255)
local CurrentChikaraOutline = Color3.fromRGB(255, 255, 255)
local chikaraHighlights = {}
local chikaraConnection = nil

local function updateChikaraHighlights()
   for _, h in pairs(chikaraHighlights) do 
      if h and h.Parent then 
         h.FillColor = CurrentChikaraFill 
         h.OutlineColor = CurrentChikaraOutline 
      end 
   end
end

-- Chikara Color Pickers
ESPTab:CreateColorPicker({
   Name = "Chikara Fill Color",
   Info = "Fill color for Chikara crate highlights",
   CurrentColor = CurrentChikaraFill,
   Flag = "ChikaraFillColor",
   Callback = function(c) 
      CurrentChikaraFill = c 
      updateChikaraHighlights() 
   end
})

ESPTab:CreateColorPicker({
   Name = "Chikara Outline Color",
   Info = "Outline color for Chikara crate highlights",
   CurrentColor = CurrentChikaraOutline,
   Flag = "ChikaraOutlineColor",
   Callback = function(c) 
      CurrentChikaraOutline = c 
      updateChikaraHighlights() 
   end
})

-- Chikara Box ESP Toggle
ESPTab:CreateToggle({
   Name = "Chikara Box ESP",
   Info = "Highlights all Chikara crates",
   CurrentValue = false,
   Flag = "ChikaraBoxesESP",
   Callback = function(state)
      local folder = workspace.Scriptable.ChikaraBoxes
      local function addHighlight(obj)
         if not chikaraHighlights[obj] then
            local h = Instance.new("Highlight")
            h.FillColor = CurrentChikaraFill
            h.OutlineColor = CurrentChikaraOutline
            h.FillTransparency = 0.5
            h.OutlineTransparency = 0
            h.Parent = obj
            chikaraHighlights[obj] = h
            obj.Destroying:Connect(function() chikaraHighlights[obj] = nil end)
         end
      end
      if state then
         for _, obj in ipairs(folder:GetChildren()) do addHighlight(obj) end
         chikaraConnection = folder.ChildAdded:Connect(addHighlight)
      else
         for _, h in pairs(chikaraHighlights) do if h then h:Destroy() end end
         chikaraHighlights = {}
         if chikaraConnection then chikaraConnection:Disconnect() chikaraConnection = nil end
      end
   end
})

-- Mob ESP Variables
local CurrentMobFill = Color3.fromRGB(255, 100, 255)
local CurrentMobOutline = Color3.fromRGB(255, 255, 255)
local mobHighlights = {}
local mobConnection = nil

local function updateMobHighlights()
   for _, h in pairs(mobHighlights) do
      if h and h.Parent then
         h.FillColor = CurrentMobFill
         h.OutlineColor = CurrentMobOutline
      end
   end
end

local function clearAllMobHighlights()
   if mobConnection then mobConnection:Disconnect() mobConnection = nil end
   for _, h in pairs(mobHighlights) do if h then h:Destroy() end end
   mobHighlights = {}
end

local function addHighlight(obj)
   if not mobHighlights[obj] then
      local h = Instance.new("Highlight")
      h.Name = "MobESP"
      h.FillColor = CurrentMobFill
      h.OutlineColor = CurrentMobOutline
      h.FillTransparency = 0.4
      h.OutlineTransparency = 0
      h.Parent = obj
      mobHighlights[obj] = h
      obj.Destroying:Connect(function() mobHighlights[obj] = nil end)
   end
end

local function applyMobESP(mobType)
   clearAllMobHighlights()
   if mobType == "None" then return end
   local mobFolder = workspace.Scriptable.Mobs
   local function shouldHighlight(obj)
      if mobType == "Sarka" then return obj.Name == "1"
      elseif mobType == "Gen" then return obj.Name == "2"
      elseif mobType == "Igicho" then return obj.Name == "3"
      elseif mobType == "Booh" then return obj.Name == "5"
      elseif mobType == "Saytamu" then return obj.Name == "6"
      elseif mobType == "Remgonuk" then return obj.Name == "7"
      end
      return false
   end
   for _, obj in ipairs(mobFolder:GetChildren()) do
      if shouldHighlight(obj) then addHighlight(obj) end
   end
   mobConnection = mobFolder.ChildAdded:Connect(function(child)
      if shouldHighlight(child) then addHighlight(child) end
   end)
end

-- Mob Color Pickers
ESPTab:CreateColorPicker({
   Name = "Mob Fill Color",
   Info = "Fill color for mob highlights",
   CurrentColor = CurrentMobFill,
   Flag = "MobFillColor",
   Callback = function(c) 
      CurrentMobFill = c 
      updateMobHighlights() 
   end
})

ESPTab:CreateColorPicker({
   Name = "Mob Outline Color",
   Info = "Outline color for mob highlights",
   CurrentColor = CurrentMobOutline,
   Flag = "MobOutlineColor",
   Callback = function(c) 
      CurrentMobOutline = c 
      updateMobHighlights() 
   end
})

-- Mob ESP Selector Dropdown
ESPTab:CreateDropdown({
   Name = "Mob ESP Selector",
   Info = "Choose which mob type to highlight",
   Options = {"None", "Sarka", "Gen", "Igicho", "Booh", "Remgonuk", "Saytamu"},
   CurrentOption = {"None"},
   Flag = "MobESPSelector",
   Callback = function(value)
      applyMobESP(value[1])
   end
})

print("ESP.lua loaded successfully!")