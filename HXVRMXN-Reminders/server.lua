-- DO NOT EDIT BELOW OR EXPECT ERRORS UNLESS CHANGING LINE 34's 'HXVRMXN`s Automated Reminder' bit--

-- Locals 
local AutomatedMessage = Config.Automated_Message
local Time = Config.TimeDisplayed
local Title = Config.Prefix
local NotPermitted = Config.No_Permissions
local NotifyType = Config.Notify
local AceP = Config.Ace_Perm

    -- Manual Reminder
    RegisterCommand(Config.Command, function(source, args)
      local Message = table.concat(args, " ", 1)
    
        if IsPlayerAceAllowed(source, AceP) then
	      if NotifyType == "Chat" then
             TriggerClientEvent("chatMessage", -1, Title .. Message)
	        elseif NotifyType == "Mythic" then 
		     TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Message, style = { ['background-color'] = '#ffffff', ['color'] = '#4c4cff' } })
			elseif NotifyType == "OkOk" then 
			 TriggerClientEvent('okokNotify:Alert', source, Title, Message, Time, 'info')
			elseif NotifyType == "Infinity" then
			 TriggerClientEvent('infinity-notify:sendNotify', source, Title .. '</br>' .. Message, 'info')
			elseif 
			 TriggerClientEvent("k5_notify:notify", source, Title, Message, 'HXVRMXN`s Reminder', Time)
			end
        else
           TriggerClientEvent("chatMessage", source, Title, {255,0,0}, NotPermitted)
        end
    end)

    -- Automated Reminder
    if Config.AutomatedReminder then
        if NotifyType == "Chat" then
	     TriggerClientEvent("chatMessage", -1, Config.Prefix .. AutomatedMessage)
        elseif NotifyType == "Mythic" then 
		 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = AutomatedMessage, style = { ['background-color'] = '#ffffff', ['color'] = '#4c4cff' } })
		elseif NotifyType == "OkOk" then
		 TriggerClientEvent('okokNotify:Alert', source, Title, AutomatedMessage, Time, 'info')
		elseif NotifyType == "Infinity" then
		 TriggerClientEvent('infinity-notify:sendNotify', source, Title .. '</br>' .. AutomatedMessage, 'info')
		elseif NotifyType == "K5" then
         TriggerClientEvent("k5_notify:notify", source, Title, AutomatedMessage, 'HXVRMXN`s Automated Reminder', Time)		
		end
	
    end 
	
	
-- Don't touch
resourcename = "HXVRMXN's Reminders"
version = "1.0.0"
rawVersionLink = "https://pastebin.com/raw/KqKLBtZE"


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