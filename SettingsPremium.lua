-- Settings.lua - Standalone Settings Tab for AFSE Premium (Rayfield)

local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateDropdown({
   Name = "UI Theme",
   Info = "Choose your preferred theme",
   Options = {
      "Default",
      "Amber Glow",
      "Amethyst",
      "Bloom",
      "Dark Blue",
      "Green",
      "Light",
      "Ocean",
      "Serenity"
   },
   CurrentOption = {"Default"},
   Flag = "UITheme",
   Callback = function(choice)
      if #choice > 0 then
         local selectedTheme = choice[1]
         
         -- Map display name to Rayfield's internal ThemeIdentifier
         local themeMap = {
            ["Default"]     = "Default",
            ["Amber Glow"]  = "AmberGlow",
            ["Amethyst"]    = "Amethyst",
            ["Bloom"]       = "Bloom",
            ["Dark Blue"]   = "DarkBlue",
            ["Green"]       = "Green",
            ["Light"]       = "Light",
            ["Ocean"]       = "Ocean",
            ["Serenity"]    = "Serenity"
         }
         
         Rayfield:ChangeTheme(themeMap[selectedTheme] or "Default")
      end
   end
})

print("Settings.lua loaded successfully with updated themes!")