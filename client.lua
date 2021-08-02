local playerNamesDist = 10

Citizen.CreateThread(function()
    while true do
	for _, player in ipaids(GetActivePlayers()) do
		local x1, y1, z1 = table.unpack( GetEntityCoords( PlayerPedId(), true ) )
		local x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( player ), true ) )
		local distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
		local takeaway = 0.95

		if ((distance < playerNamesDist) and IsEntityVisible(GetPlayerPed(player))) ~= PlayerPedId() then
		    if NetworkIsPlayerTalking(player) then
			DrawMarker(25,x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 55, 160, 205, 105, 0, 0, 2, 0, 0, 0, 0)
		    else
			DrawMarker(25, x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 239, 239, 239, 50, 0, 0, 2, 0, 0, 0, 0)
		    end
		end  
	end
        Citizen.Wait(0)
    end
end)
