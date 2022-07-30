-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import shared.globals end
-- END_IMPORT

function buyGun(PlayerIndex, gunToBuy)
	if not playerIsInArea(PlayerIndex, "gunstore") then rprint(PlayerIndex, "You need to be at a gunstore in order to buy weapons"); return; end

	if gunToBuy == nil then rprint(PlayerIndex, "In order to buy something, you need to specify what you want to buy!"); return; end

	if WEAPONS[gunToBuy] == nil then rprint(PlayerIndex, "An invalid gun was specified!"); return; end

	if WEAPONS[gunToBuy]:getPrice() > tonumber(ActivePlayers[PlayerIndex]:getBucks()) then rprint(PlayerIndex, "You do not have enough money to buy this gun!"); return; end

	local updatedWeapons = ActivePlayersOwnedWeapons[PlayerIndex]

	if updatedWeapons[gunToBuy] == nil then
		updatedWeapons[gunToBuy] = gunToBuy
		ActivePlayersOwnedWeapons[PlayerIndex] = updatedWeapons
		rprint(PlayerIndex, "You now own this weapon for loadouts.")
	end

	ActivePlayers[PlayerIndex].deductBucks(ActivePlayers[PlayerIndex], WEAPONS[gunToBuy]:getPrice())
	giveGun(gunToBuy, PlayerIndex)
	rprint(PlayerIndex, "Purchase of "..WEAPONS[gunToBuy]:getLabel().." for "..niceMoneyDisplay(WEAPONS[gunToBuy]:getPrice()).." was successful.")
			
end