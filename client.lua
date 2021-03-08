Citizen.CreateThread(function()
 


 
  while true do
	print("ora piove")
    local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)
	local X = playerCoords.x + math.random(1,15)
	local Y = playerCoords.y + math.random(1,15)
	local Z = playerCoords.z + math.random(1,15) + 20
	print(X)
	print(Y)
	print(Z)
	local hash = GetHashKey("blimp")
	RequestModel(hash)
	local waiting = 0
	while not HasModelLoaded(hash) do
            waiting = waiting + 100
            Citizen.Wait(100)
        if waiting > 5000 then
            print("~r~Could not load the vehicle model in time, a crash was prevented.")
            break
        end
    end

	CreateVehicle(hash, X, Y, Z, 0, true, false)
    Citizen.Wait(60000)
  end
end)
