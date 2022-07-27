-- BEGIN_IMPORT
-- import core.commands.helpers.buyGun end
-- import core.commands.helpers.buyVehicle end
-- import core.commands.helpers.copCommands end
-- import core.commands.handleDriveCommand end
-- import core.commands.handleParkCommand end
-- import core.commands.handlePayCommand end
-- import core.commands.handleSaveCommand end
-- import core.commands.handleBuyCommand end
-- import helpers.serverUtils end
-- import shared.config end
-- import helpers.String end
-- END_IMPORT

function CommandHandler (playerIndex,Command,Environment,Password)
	local returnValue = true
    if desync() == false then
		if player_present(playerIndex) then
			Command = string.lower(Command)
			local adminLevel = tonumber(get_var(playerIndex, "$lvl")) -- Gets player admin level
			local localPlayer = ActivePlayers[playerIndex]
			
			local commandargs = splitString(Command)
			local commandArgs = splitString(Command)
			local commandName = table.remove(commandArgs, 1)

			if handleDriveCommand(playerIndex, commandName, commandArgs) then return false end
			if handleParkCommand(playerIndex, commandName, commandArgs) then return false end
			if handlePayCommand(playerIndex, commandName, commandArgs) then return false end
			if handleSaveCommand(playerIndex, commandName, commandArgs) then return false end
			if handleBuyCommand(playerIndex, commandName, commandArgs) then return false end

			if commandargs[1] == "cop" then
					-- local tempCopStatus = ActivePlayers[playerIndex].getCopStatus(ActivePlayers[playerIndex])
					-- if tempCopStatus > 0 then
					-- 	table.remove(commandargs,1)
					-- 	copCommands(playerIndex, commandargs)
					-- else
					-- 	rprint(playerIndex, "You must be a cop to execute a cop command!")
					-- end
					rprint(playerIndex, "This command is WIP (You entered "..commandargs[1]..")")
				return false
			elseif commandargs[1] == "hirecop" then
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
					return false
			elseif commandargs[1] == "testauthority" then
					if localPlayer:getCopAuthority() == 1 then
						rprint(playerIndex, "You have authority.")
					else
						rprint(playerIndex, "You do not have authority")
					end
					return false
			elseif commandargs[1] == "showid" then
					ShowIDFunction(playerIndex)
					return false
			elseif commandargs[1] == "drop" then
					drop_weapon(playerIndex)
					return false
			elseif commandargs[1] == "redeem" then
				if gunEvent ~= false or moneyEvent ~= false or carEvent ~= false then
					table.remove(commandargs,1)
					local typeOfEvent = commandargs[1]
					if typeOfEvent ~= nil then
						if typeOfEvent == "gun" and gunEvent ~= false then
							if playerIsInArea(playerIndex, "gunstore") then
								local gunToGive = spawn_object("weapon", WEAPONS[FREE_GUN_TO_DISTRIBUTE])
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
				return false
			elseif commandargs[1] == "activateevent" then
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
				return false
			elseif commandargs[1] == "check" then
				table.remove(commandargs,1)
				if #commandargs == 0 then
					rprint(playerIndex, "You need to specify what you want to check!")
				elseif commandargs[1] == "loadout" then
					rprint(playerIndex, "Primary Weapon: "..localPlayer:getPrimaryWeapon())
					rprint(playerIndex, "Secondary Weapon: "..localPlayer:getSecondaryWeapon())
				elseif commandargs[1] == "job" then
					if localPlayer.professionLimit ~= 0 then
						rprint(playerIndex, "You are a"..localPlayer:getProfession():getTitle())
					end
				elseif commandargs[1] == "rank" then
					local rankNumber = localPlayer:getCopRank()
					if rankNumber == 0 then
						rprint(playerIndex, "You are not a cop.")
					elseif rankNumber == 1 then
						rprint(playerIndex, "Deputy")
					elseif rankNumber == 2 then
						rprint(playerIndex, "Sheriff")
					end
				elseif commandargs[1] == "stats" then
					rprint(playerIndex, "Player Statistics for: "..ActivePlayers[playerIndex]:getName())
					rprint(playerIndex, "You are a "..ActivePlayers[playerIndex]:getProfession():getTitle())
					rprint(playerIndex, "You have "..ActivePlayers[playerIndex]:getKarma().." karma points.")
				elseif commandargs[1] == "all" then
					rprint(playerIndex, "name: "..ActivePlayers[playerIndex]:getName())
					rprint(playerIndex, "hash: "..ActivePlayers[playerIndex]:getHash())
					rprint(playerIndex, "bucks: "..ActivePlayers[playerIndex]:getBucks())
					rprint(playerIndex, "profession: "..ActivePlayers[playerIndex]:getProfession():getTitle())
					rprint(playerIndex, "apartment: "..ActivePlayers[playerIndex]:getApartment())
					rprint(playerIndex, "cop position: "..ActivePlayers[playerIndex]:getCopPosition().." ("..COPPOSITIONS[ActivePlayers[playerIndex]:getCopPosition()]..")")
					rprint(playerIndex, "authority: "..ActivePlayers[playerIndex]:getCopAuthority())
					rprint(playerIndex, "fugitive status: "..ActivePlayers[playerIndex]:getFugitiveStatus())
					rprint(playerIndex, "karma: "..ActivePlayers[playerIndex]:getKarma())
					rprint(playerIndex, "primary weapon: "..ActivePlayers[playerIndex]:getPrimaryWeapon())
					rprint(playerIndex, "secondary weapon: "..ActivePlayers[playerIndex]:getSecondaryWeapon())
					rprint(playerIndex, "jail status: "..ActivePlayers[playerIndex]:getJailStatus())
				end
				return false
			elseif commandargs[1] == "wallet" then --/checkstatus -> debug function
				local aTable = ActivePlayers[playerIndex]
				rprint(playerIndex, "Wallet: "..niceMoneyDisplay(localPlayer:getBucks()))
				return false
			elseif commandargs[1] == "loadout" then
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
				return false
			elseif commandargs[1] == "owned" then
				table.remove(commandargs,1)
				if commandargs[1] == "cars" or commandargs[1] == "vehicles" then
					rprint(playerIndex, "You own the following cars: ")
					local vehicleTable = ActivePlayersOwnedCars[playerIndex]
					for vehicleName, veh in pairs(vehicleTable) do
						rprint(playerIndex, vehicleName)
					end
				elseif commandargs[1] == "guns" or commandargs[1] == "weapons" then
					rprint(playerIndex, "You own the following weapons: ")
					local weaponTable = ActivePlayersOwnedWeapons[playerIndex]
					for weaponName, veh in pairs(weaponTable) do
						rprint(playerIndex, weaponName)
					end
				end
				return false
			elseif commandargs[1] == "betatester" then
				-- localPlayer:setBucks(15000)
				-- rprint(playerIndex, "Be Careful! This will SET your bucks to 15,000!")
				return false
			end
		end
	else
		rprint(playerIndex, "You cannot issue a command while the server is desynced!")
	end

end