-- CodesPremium.lua - Standalone module for AFSE Hub
-- Auto-redeems all codes when loaded, with full notifications

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- List of all known codes (update whenever new ones drop!)
local CodeList = {
    "YenCode",
    "FreeChikara",
    "FreeChikara2",
    "FreeChikara3",
    "BugFixes1",
    "10Favs",
    "10Likes",
    "LASTFIX",
    "Update1Point1",
    "SorryForBugsLol",
    "1kVisits",
    "50Likes",
    "1000Members",
    "MobsUpdate",
    "1WeekAnniversary",
    "400CCU",
    "10kVisits",
    "100Favs",
    "100CCU",
    "Gullible67",
    "ChristmasDelay",
    "Krampus",
    "1MVisits",
    "10kLikes",
    "ChristmasTime"
    -- Add new codes here!
}

-- Wait a moment for Rayfield to be fully ready (safety)
task.wait(1)

-- Notify that redeeming has started
Rayfield:Notify({
    Title = "Codes",
    Content = "Starting to redeem all codes...",
    Duration = 5
})

local successCount = 0
local failCount = 0

for _, code in ipairs(CodeList) do
    local remote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("RemoteFunction")
    
    if not remote then
        Rayfield:Notify({
            Title = "Error",
            Content = "Remote not found! Game may have updated.",
            Duration = 10
        })
        break
    end

    local success, result = pcall(function()
        return remote:InvokeServer("Code", code)
    end)

    if success and result ~= false then
        successCount = successCount + 1
        Rayfield:Notify({
            Title = "Success",
            Content = "Redeemed: " .. code,
            Duration = 3
        })
    else
        failCount = failCount + 1
        Rayfield:Notify({
            Title = "Failed",
            Content = "Invalid/Used: " .. code,
            Duration = 3
        })
    end

    task.wait(0.3) -- Safe delay to avoid rate limits or detection
end

-- Final summary
Rayfield:Notify({
    Title = "Codes Finished",
    Content = "Successful: " .. successCount .. "\nFailed/Used: " .. failCount,
    Duration = 12
})

print("CodesPremium.lua - All codes processed!")