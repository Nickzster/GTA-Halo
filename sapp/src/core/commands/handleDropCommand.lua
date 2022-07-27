--BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleDropCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "drop") then return false end

    drop_weapon(playerIndex)

    return true

end