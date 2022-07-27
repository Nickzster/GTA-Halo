-- BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleWalletCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "wallet") then return false end

    local localPlayer = ActivePlayers[playerIndex]
    local aTable = ActivePlayers[playerIndex]
    rprint(playerIndex, "Wallet: "..niceMoneyDisplay(localPlayer:getBucks()))

    return true
end