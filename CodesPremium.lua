-- Codes.lua - Standalone Codes Tab for AFSE Premium (Rayfield)

local CodesTab = Window:CreateTab("Codes", 4483362458)

CodesTab:CreateParagraph({
   Title = "🎟️ Code Redeemer",
   Content = "Redeem all available codes with detailed feedback."
})

-- List of codes (you can update this list anytime)
local codeList = {
   "YenCode", "FreeChikara", "FreeChikara2", "FreeChikara3", "BugFixes1",
   "10Favs", "10Likes", "LASTFIX", "Update1Point1", "SorryForBugsLol",
   "1kVisits", "50Likes", "1000Members", "MobsUpdate", "1WeekAnniversary",
   "400CCU", "10kVisits", "100Favs", "100CCU"
}

CodesTab:CreateButton({
   Name = "Redeem All Codes",
   Info = "Processes all codes with 0.3s delay • Shows success/fail",
   Callback = function()
      local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RemoteFunction")
      
      local successCount = 0
      local failCount = 0

      for _, code in ipairs(codeList) do
         local args = {"Code", code}
         local success, result = pcall(function()
            return remote:InvokeServer(unpack(args))
         end)

         if success and result ~= false then
            successCount = successCount + 1
         else
            failCount = failCount + 1
         end

         wait(0.3)
      end

      Rayfield:Notify({
         Title = "Codes Processed",
         Content = "Success: " .. successCount .. " | Failed/Used: " .. failCount,
         Duration = 8
      })
   end
})

print("Codes.lua loaded successfully!")