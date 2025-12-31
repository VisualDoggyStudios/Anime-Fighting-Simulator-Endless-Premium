-- MiscPremium.lua - Misc Tab Content

local Tab = _G.AFSE_Tabs.Misc

Tab:CreateParagraph({
   Title = "🛠️ Miscellaneous",
   Content = "Extra quality-of-life features."
})

Tab:CreateToggle({
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

print("MiscPremium.lua loaded successfully!")