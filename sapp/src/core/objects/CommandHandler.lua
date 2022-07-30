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
-- import core.commands.handleRedeemCommand end
-- import core.commands.handleActivateEventCommand end
-- import core.commands.handleCheckCommand end
-- import core.commands.handleWalletCommand end
-- import core.commands.handleLoadoutCommand end
-- import core.commands.handleOwnedCommand end
-- import core.commands.handleTestCommand end
-- import helpers.serverUtils end
-- import shared.config end
-- import helpers.String end
-- END_IMPORT

function CommandHandler (playerIndex,Command,Environment,Password)
	if player_present(playerIndex) then
		Command = string.lower(Command)
		
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
		if handleWalletCommand(playerIndex, commandName, commandArgs) then return false end 
		if handleLoadoutCommand(playerIndex, commandName, commandArgs) then return false end
		if handleOwnedCommand(playerIndex, commandName, commandArgs) then return false end
		if handleTestCommand(playerIndex, commandName, commandArgs) then return false end
	end
	return true
end

