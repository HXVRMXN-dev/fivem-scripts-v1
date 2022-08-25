-- DO NOT EDIT BELOW --

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', "/" .. Config.Command, 'Create a manual reminder to all players.', {
	    { name="Message", help="Input your reminder message" },
	})
end)