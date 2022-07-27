--BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleActivateEventCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "activateevent") then return false end

    if adminLevel >= 4 then
        table.remove(commandargs,1)
        local typeOfEvent = commandargs[1]
        if typeOfEvent ~= nil then
            if typeOfEvent == "gun" and gunEvent == false then
                say_all("A GUN Event has been activated.")
                say_all("Head to the gun store to redeem a free gun!")
                gunEvent = true
            elseif typeOfEvent == "car" and carEvent == false then
                say_all("A CAR Event has been activated.")
                say_all("Head to the dealership to redeem a free car!")
                carEvent = true
            elseif typeOfEvent == "money" and moneyEvent == false then
                say_all("A MONEY event has been activated.")
                say_all ("Type in /redeem money ANYWHERE to get free money!")
                moneyEvent = true
            else
                rprint(playerIndex, "You did not specify a valid event! OR")
                rprint(playerIndex, "That event has already been activated!")
            end
        else
            rprint(playerIndex, "You did not specify the type of event to activate!")
        end		
    else
        rprint(playerIndex, "You cannot activate a redemption event.")
    end

    return true

end