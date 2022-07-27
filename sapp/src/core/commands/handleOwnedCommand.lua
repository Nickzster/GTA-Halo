-- BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleOwnedCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "owned") then return false end

    table.remove(commandargs,1)
				if commandargs[1] == "cars" or commandargs[1] == "vehicles" then
					rprint(playerIndex, "You own the following cars: ")
					local vehicleTable = ActivePlayersOwnedCars[playerIndex]
					for vehicleName, veh in pairs(vehicleTable) do
						rprint(playerIndex, vehicleName)
					end
				elseif commandargs[1] == "guns" or commandargs[1] == "weapons" then
					rprint(playerIndex, "You own the following weapons: ")
					local weaponTable = ActivePlayersOwnedWeapons[playerIndex]
					for weaponName, veh in pairs(weaponTable) do
						rprint(playerIndex, weaponName)
					end

    return true
end