-- SettingsPremium.lua - Settings Tab Content

local Tab = _G.AFSE_Tabs.Settings

Tab:CreateDropdown({
   Name = "UI Theme",
   Info = "Choose your preferred theme",
   Options = {"Default", "Amber Glow", "Amethyst", "Bloom", "Dark Blue", "Green", "Light", "Ocean", "Serenity"},
   CurrentOption = {"Default"},
   Flag = "UITheme",
   Callback = function(choice)
      if #choice > 0 then
         local selectedTheme = choice[1]
         local themeMap = {
            ["Amber Glow"] = "AmberGlow",
            ["Dark Blue"] = "DarkBlue"
         }
         Rayfield:ChangeTheme(themeMap[selectedTheme] or selectedTheme)
      end
   end
})

print("SettingsPremium.lua loaded successfully!")