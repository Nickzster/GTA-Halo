-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import config.globals end
-- END_IMPORT

function buyVehicle(PlayerIndex, vehicleToBuy)
	if playerIsInArea(PlayerIndex, "dealership") then
		if vehicleToBuy ~= nil then --if the vehicle was correctly specified
			if VEHICLES[vehicleToBuy] ~= nil then --and it exists
				if VEHICLEPRICES[vehicleToBuy] ~= nil then --and it is for sale
					if VEHICLEPRICES[vehicleToBuy] <= tonumber(ActivePlayers[PlayerIndex].getBucks(ActivePlayers[PlayerIndex])) then --and the player has enough money
						--then they can buy it
							local updatedVehicles = ActivePlayersOwnedCars[PlayerIndex]
							if updatedVehicles[vehicleToBuy] == nil then
								updatedVehicles = ActivePlayersOwnedCars[PlayerIndex]
								updatedVehicles[vehicleToBuy] = vehicleToBuy
								ActivePlayersOwnedCars[PlayerIndex] = updatedVehicles						
								ActivePlayers[PlayerIndex].deductBucks(ActivePlayers[PlayerIndex], VEHICLEPRICES[vehicleToBuy])
								rprint(PlayerIndex, "Purchase of "..vehicleToBuy.." for "..niceMoneyDisplay(VEHICLEPRICES[vehicleToBuy]).." was successful.")
							else
								rprint(PlayerIndex, "You already own this vehicle!")
							end
					else
						rprint(PlayerIndex, "You do not have enough bucks to buy this vehicle!")
					end
				else
					rprint(PlayerIndex, "This vehicle is not for sale.")
				end
			else
				rprint(PlayerIndex, "An invalid vehicle name was specified!")
			end
		else
			rprint(PlayerIndex, "In order to buy something, you need to specify what you want to buy!")
		end
	else
		rprint(PlayerIndex, "You need to be at a dealership to buy a vehicle!")
	end
end