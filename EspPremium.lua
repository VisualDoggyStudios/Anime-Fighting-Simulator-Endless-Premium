-- EspPremium.lua - ESP Tab Content (Rayfield - Correct Syntax)

local Tab = _G.AFSE_Tabs.ESP

Tab:CreateParagraph({
   Title = "👁️ Premium ESP",
   Content = "Customizable highlights for Chikara shards."
})

-- Chikara ESP Variables
local CurrentChikaraFill = Color3.fromRGB(0, 255, 255)  -- Default cyan
local CurrentChikaraOutline = Color3.fromRGB(255, 255, 255)  -- Default white
local chikaraHighlights = {}
local chikaraConnection = nil

-- Update highlights when color changes
local function updateChikaraHighlights()
    for _, highlight in pairs(chikaraHighlights) do
        if highlight and highlight.Parent then
            highlight.FillColor = CurrentChikaraFill
            highlight.OutlineColor = CurrentChikaraOutline
        end
    end
end

-- Chikara Fill Color Picker
Tab:CreateColorPicker({
    Title = "Chikara Fill Color",
    Description = "Choose the fill color for Chikara shard highlights",
    Default = CurrentChikaraFill,
    Flag = "ChikaraFillColor",
    Callback = function(color)
        CurrentChikaraFill = color
        updateChikaraHighlights()
    end
})

-- Chikara Outline Color Picker
Tab:CreateColorPicker({
    Title = "Chikara Outline Color",
    Description = "Choose the outline color for Chikara shard highlights",
    Default = CurrentChikaraOutline,
    Flag = "ChikaraOutlineColor",
    Callback = function(color)
        CurrentChikaraOutline = color
        updateChikaraHighlights()
    end
})

-- Chikara Shards ESP Toggle
Tab:CreateToggle({
    Title = "Chikara Shards",
    Description = "Highlights all Chikara shards in the map",
    Default = false,
    Flag = "ChikaraShardsESP",
    Callback = function(state)
        local folder = workspace.Scriptable.ChikaraBoxes

        local function addHighlight(obj)
            if not chikaraHighlights[obj] then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = CurrentChikaraFill
                highlight.OutlineColor = CurrentChikaraOutline
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
            -- Enable: highlight existing + listen for new
            for _, obj in ipairs(folder:GetChildren()) do
                addHighlight(obj)
            end
            chikaraConnection = folder.ChildAdded:Connect(addHighlight)
        else
            -- Disable: clean up
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

print("EspPremium.lua loaded successfully! (Chikara ESP with correct Rayfield syntax)")