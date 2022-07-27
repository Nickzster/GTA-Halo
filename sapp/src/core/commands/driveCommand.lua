-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import shared.globals end
-- END_IMPORT


function DriveCommand(PlayerIndex, vehicleToDrive) --Summons a specified vehicle for the player that requests it.
	if PlayerSpawnedVehicles[PlayerIndex] ~= 1 then --if the player does not have a spawned vehicle
		if playerIsInArea(PlayerIndex, "garage") then --and they are at a valid garage
			if ownsThisCar(PlayerIndex, vehicleToDrive) == true then --and they own the car they want to spawn
				Spawn(PlayerIndex, commandargs) --spawn it
			else --otherwise, let them know that they don't own it.
				rprint(PlayerIndex, "You do not own this vehicle.")
			end
		else --otherwise, let them know that they are not at a valid garage
			rprint(PlayerIndex, "You need to be at a valid garage location!")
		end
	else
		rprint(PlayerIndex, "You already have a summoned vehicle!")
	end
end