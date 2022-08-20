local w = 500

RegisterCommand("createid", function(source, args, rawCommand)
    TriggerEvent('hxvrmxn:idcreation')
end)


RegisterNetEvent('hxvrmxn:idcreation')
AddEventHandler('hxvrmxn:idcreation', function()
	local name
	local lastname
	local dob

	name = KeyboardInput('Name', '', 15)

	if name ~= nil then 
		lastname = KeyboardInput('Lastname', '', 15)
	end

	if lastname ~= nil then 
		dob = KeyboardInput('DOB (01/01/1990)', '', 10)
	end
		
	if dob ~= nil then 
		TriggerServerEvent('hxvrmxn:generateid', name, lastname, dob)
	end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

RegisterCommand('presentid', function()
	TriggerServerEvent('hxvrmxn:showid')
end)

RegisterNetEvent("chat:proximity")
AddEventHandler("chat:proximity", function(serverId,chatMessage)
    local source = PlayerId()
    local target = GetPlayerFromServerId(serverId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    local distance = GetDistanceBetweenCoords(sourceCoords, targetCoords, true)
    if target == source then
        TriggerEvent("chat:addMessage", chatMessage)
     elseif distance < 10 and distance ~= 0 and distance > 0.1 then
     	TriggerEvent("chat:addMessage", chatMessage)
    end
end)