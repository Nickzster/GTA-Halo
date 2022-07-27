-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import shared.globals end
-- END_IMPORT

function handleParkCommand(playerIndex, commandName, commandArgs) --Parks a player's vehicle. Will be modified in the future to ONLY park within certain areas.
	
	if not validateCommand(commandName, 'park') then return false end

	if PlayerIsInAVehicle[playerIndex] == 0 then --if the player not in a vehicle
		if playerIsInArea(playerIndex, "garage") then --and the player is at a garage
			execute_command("vdel " .. playerIndex) --then park their vehicle
			PlayerSpawnedVehicles[playerIndex] = 0
		else
			rprint(playerIndex, "You need to be at a garage in order to park your car!")
		end
	else --otherwise, let them know that they need to exit the vehicle to park it.
		rprint(playerIndex, "You need to exit the vehicle first!")
	end

	return true
end