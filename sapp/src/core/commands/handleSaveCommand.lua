-- BEGIN_IMPORT
-- import core.objects.LocalDB end
-- import helpers.validateCommand end
-- END_IMPORT

function handleSaveCommand(playerIndex, commandName, commandArgs) 
    if not validateCommand(commandName, "save") then return false end

    writePlayerData(playerIndex)

    return true
end