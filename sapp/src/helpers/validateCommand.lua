-- BEGIN_IMPORT
-- import shared.config end
-- END_IMPORT

function validateCommand(commandNameToCheck, expectedCommandName)
    return commandNameToCheck == COMMAND_NAMES[expectedCommandName]
end