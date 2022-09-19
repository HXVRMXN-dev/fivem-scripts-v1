-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.
-- DO NOT TOUCH ANYTHING IN HERE JUST GO TO CONFIG.LUA YOU FRICKING MELON from HXVRMXN.

--[[
 _    _ __   ____      __ _____   __  __ __   __ _   _             _____                      _            __  __            _  _              _ 
 | |  | |\ \ / /\ \    / /|  __ \ |  \/  |\ \ / /| \ | |           / ____|                    | |          |  \/  |          | |(_)            | |
 | |__| | \ V /  \ \  / / | |__) || \  / | \ V / |  \| |  ______  | |      ___   _   _  _ __  | |_  _   _  | \  / |  ___   __| | _   ___  __ _ | |
 |  __  |  > <    \ \/ /  |  _  / | |\/| |  > <  | . ` | |______| | |     / _ \ | | | || '_ \ | __|| | | | | |\/| | / _ \ / _` || | / __|/ _` || |
 | |  | | / . \    \  /   | | \ \ | |  | | / . \ | |\  |          | |____| (_) || |_| || | | || |_ | |_| | | |  | ||  __/| (_| || || (__| (_| || |
 |_|  |_|/_/ \_\    \/    |_|  \_\|_|  |_|/_/ \_\|_| \_|           \_____|\___/  \__,_||_| |_| \__| \__, | |_|  |_| \___| \__,_||_| \___|\__,_||_|
                                                                                                    __/ |                                        
																									|___/                                         
--]]
                          



local discordwebhooklink = config.Webhhook
local htime = config.DefaultTime
local maxtime = config.MaxTime
local ace = config.EnableAce

function sendDiscord(name, message)
	local content = {
        {
        	["color"] = '133156238',
            ["author"] = {
		        ["name"] = "".. name .."",
		        ["icon_url"] = 'http://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/hospital.png',
		    },
            ["description"] = message,
            ["footer"] = {
            ["text"] = "",
            }
        }
    }
  	PerformHttpRequest(discordwebhooklink, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand("cm", function(source, args, raw)
	if IsPlayerAceAllowed(source, config.SendPerms) or IsPlayerAceAllowed(source, config.AllPerms) or ace == false then
	if #args <= 0 then
		TriggerClientEvent('chatMessage', source, "Use the following format:", {255, 0, 0}, "/cm [Player ID] [Seconds]")
	else
	local id = tonumber(args[1])
	if args[2] ~= nil then
		htime = tonumber(args[2])	
       	args[2] = config.DefaultTime 		
	end
	if htime > maxtime then
		htime = maxtime
	end   
	
	if GetPlayerName(id) ~= nil then
		TriggerClientEvent("CM:HospitalizePlayer", id, htime)
		TriggerClientEvent('chatMessage', -1, '^5 County Medical', { 54, 86, 245 }, GetPlayerName(id) ..' hospitalized for '.. htime ..' secs')
		local steam = GetPlayerName(source)
		local player = GetPlayerName(id)
		sendDiscord("User hospitalized", "**User:** ".. player .."\n**Time:** ".. htime .." seconds\n**Sent by:** ".. steam .."")
	end
end
else
	TriggerClientEvent('CM:noperms', source)
end
end, false)


RegisterCommand("uncm", function(source, args, raw)
	if IsPlayerAceAllowed(source, config.ReleasePerms) or IsPlayerAceAllowed(source, config.AllPerms) or ace == false then
	if #args <= 0 then
		TriggerClientEvent('chatMessage', source, "Use the following format:", {255, 0, 0}, "/uncm [Player ID]")
	else
	local id = tonumber(args[1])
    local htime = config.DefaultTime
	if GetPlayerName(id) ~= nil then
		TriggerClientEvent('chatMessage', source, '^5 County Medical', { 54, 86, 245 }, "Successfully unhospitalized ^2" .. GetPlayerName(id) .."")
        TriggerClientEvent("CM:UnhospitalizePlayer", id)
		local steam = GetPlayerName(source)
		local player = GetPlayerName(id)
		sendDiscord("User unhospitalized", "**User:** ".. player .."\n**Signed out by:** ".. steam .."")
	end
end
else
	TriggerClientEvent('CM:noperms', source)
end
end, false)

versionChecker = true -- Set to false to disable version checker

-- Don't touch
resourcename = "HXVRMXN's County Medical"
version = "1.0.0"
rawVersionLink = "https://pastebin.com/raw/Wc32WhVn"


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