-- BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleLoadoutCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "loadout") then return false end

    local localPlayer = ActivePlayers[playerIndex]
    
    if playerIsInArea(playerIndex, "gunstore") then
        local ownedWeapons = ActivePlayersOwnedWeapons[playerIndex]
        if tonumber(ActivePlayers[playerIndex]:getBucks()) >= LOADOUT_CHANGE_PRICE then
            if ownedWeapons[commandargs[2]] == nil  and ownedWeapons[commandargs[3]] == nil then
                rprint(playerIndex, "Loadout command was not issued correctly.")
                rprint(playerIndex, "You specified one or more weapons you do not own.")
            else
                localPlayer:deductBucks(LOADOUT_CHANGE_PRICE)
                localPlayer:setLoadoutPrimary(commandargs[2])
                localPlayer:setLoadoutSecondary(commandargs[3])
                rprint(playerIndex, "You have successfully changed your loadout for "..niceMoneyDisplay(LOADOUT_CHANGE_PRICE))
                rprint(playerIndex, "Primary: "..localPlayer:getPrimaryWeapon()..", Secondary: "..localPlayer:getSecondaryWeapon())
            end
        else
            rprint(playerIndex, "You do not have enough bucks to change your loadout.")
        end
    else
        rprint(playerIndex, "You must be at a gunstore to change your loadout.")
    end		

    return true

end