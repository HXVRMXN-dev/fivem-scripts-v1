-- Locals below

local zip = false
local ziptied = false
local Cuffs = nil


-- Animation below

RegisterNetEvent('ZipAnimation')
AddEventHandler('ZipAnimation', function()
	local ped = PlayerPedId()
	while not HasAnimDictLoaded('mp_arresting') do
		Citizen.Wait(100)
	end
	TaskPlayAnim(ped, 'mp_arresting', 'a_uncuff', 8.0, -8, 3000, 49, 0, 0, 0, 0)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if ziptied then
			
			if IsEntityPlayingAnim(ped, 'mp_arresting', 'idle', 3) ~= 1 and ziptied then
				RequestAnimDict('mp_arresting')
				TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Ziptie user below

RegisterNetEvent('ClientTie')
AddEventHandler('ClientTie', function(id)
	local player = Closetplayer()
	if(player == false) then return TriggerEvent('chatMessage', "[^3SYSTEM^0] There are no players around you!") end
	TriggerServerEvent("ServerZiptie", player)
end)


RegisterNetEvent('ClientZip')
AddEventHandler('ClientZip', function()
	local ped = PlayerPedId()
	if not zip then
		local coords = GetEntityCoords(ped)
		RequestAnimDict("mp_arresting")
		while not HasAnimDictLoaded("mp_arresting") do
			Citizen.Wait(100)
		end
		TaskPlayAnim(ped, "mp_arresting", "idle",8.0,-8,-1,49,0,0,0,0)	
		SetEnableHandcuffs(ped, true)
		SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
		DisablePlayerFiring(ped, true)
		SetPedCanPlayGestureAnims(ped, false)
		FreezeEntityPosition(ped, false)
		Cuffs = CreateObject(GetHashKey("ba_prop_battle_cuffs"), coords.x, coords.y, coords.z, true, true, true)
		AttachEntityToEntity(Cuffs, ped, GetPedBoneIndex(ped, 60309), -0.020, 0.035, 0.06, 0.04, 155.0, 80.0, true, false, false, false, 0, true)
		zip = true
		ziptied = true
	    if Cuffs ~= nil then
			DetachEntity(Cuffs, true, true)
			DeleteEntity(Cuffs)
		end
	end
end)


-- Unzip the user below

RegisterNetEvent('UNTIE')
AddEventHandler('UNTIE', function()
	local player = Closetplayer()
	if(player == false) then return TriggerEvent('chatMessage', "[^3SYSTEM^0] There are no players around you!") end
	TriggerServerEvent("ServerUNZIP", player)
end)

RegisterNetEvent('ClientUNZIP')
AddEventHandler('ClientUNZIP', function()
	local ped = PlayerPedId()
	if Cuffs then
		zip = false
		ziptied = false
		DeleteEntity(Cuffs)
		DetachEntity(Cuffs, true, true)
		SetEnableHandcuffs(ped, false)
		DisablePlayerFiring(ped, false)
	    ClearPedSecondaryTask(ped)
	end
end)


