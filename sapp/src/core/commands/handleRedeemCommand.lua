--BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleRedeemCommand(playerIndex, commandName, commandArgs)

    if  not validateCommand(commandName, "redeem") then return false end

    if gunEvent ~= false or moneyEvent ~= false or carEvent ~= false then
        table.remove(commandargs,1)
        local typeOfEvent = commandargs[1]
        if typeOfEvent ~= nil then
            if typeOfEvent == "gun" and gunEvent ~= false then
                if playerIsInArea(playerIndex, "gunstore") then
                    local gunToGive = spawn_object("weapon", WEAPONS[FREE_GUN_TO_DISTRIBUTE]:getKey())
                    assign_weapon(gunToGive, playerIndex)
                    rprint(playerIndex, "You have successfully redeemed a "..FREE_GUN_TO_DISTRIBUTE.."!")
                else
                    rprint(playerIndex, "You must be at a gun store to redeem this item.")
                end
            elseif typeOfEvent == "money" and moneyEvent ~= false then
                if ClaimedRewards[get_var(playerIndex, "$hash")] == nil then
                    rprint(playerIndex, "Congratulations. You just earned free money!")
                    ActivePlayers[playerIndex]:payBucks(FREE_MONEY_TO_DISTRIBUTE)
                    ClaimedRewards[get_var(playerIndex, "$hash")] = get_var(playerIndex, "$hash")
                else
                    rprint(playerIndex, "You have already claimed this reward!")
                end
            elseif typeOfEvent == "car" and carEvent ~= false then
                if playerIsInArea(playerIndex, "dealership") then
                    local updatedVehicles = ActivePlayersOwnedCars[playerIndex]
                    if updatedVehicles[FREE_CAR_TO_DISTRIBUTE] == nil then
                        updatedVehicles[FREE_CAR_TO_DISTRIBUTE] = FREE_CAR_TO_DISTRIBUTE
                        ActivePlayersOwnedCars[playerIndex] = updatedVehicles
                        rprint(playerIndex, "You have successfully redeemed a "..FREE_CAR_TO_DISTRIBUTE.."!")
                    else
                        rprint(playerIndex, "You already own this vehicle!")
                    end
                else
                    rprint(playerIndex, "You must be at a dealership in order to redeem this vehicle.")
                end
            else
                rprint(playerIndex, "You did not specify a correct redemption value, OR")
                rprint(playerIndex, "That specific event is not activated.")
            end
        else
            rprint(playerIndex, "You did not specify a redemption value!")
        end
    else
        rprint(playerIndex, "There is currently no active freebe events.")
    end

    return true

end