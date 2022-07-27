--BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT


function handleCopCommand(playerIndex, commandName, commandArgs) 
    if not validateCommand(commandName, "cop") then return false end

	local tempCopStatus = ActivePlayers[playerIndex].getCopStatus(ActivePlayers[playerIndex])
	if tempCopStatus > 0 then
		table.remove(commandargs,1)
		copCommands(playerIndex, commandargs)
	else
		rprint(playerIndex, "You must be a cop to execute a cop command!")
	end

    return true
end