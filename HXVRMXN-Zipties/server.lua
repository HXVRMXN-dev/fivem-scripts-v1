
-- Server Events

RegisterServerEvent("ServerZiptie")
AddEventHandler("ServerZiptie", function(player)
    TriggerClientEvent('ZipAnimation', source)
    TriggerClientEvent("ClientZiptie", player)
end)

RegisterServerEvent("ServerUNZIP")
AddEventHandler("ServerUNZIP", function(player)
    TriggerClientEvent('ZipAnimation', source)
    TriggerClientEvent("ClientUNZIP", player)
end)


-- Commands 
RegisterCommand("zip", function(source, args, message)
    if(config.enable_perms == true) then
        if IsPlayerAceAllowed(source, config.ace_perm) then
                TriggerClientEvent("ClientTie", source)
        else 
            TriggerClientEvent('chatMessage', source, "^1Insufficent Permissions")
        end
    end 
end)


RegisterCommand("unzip", function(source, args, message)
    if(config.enable_perms == true) then
        if IsPlayerAceAllowed(source, config.ace_perm) then
            TriggerClientEvent("UNTIE", source)
        else 
            TriggerClientEvent('chatMessage', source, "^1Insufficent Permissions")
        end
    end
end)

-- Don't touch
resourcename = "HXVRMXN's Ziptie Script [Standalone]"
version = "1.0.0"
rawVersionLink = "https://pastebin.com/raw/bTuZBdNR"


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
