--BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleShowIDCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "showid") then return false end

    ShowIDFunction(playerIndex)
    
    return true

end