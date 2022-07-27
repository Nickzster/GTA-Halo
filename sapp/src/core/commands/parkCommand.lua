-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import config.globals end
-- END_IMPORT

function ParkCommand(PlayerIndex) --Parks a player's vehicle. Will be modified in the future to ONLY park within certain areas.
	if PlayerIsInAVehicle[PlayerIndex] == 0 then --if the player not in a vehicle
		if playerIsInArea(PlayerIndex, "garage") then --and the player is at a garage
			execute_command("vdel " .. PlayerIndex) --then park their vehicle
			PlayerSpawnedVehicles[PlayerIndex] = 0
		else
			rprint(PlayerIndex, "You need to be at a garage in order to park your car!")
		end
	else --otherwise, let them know that they need to exit the vehicle to park it.
		rprint(PlayerIndex, "You need to exit the vehicle first!")
	end
end