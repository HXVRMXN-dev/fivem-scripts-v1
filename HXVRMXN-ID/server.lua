Identification = {}
Identification.Players = {}

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM id',{},function(res)
		for k,v in ipairs(res) do
			Identification.Players[v.identifier] = (Identification.Players[v.identifier] or {})
			Identification.Players[v.identifier].firstname  = v.firstname
			Identification.Players[v.identifier].lastname  = v.lastname
			Identification.Players[v.identifier].dateofbirth  = v.dateofbirth
		end
	end)
end)	

RegisterServerEvent('hxvrmxn:generateid')
AddEventHandler('hxvrmxn:generateid', function(name, lastname, dob)
	local identifier = GetPlayerIdentifier(source)
	local result = MySQL.Sync.fetchAll('SELECT identifier FROM id WHERE identifier = @identifier', {
		['@identifier'] = identifier
	})
	if #result > 0 then
		MySQL.Async.execute('UPDATE id SET firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth WHERE identifier = @identifier',
			{
				['@identifier']   = identifier,
				['@firstname']   = name,
				['@lastname']   = lastname,
				['@dateofbirth']   = dob,
			},
			function()
				Identification.Players[identifier] = (Identification.Players[identifier] or {})
				Identification.Players[identifier].firstname = name
				Identification.Players[identifier].lastname = lastname
				Identification.Players[identifier].dateofbirth = dob
			end
		)		
	else
		MySQL.Async.execute('INSERT INTO id (identifier, firstname, lastname, dateofbirth) VALUES (@identifier, @firstname, @lastname, @dateofbirth)',
			{
				['@identifier']   = identifier,
				['@firstname']   = name,
				['@lastname']   = lastname,
				['@dateofbirth']   = dob,
			},
			function()
				Identification.Players[identifier] = (Identification.Players[identifier] or {})
				Identification.Players[identifier].firstname = name
				Identification.Players[identifier].lastname = lastname
				Identification.Players[identifier].dateofbirth = dob
			end
		)
	end
end)

RegisterServerEvent('hxvrmxn:showid')
AddEventHandler('hxvrmxn:showid', function()
	local identifier = GetPlayerIdentifier(source)
	
	if Identification.Players[identifier] then
		TriggerClientEvent("chat:proximity", -1, source, {
			template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}</strong><br><strong>Name:</strong> {1} <br><strong>Lastname:</strong> {2} <br><strong>DOB:</strong> {3}</div></div>',
			args = {'Citizen ID', Identification.Players[identifier].firstname, Identification.Players[identifier].lastname, Identification.Players[identifier].dateofbirth}
		})
	end
end)


resourcename = "HXVRMXN's Standalone IDs"
version = "1.0.0"
rawVersionLink = "https://pastebin.com/raw/VPCvUCbb"


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