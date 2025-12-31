-- Misc.lua - Standalone Misc Tab for AFSE Premium (Rayfield)

local MiscTab = Window:CreateTab("Misc", 4483362458)

MiscTab:CreateParagraph({
   Title = "🛠️ Miscellaneous",
   Content = "Extra quality-of-life features."
})

MiscTab:CreateToggle({
   Name = "Anti AFK",
   Info = "Prevents getting kicked for inactivity",
   CurrentValue = false,
   Flag = "AntiAFK",
   Callback = function(state)
      if state then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()
      end
   end
})

print("Misc.lua loaded successfully!")