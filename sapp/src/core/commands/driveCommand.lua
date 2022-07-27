-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import shared.globals end
-- import shared.config end
-- END_IMPORT


function handleDriveCommand(playerIndex, commandName, commandArgs) --Summons a specified vehicle for the player that requests it.
	if commandName ~= COMMAND_NAMES['drive'] then return false end
	local vehicleToDrive = commandArgs[1]

	local hasActiveVehicle = PlayerSpawnedVehicles[playerIndex] == 1
	local isInGarage = playerIsInArea(playerIndex, "garage") == true
	local playerOwnsVehicle = ownsThisCar(playerIndex, vehicleToDrive) == true

	if hasActiveVehicle then rprint(playerIndex, "You already have a summoned vehicle!"); return true end

	if not isInGarage then rprint(playerIndex, "You need to be at a valid garage location!"); return true end

	if not playerOwnsVehicle then rprint(playerIndex, "You do not own this vehicle."); return true end

	Spawn(playerIndex, vehicleToDrive) --spawn it

	return true
end