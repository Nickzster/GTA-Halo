--BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT


function handleHireCopCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "hirecop") then return false end

    if adminLevel >= 4 or localPlayer:getProfession():getTitle() == "sheriff" then
        table.remove(commandargs,1)
        local hiredCop = tonumber(commandargs[1])
        if player_present(hiredCop) then
            if ActivePlayers[hiredCop]:setCopPosition(tonumber(commandargs[2])) then
                rprint(hiredCop, "You are now a "..COPPOSITIONS[tonumber(commandargs[2])])
                rprint(playerIndex, "You have successfully changed "..ActivePlayers[hiredCop]:getName().." to be a "..COPPOSITIONS[tonumber(commandargs[2])])
                ActivePlayers[hiredCop]:setProfession(COPPOSITIONS[tonumber(commandargs[2])])
                if ActivePlayers[hiredCop]:getCopPosition() == 0 then
                    rprint(playerIndex, "AUTHORITY LOST")
                    ActivePlayers[hiredCop]:setCopAuthority(0)
                else
                    rprint(playerIndex, "AUTHORITY GAINED")
                    ActivePlayers[hiredCop]:setCopAuthority(1)
                end
            else
                rprint(playerIndex, "You did not specify a valid cop rank.")
            end
        else
            rprint(playerIndex, "This person is not active on the server right now.")
        end
    else
        rprint(playerIndex, "You do not have permission to hire cops!")
    end
    rprint(playerIndex, "This command is WIP (You entered "..commandargs[1]..")")

    return true
end