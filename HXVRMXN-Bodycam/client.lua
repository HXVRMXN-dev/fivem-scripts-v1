cam = true
allowthird = true
allowthirdtoggle = true
b = 0
CreateThread( function()
	while true do
		Wait(0)
		a = 1
		if ((GetFollowPedCamViewMode() == 4) and (a == b) and (cam)) then
			SendNUIMessage({ShowUI = true})
        	cam = false
        elseif not ((GetFollowPedCamViewMode() == 4) and (a == b)) then
        	b = a
        	if (allowthird and allowthirdtoggle) then
				SendNUIMessage({ShowUI = true})
        		allowthirdtoggle = false
        	elseif not allowthird then
        		SendNUIMessage({HideUI = true})
        		allowthirdtoggle = true
        	end
        	cam = true
        end
	end
end)

x = 0
weapon = true
CreateThread(function()
	while true do
		Wait(0)
		w = GetSelectedPedWeapon(PlayerPedId())
		if ((w ~= -1569615261) and (w == x) and (weapon)) then
        	SendNUIMessage({weapon = true})
        	weapon = false
        elseif not (w == x) then
        	x = w
        	weapon = true
        end
	end
end)

RegisterNUICallback('togglethirdperson', function()
	allowthird = not allowthird
end)

TriggerEvent('chat:addSuggestion', Configuration.CommandSuggest, Configuration.MessageSuggest, {
})

RegisterCommand(Configuration.Command, function()
	if Configuration.FirstPerson == true and GetFollowPedCamViewMode() == 4 then
		SendNUIMessage({ShowPowerButton = true})
		SetNuiFocus(true,true)
			if Configuration.Notify == "OkOk" then 
				exports['okokNotify']:Alert('Bodycam', 'Turned on bodycam!', Time, 'success')
				elseif Configuration.Notify == "Mythic" then
				    exports['mythic_notify']:DoHudText('success', 'Turned on bodycam!')
				elseif Configuration.Notify == "Infinity" then
				 TriggerEvent('infinity-notify:sendNotify', 'Bodycam</br>Turned on bodycam!', 'success')
				elseif Configuration.Notify == "K5" then
				 TriggerClientEvent("k5_notify:notify", source, 'Bodycam', 'Turned on bodycam!', 'HXVRMXN`s Bodycam Script')
				end
			end
		elseif GetFollowPedCamViewMode() == 4 then
		      DrawTextWait()
	    

		elseif Configuration.ThirdPersonMid == true and GetFollowPedCamViewMode() == 1 then
		SendNUIMessage({ShowPowerButton = true})
		SetNuiFocus(true,true)
			if Configuration.Notify == "OkOk" then 
				exports['okokNotify']:Alert('Bodycam', 'Turned on bodycam!', Time, 'success')
				elseif Configuration.Notify == "Mythic" then
				    exports['mythic_notify']:DoHudText('success', 'Turned on bodycam!')
				elseif Configuration.Notify == "Infinity" then
				 TriggerEvent('infinity-notify:sendNotify', 'Bodycam</br>Turned on bodycam!', 'success')
				elseif Configuration.Notify == "K5" then
				 TriggerClientEvent("k5_notify:notify", source, 'Bodycam', 'Turned on bodycam!', 'HXVRMXN`s Bodycam Script')
				end
			end
		elseif GetFollowPedCamViewMode() == 1 then
          DrawTextWait()
	       

		elseif Configuration.ThirdPersonFar == true and GetFollowPedCamViewMode() == 2 then
		SendNUIMessage({ShowPowerButton = true})
		SetNuiFocus(true,true)
			if Configuration.Notify == "OkOk" then 
				exports['okokNotify']:Alert('Bodycam', 'Turned on bodycam!', Time, 'success')
				elseif Configuration.Notify == "Mythic" then
				    exports['mythic_notify']:DoHudText('success', 'Turned on bodycam!')
				elseif Configuration.Notify == "Infinity" then
				 TriggerEvent('infinity-notify:sendNotify', 'Bodycam</br>Turned on bodycam!', 'success')
				elseif Configuration.Notify == "K5" then
				 TriggerClientEvent("k5_notify:notify", source, 'Bodycam', 'Turned on bodycam!', 'HXVRMXN`s Bodycam Script')
				end
			end
		elseif GetFollowPedCamViewMode() == 2 then
		 DrawTextWait()	        

		elseif Configuration.ThirdPersonCinematic == true and GetFollowPedCamViewMode() == 3 then
		SendNUIMessage({ShowPowerButton = true})
		SetNuiFocus(true,true)
			if Configuration.Notify == "OkOk" then 
				exports['okokNotify']:Alert('Bodycam', 'Turned on bodycam!', Time, 'success')
				elseif Configuration.Notify == "Mythic" then
				    exports['mythic_notify']:DoHudText('success', 'Turned on bodycam!')
				elseif Configuration.Notify == "Infinity" then
				 TriggerEvent('infinity-notify:sendNotify', 'Bodycam</br>Turned on bodycam!', 'success')
				elseif Configuration.Notify == "K5" then
				 TriggerClientEvent("k5_notify:notify", source, 'Bodycam', 'Turned on bodycam!', 'HXVRMXN`s Bodycam Script')
				end
			end
		elseif GetFollowPedCamViewMode() == 3 then
		 DrawTextWait()	    
	        

		elseif Configuration.ThirdPersonClose == true and GetFollowPedCamViewMode() == 0 then
		SendNUIMessage({ShowPowerButton = true})
		SetNuiFocus(true,true)
			if Configuration.Notify == "OkOk" then 
				exports['okokNotify']:Alert('Bodycam', 'Turned on bodycam!', Time, 'success')
				elseif Configuration.Notify == "Mythic" then
				    exports['mythic_notify']:DoHudText('success', 'Turned on bodycam!')
				elseif Configuration.Notify == "Infinity" then
				 TriggerEvent('infinity-notify:sendNotify', 'Bodycam</br>Turned on bodycam!', 'success')
				elseif Configuration.Notify == "K5" then
				 TriggerClientEvent("k5_notify:notify", source, 'Bodycam', 'Turned on bodycam!', 'HXVRMXN`s Bodycam Script')
				end
			end
		elseif GetFollowPedCamViewMode() == 0 then
		 DrawTextWait()	    
	   

		

		end
end, false)

RegisterNUICallback('close', function()
	SetNuiFocus(false)	
end)

function DrawText(text,x,y)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.35,0.35)
	SetTextColour(102, 255, 51)--r,g,b,a
	SetTextCentre(true)--true,false
	SetTextDropshadow(1,0,0,0,200)--distance,r,g,b,a
	SetTextEdge(1, 0, 0, 0, 255)
	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x,y)
end

function DrawTextWait()
	toggletext = true
	Wait(3000)
	toggletext = false
end

CreateThread(function()
	while true do
		Wait(0)
		if toggletext then
			DrawText("Invalid Camera Mode",0.5,0.92)
		end
	end
end)
