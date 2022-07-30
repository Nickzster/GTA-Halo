-- NO_IMPORTS

function createClosure(playerIndex, message)

    return function()
        rprint(playerIndex, message)
    end

end

function handleTestCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "test") then return false end

    local closure = createClosure(playerIndex, "Closures do in fact work!")

    closure()

    return true

end