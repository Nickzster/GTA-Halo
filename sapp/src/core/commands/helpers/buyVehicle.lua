-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import shared.globals end
-- END_IMPORT

function buyVehicle(PlayerIndex, vehicleToBuy)

	if not playerIsInArea(PlayerIndex, "dealership") then rprint(PlayerIndex, "You need to be at a vehicle store in order to buy vehicles!"); return; end

	if vehicleToBuy == nil then rprint(PlayerIndex, "In order to buy something, you need to specify what you want to buy!"); return; end

	if VEHICLES[vehicleToBuy] == nil then rprint(PlayerIndex, "An invalid vehicle was specified!"); return; end

	if VEHICLES[vehicleToBuy]:getPrice() > tonumber(ActivePlayers[PlayerIndex]:getBucks()) then rprint(PlayerIndex, "You do not have enough money to buy this vehicle!"); return; end

	local updatedVehicles = ActivePlayersOwnedCars[PlayerIndex]

	if updatedVehicles[vehicleToBuy] == nil then
		updatedVehicles = ActivePlayersOwnedCars[PlayerIndex]
		updatedVehicles[vehicleToBuy] = vehicleToBuy
		ActivePlayersOwnedCars[PlayerIndex] = updatedVehicles						
		ActivePlayers[PlayerIndex].deductBucks(ActivePlayers[PlayerIndex], VEHICLES[vehicleToBuy]:getPrice())
		rprint(PlayerIndex, "Purchase of "..VEHICLES[vehicleToBuy]:getLabel().." for "..niceMoneyDisplay(VEHICLES[vehicleToBuy]:getPrice()).." was successful.")
	else 
		rprint(PlayerIndex, "You already own this vehicle!")
	end

	
end