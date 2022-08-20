RegisterServerEvent("SafeZones:isAllowed")
AddEventHandler("SafeZones:isAllowed", function()
    if IsPlayerAceAllowed(source, "safezones.bypass") then
        TriggerClientEvent("SafeZones.returnIsAllowed", source, true)
    else
        TriggerClientEvent("SafeZones.returnIsAllowed", source, false)
    end
end)

versionChecker = true -- Set to false to disable version checker

local Time = Config.time

    if Time > 15000 or Time < 1000 then
     print("\n\r[".. GetCurrentResourceName() .."] Set time in config between 1000 or 15000, default time set of 5000")
    end 
-- Don't touch
resourcename = "HXVRMXN's SafeZones"
version = "1.0.1"
rawVersionLink = "https://pastebin.com/raw/hqENzbbv"


-- Check for version updates.
if versionChecker then
PerformHttpRequest(rawVersionLink, function(errorCode, result, headers)
    if (string.find(tostring(result), version) == nil) then
        print("\n\r[".. GetCurrentResourceName() .."] ^1WARNING: Your version of ".. resourcename .." is not up to date. Please make sure to update whenever possible.\n\r")
    else
        print("\n\r[".. GetCurrentResourceName() .."] ^2You are running the latest version of ".. resourcename ..".\n\r")
    end
end, "GET", "", "")
end
