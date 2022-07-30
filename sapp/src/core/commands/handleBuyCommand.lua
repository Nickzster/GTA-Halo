--BEGIN_IMPORT
-- import helpers.validateCommand end
-- import shared.globals end
-- import core.commands.helpers.buyVehicle end
-- import core.commands.helpers.buyGun end
-- END_IMPORT

function handleBuyCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "buy") then return false end

    local localPlayer = ActivePlayers[playerIndex]

    if VEHICLEPRICES[commandArgs[1]] ~= nil then
        buyVehicle(playerIndex, commandArgs[1])
    elseif WEAPONS[commandArgs[1]] ~= nil then
        buyGun(playerIndex, commandArgs[1])
    elseif commandArgs[1] == "ammo" then
        if playerIsInArea(playerIndex, "gunstore") then
            if tonumber(localPlayer:getBucks()) >= MAX_AMMO_PRICE then--if the player has enough money
                --then allow the purchase
                localPlayer:deductBucks(MAX_AMMO_PRICE)
                execute_command("ammo "..playerIndex.." 999 0")
                rprint(playerIndex, "Purchase of max ammo for "..niceMoneyDisplay(MAX_AMMO_PRICE).." was successful.")
            else
                --otherwise tell them they do not have enough
                rprint(playerIndex, "You do not have enough money to buy ammo.")
            end
        else
            rprint(playerIndex, "You need to be at a gunstore to buy ammo.")
        end
    else
        rprint(playerIndex, "Invalid object specified.")
    end

    return true
end