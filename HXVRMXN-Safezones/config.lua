Config = {}
--[[
      READ ME!        READ ME !       READ ME!        READ ME !       READ ME!        READ ME !       READ ME!        READ ME !       READ ME!        READ ME ! 
           If you are using okokNotify make sure the resource/folder of the okokNotify is called okokNotify for it to work properly or you can change the name in client.lua
]]

-- Coords for all circular safezones, recommended to put in middle
Config.zones = {
	{ ['x'] = 1847.916015625, ['y'] = 3675.8190917968, ['z'] = 33.767009735108} -- Sandy Shores PD (County Office)
	-- Template: { ['x'] = , ['y'] = , ['z'] = } - If adding one to below add comma on end if final zone then remove comma or else you can have fun with it not working.
}


Config.showNotification = true -- Show notification when in Safezone?

Config.safezoneTitle = "Entered Safezone" -- Change the title of the message what shows you are in a safezone. (Added by Hxvrmxn)
Config.safezoneMessage = "You are currently in a Safezone" -- Change the message that shows when you are in a safezone. 

Config.outofsafeTitle = "Left Safezone" -- Change the title of the message what shows you are out of a safezone. (Added by Hxvrmxn)
Config.outofsafeMessage = "You are currently out of the safezone" -- Change the message that shows when you are out of a safezone. (Added by Hxvrmxn)

Config.radius = 50.0 -- Change the RADIUS of the Safezone.  Recommended to keep it 50 to 30 this affects all safezone until updated by HXVRMXN to make it seperate. 
Config.speedlimitinSafezone = 30.0 -- Set a speed limit in a Safezone (MPH), Set to false to disable. Recommended to keep it 60 to 10 this affects all safezone until updated by HXVRMXN to make it seperate. 

Config.time = 0 -- 1000 to 15000  (Added by Hxvrmxn)
Config.InSafetype = 'success' -- Types can be found below. (Added by Hxvrmxn)
Config.OutOfSafetype = 'error' -- Types can be found below. (Added by Hxvrmxn)

-- Change the color of the notification  (Added by Hxvrmxn)
--[[
Types: 
	- success (green)
	- info (blue)
	- warning (yellow)
	- error (red)
	- phone (orange)
	- neutral (grey)

	Script edited by HXVRMXN.dev you can find this script on my discord bio.
]]
