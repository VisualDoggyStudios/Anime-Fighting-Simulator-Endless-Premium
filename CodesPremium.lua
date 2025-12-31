-- CodesPremium.lua - Standalone module for AFSE Hub
-- Features: Auto-redeem all codes with notifications and manual redeem support

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- List of all known codes (update this whenever new codes drop!)
_G.CodeList = {
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

-- Function to redeem a single code (used by both auto and manual)
_G.RedeemCode = function(code)
    local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RemoteFunction")
    local success, result = pcall(function()
        return remote:InvokeServer("Code", code)
    end)

    if success and result ~= false then
        Rayfield:Notify({
            Title = "Code Success",
            Content = "Redeemed: " .. code,
            Duration = 3
        })
        return true
    else
        Rayfield:Notify({
            Title = "Code Failed",
            Content = "Invalid/Already Used: " .. code,
            Duration = 3
        })
        return false
    end
end

-- Main function: Redeem ALL codes
_G.RedeemAllCodes = function()
    local successCount = 0
    local failCount = 0

    for _, code in ipairs(_G.CodeList) do
        if _G.RedeemCode(code) then
            successCount = successCount + 1
        else
            failCount = failCount + 1
        end
        wait(0.3) -- Safe delay to avoid rate limiting
    end

    Rayfield:Notify({
        Title = "All Codes Processed",
        Content = "Successful: " .. successCount .. "\nFailed/Used: " .. failCount,
        Duration = 10
    })
end

print("CodesPremium.lua loaded - Codes system ready")