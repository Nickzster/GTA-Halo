-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import helpers.serverUtils end
-- END_IMPORT

function handlePayCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, 'pay') then return false end

    local isAdmin = playerIsAdmin(playerIndex)

    if not isAdmin then rprint(playerIndex, "You do not have sufficent admin privileges to execute this command."); return true end
    
    local playerToPay = tonumber(commandArgs[1])
    local amountToPay = tonumber(commandArgs[2])
    payAPlayer(playerToPay, amountToPay)

    return true

end