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
local htime = config.DefaultTime
local maxtime = config.MaxTime

function revivePed(pP)
	isDead = false
	timerCount1 = reviveTimer
	timerCount2 = respawnTimer
	local playerPos = GetEntityCoords(pP, true)
	NetworkResurrectLocalPlayer(playerPos, true, true, false)
	SetPlayerInvincible(pP, false)
	ClearPedBloodDamage(pP)
end

function ShowInfo(text)
	BeginTextCommandThefeedPost("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandThefeedPostTicker(true, false)
end

local Hospitalized = false
local Unhospitalized = false

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/cm', 'Send a player to County Medical treatment.', {
		{ name="Player ID", help="Player ID" },
		{ name="Seconds", help="Seconds" }
	})
	TriggerEvent('chat:addSuggestion', '/uncm', 'Unhospitalize a player from County Medical treatment.', {
		{ name="Player ID", help="Player ID" }
	})
end)

RegisterNetEvent("CM:HospitalizePlayer")
AddEventHandler("CM:HospitalizePlayer", function(htime)
    revivePed(pP)
	if Hospitalized == true then
		return
	end
	local pP = PlayerPedId()
	if DoesEntityExist(pP) then
		
		Citizen.CreateThread(function()
			local playerOldLoc = GetEntityCoords(pP, true)
			SetEntityCoords(pP, 297.35, -582.71, 43.13)
			Hospitalized = true
			Unhospitalized = false
			while htime > 0 and not Unhospitalized do
				pP = PlayerPedId()
				RemoveAllPedWeapons(pP, true)
				SetEntityInvincible(pP, true)
				if IsPedInAnyVehicle(pP, false) then
					ClearPedTasksImmediately(pP)
				end
				if htime % 30 == 0 then
					TriggerEvent('chatMessage', 'Hospitalized', { 54, 86, 245 }, htime .." months left until release.")
				end
				Citizen.Wait(500)
				local pL = GetEntityCoords(pP, true)
				local D = Vdist(297.35, -582.71, 43.13, pL['x'], pL['y'], pL['z'])
				if D > 15 then
					SetEntityCoords(pP, 297.35, -582.71, 43.13)
					if D > 15 then
						htime = htime + 35
					
						if htime > maxtime then
							htime = maxtime
						end
						TriggerEvent('chatMessage', '^5 County Medical', { 54, 86, 245 }, "Your hospital time was extended due to trying a unlawful leave on govermental enforced medical treatment.")
					end
				end
				htime = htime - 0.5
			end
			TriggerEvent('chatMessage', '^5 County Medical', { 54, 86, 245 }, "Your doctor has discharged you from treatment. You left the hospital.")
			SetEntityCoords(pP, 297.35, -582.71, 43.13)
			Hospitalized = false
			SetEntityInvincible(pP, false)

		end)
	end
end)

RegisterNetEvent("CM:UnhospitalizePlayer")
AddEventHandler("CM:UnhospitalizePlayer", function()
	Unhospitalized = true
	SetEntityCoords(pP, 297.35, -582.71, 43.13)

end)

RegisterNetEvent('CM:noperms')
AddEventHandler('CM:noperms', function()
    ShowInfo("~r~Insufficient Permissions to ~b~Hospitalize or Unhospitalize", pP)
end)

