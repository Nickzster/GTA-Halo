-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import config.globals end
-- END_IMPORT

function buyGun(PlayerIndex, gunToBuy)
	if playerIsInArea(PlayerIndex, "gunstore") then
		if gunToBuy ~= nil then
			if WEAPONS[gunToBuy] ~= nil then
				if WEAPONPRICES[gunToBuy] <= tonumber(ActivePlayers[PlayerIndex]:getBucks()) then
					local updatedWeapons = ActivePlayersOwnedWeapons[PlayerIndex]
					if updatedWeapons[gunToBuy] == nil then
						updatedWeapons[gunToBuy] = gunToBuy
						ActivePlayersOwnedWeapons[PlayerIndex] = updatedWeapons
						rprint(PlayerIndex, "You now own this weapon for loadouts.")
					end
					ActivePlayers[PlayerIndex].deductBucks(ActivePlayers[PlayerIndex], WEAPONPRICES[gunToBuy])
					giveGun(gunToBuy, PlayerIndex)
					rprint(PlayerIndex, "Purchase of "..gunToBuy.." for "..niceMoneyDisplay(WEAPONPRICES[gunToBuy]).." was successful.")
				else
					rprint(PlayerIndex, "You do not have enough bucks to buy this gun!")
				end
			else
				rprint(PlayerIndex, "An invalid gun was specified!")
			end
		else
			rprint(PlayerIndex, "In order to buy something, you need to specify what you want to buy!")
		end
	else
		rprint(PlayerIndex, "You need to be at a gunstore in order to buy weapons")
	end
end