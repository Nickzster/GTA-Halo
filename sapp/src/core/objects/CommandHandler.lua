-- BEGIN_IMPORT
-- import core.commands.helpers.buyGun end
-- import core.commands.helpers.buyVehicle end
-- import core.commands.helpers.copCommands end
-- import core.commands.handleDriveCommand end
-- import core.commands.handleParkCommand end
-- import core.commands.handlePayCommand end
-- import core.commands.handleSaveCommand end
-- import core.commands.handleBuyCommand end
-- import core.commands.handleCopCommand end
-- import core.commands.handleHireCopCommand end
-- import core.commands.handleShowIDCommand end
-- import core.commands.handleDropCommand end
-- import helpers.serverUtils end
-- import shared.config end
-- import helpers.String end
-- END_IMPORT

function CommandHandler (playerIndex,Command,Environment,Password)
	local returnValue = true
    if desync() == false then
		if player_present(playerIndex) then
			Command = string.lower(Command)
			local adminLevel = tonumber(get_var(playerIndex, "$lvl")) -- Gets player admin level
			local localPlayer = ActivePlayers[playerIndex]
			
			local commandargs = splitString(Command)
			local commandArgs = splitString(Command)
			local commandName = table.remove(commandArgs, 1)

			if handleDriveCommand(playerIndex, commandName, commandArgs) then return false end
			if handleParkCommand(playerIndex, commandName, commandArgs) then return false end
			if handlePayCommand(playerIndex, commandName, commandArgs) then return false end
			if handleSaveCommand(playerIndex, commandName, commandArgs) then return false end
			if handleBuyCommand(playerIndex, commandName, commandArgs) then return false end
			if handleCopCommand(playerIndex, commandName, commandArgs) then return false end 
			if handleHireCopCommand(playerIndex, commandName, commandArgs) then return false end
			if handleShowIDCommand(playerIndex, commandName, commandArgs) then return false end
			if handleDropCommand(playerIndex, commandName, commandArgs) then return false end
			if handleRedeemCommand(playerIndex, commandName, commandArgs) then return false end
			if handleActivateEventCommand(playerIndex, commandName, commandArgs) then return false end
			if handleCheckCommand(playerIndex, commandName, commandArgs) then return false end

			if commandargs[1] == "wallet" then --/checkstatus -> debug function
				local aTable = ActivePlayers[playerIndex]
				rprint(playerIndex, "Wallet: "..niceMoneyDisplay(localPlayer:getBucks()))
				return false
			elseif commandargs[1] == "loadout" then
				if playerIsInArea(playerIndex, "gunstore") then
					local ownedWeapons = ActivePlayersOwnedWeapons[playerIndex]
					if tonumber(ActivePlayers[playerIndex]:getBucks()) >= LOADOUT_CHANGE_PRICE then
						if ownedWeapons[commandargs[2]] == nil  and ownedWeapons[commandargs[3]] == nil then
							rprint(playerIndex, "Loadout command was not issued correctly.")
							rprint(playerIndex, "You specified one or more weapons you do not own.")
						else
							localPlayer:deductBucks(LOADOUT_CHANGE_PRICE)
							localPlayer:setLoadoutPrimary(commandargs[2])
							localPlayer:setLoadoutSecondary(commandargs[3])
							rprint(playerIndex, "You have successfully changed your loadout for "..niceMoneyDisplay(LOADOUT_CHANGE_PRICE))
							rprint(playerIndex, "Primary: "..localPlayer:getPrimaryWeapon()..", Secondary: "..localPlayer:getSecondaryWeapon())
						end
					else
						rprint(playerIndex, "You do not have enough bucks to change your loadout.")
					end
				else
					rprint(playerIndex, "You must be at a gunstore to change your loadout.")
				end		
				return false
			elseif commandargs[1] == "owned" then
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
				end
				return false
			elseif commandargs[1] == "betatester" then
				-- localPlayer:setBucks(15000)
				-- rprint(playerIndex, "Be Careful! This will SET your bucks to 15,000!")
				return false
			end
		end
	else
		rprint(playerIndex, "You cannot issue a command while the server is desynced!")
	end

end