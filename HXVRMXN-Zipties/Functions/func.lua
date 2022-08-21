function NearbyPlayer()
    local ped = PlayerPedId()
    for _, Player in ipairs(GetActivePlayers()) do
        if GetPlayerPed(Player) ~= GetPlayerPed(-1) then
            local Ped2 = GetPlayerPed(Player)
            local x, y, z = table.unpack(GetEntityCoords(ped))
            if (GetDistanceBetweenCoords(GetEntityCoords(Ped2), x, y, z) <  config.max_distance) then
                local playerId = GetPlayerServerId(Player);
                return playerId;
            end
        end
    end
    return false;
end