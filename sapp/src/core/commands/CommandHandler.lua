-- BEGIN_IMPORT
-- import core.commands.buyGun end
-- import core.commands.buyVehicle end
-- import core.commands.copCommands end
-- import core.commands.driveCommand end
-- import core.commands.parkCommand end
-- import helpers.serverUtils end
-- END_IMPORT

function CommandHandler (PlayerIndex,Command,Environment,Password)
    if desync() == false then
		if player_present(PlayerIndex) then
			Command = string.lower(Command)
			local adminLevel = tonumber(get_var(PlayerIndex, "$lvl")) -- Gets player admin level
			local localPlayer = ActivePlayers[PlayerIndex]
			--rprint(PlayerIndex, "You are admin level "..adminLevel)
			commandargs = {}
			for w in Command:gmatch("%w+") do commandargs[#commandargs+1] = w end -- parses the string for spaces, and separates each word of the command into their own elements in the queue.  
			if commandargs[1] == "drive" then --/drive <car> -> summons the specified car if the player owns it.
					table.remove(commandargs, 1) --pop the first element off the command queue.
					DriveCommand(PlayerIndex, commandargs[1])
					return false
			elseif commandargs[1] == "park" then --/park -> despawns the specified car if the player owns it
					ParkCommand(PlayerIndex)
					return false
			elseif commandargs[1] == "pay" then --/pay <playerindex> <amount> -> pays player a certain amount of money
					if adminLevel > 0  then
						table.remove(commandargs,1)
						local playerToPay = tonumber(commandargs[1])
						local amountToPay = tonumber(commandargs[2])
						payAPlayer(playerToPay, amountToPay)
					else
						rprint(PlayerIndex, "You do not have sufficent admin privileges to execute this command.")
					end
					return false
			elseif commandargs[1] == "save" then --/save -> writes ActivePlayers -> $hash
					writePlayerData(PlayerIndex)
					return false
			elseif commandargs[1] == "buy" then --/buy <objectToBuy> <objectName> -> allows a player to buy something.
					table.remove(commandargs, 1)
					if VEHICLEPRICES[commandargs[1]] ~= nil then
						buyVehicle(PlayerIndex, commandargs[1])
					elseif WEAPONPRICES[commandargs[1]] ~= nil then
						buyGun(PlayerIndex, commandargs[1])
					elseif commandargs[1] == "ammo" then
						if playerIsInArea(PlayerIndex, "gunstore") then
							if tonumber(localPlayer:getBucks()) >= maxAmmoPrice then--if the player has enough money
								--then allow the purchase
								localPlayer:deductBucks(maxAmmoPrice)
								execute_command("ammo "..PlayerIndex.." 999 0")
								rprint(PlayerIndex, "Purchase of max ammo for "..niceMoneyDisplay(maxAmmoPrice).." was successful.")
							else
								--otherwise tell them they do not have enough
								rprint(PlayerIndex, "You do not have enough money to buy ammo.")
							end
						else
							rprint(PlayerIndex, "You need to be at a gunstore to buy ammo.")
						end
					else
						rprint(PlayerIndex, "Invalid object specified.")
					end
					return false
			elseif commandargs[1] == "cop" then
					-- local tempCopStatus = ActivePlayers[PlayerIndex].getCopStatus(ActivePlayers[PlayerIndex])
					-- if tempCopStatus > 0 then
					-- 	table.remove(commandargs,1)
					-- 	copCommands(PlayerIndex, commandargs)
					-- else
					-- 	rprint(PlayerIndex, "You must be a cop to execute a cop command!")
					-- end
					rprint(PlayerIndex, "This command is WIP (You entered "..commandargs[1]..")")
				return false
			elseif commandargs[1] == "hirecop" then
					if adminLevel >= 4 or localPlayer:getProfession() == "sheriff" then
						table.remove(commandargs,1)
						local hiredCop = tonumber(commandargs[1])
						if player_present(hiredCop) then
							if ActivePlayers[hiredCop]:setCopPosition(tonumber(commandargs[2])) then
								rprint(hiredCop, "You are now a "..COPPOSITIONS[tonumber(commandargs[2])])
								rprint(PlayerIndex, "You have successfully changed "..ActivePlayers[hiredCop]:getName().." to be a "..COPPOSITIONS[tonumber(commandargs[2])])
								ActivePlayers[hiredCop]:setProfession(COPPOSITIONS[tonumber(commandargs[2])])
								if ActivePlayers[hiredCop]:getCopPosition() == 0 then
									rprint(PlayerIndex, "AUTHORITY LOST")
									ActivePlayers[hiredCop]:setCopAuthority(0)
								else
									rprint(PlayerIndex, "AUTHORITY GAINED")
									ActivePlayers[hiredCop]:setCopAuthority(1)
								end
							else
								rprint(PlayerIndex, "You did not specify a valid cop rank.")
							end
						else
							rprint(PlayerIndex, "This person is not active on the server right now.")
						end
					else
						rprint(PlayerIndex, "You do not have permission to hire cops!")
					end
					rprint(PlayerIndex, "This command is WIP (You entered "..commandargs[1]..")")
					return false
			elseif commandargs[1] == "testauthority" then
					if localPlayer:getCopAuthority() == 1 then
						rprint(PlayerIndex, "You have authority.")
					else
						rprint(PlayerIndex, "You do not have authority")
					end
					return false
			elseif commandargs[1] == "showid" then
					ShowIDFunction(PlayerIndex)
					return false
			elseif commandargs[1] == "drop" then
					drop_weapon(PlayerIndex)
					return false
			elseif commandargs[1] == "redeem" then
				if gunEvent ~= false or moneyEvent ~= false or carEvent ~= false then
					table.remove(commandargs,1)
					local typeOfEvent = commandargs[1]
					if typeOfEvent ~= nil then
						if typeOfEvent == "gun" and gunEvent ~= false then
							if playerIsInArea(PlayerIndex, "gunstore") then
								local gunToGive = spawn_object("weapon", WEAPONS[freeGun])
								assign_weapon(gunToGive, PlayerIndex)
								rprint(PlayerIndex, "You have successfully redeemed a "..freeGun.."!")
							else
								rprint(PlayerIndex, "You must be at a gun store to redeem this item.")
							end
						elseif typeOfEvent == "money" and moneyEvent ~= false then
							if ClaimedRewards[get_var(PlayerIndex, "$hash")] == nil then
								rprint(PlayerIndex, "Congratulations. You just earned free money!")
								ActivePlayers[PlayerIndex]:payBucks(freeMoney)
								ClaimedRewards[get_var(PlayerIndex, "$hash")] = get_var(PlayerIndex, "$hash")
							else
								rprint(PlayerIndex, "You have already claimed this reward!")
							end
						elseif typeOfEvent == "car" and carEvent ~= false then
							if playerIsInArea(PlayerIndex, "dealership") then
								local updatedVehicles = ActivePlayersOwnedCars[PlayerIndex]
								if updatedVehicles[freeCar] == nil then
									updatedVehicles[freeCar] = freeCar
									ActivePlayersOwnedCars[PlayerIndex] = updatedVehicles
									rprint(PlayerIndex, "You have successfully redeemed a "..freeCar.."!")
								else
									rprint(PlayerIndex, "You already own this vehicle!")
								end
							else
								rprint(PlayerIndex, "You must be at a dealership in order to redeem this vehicle.")
							end
						else
							rprint(PlayerIndex, "You did not specify a correct redemption value, OR")
							rprint(PlayerIndex, "That specific event is not activated.")
						end
					else
						rprint(PlayerIndex, "You did not specify a redemption value!")
					end
				else
					rprint(PlayerIndex, "There is currently no active freebe events.")
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
							rprint(PlayerIndex, "You did not specify a valid event! OR")
							rprint(PlayerIndex, "That event has already been activated!")
						end
					else
						rprint(PlayerIndex, "You did not specify the type of event to activate!")
					end		
				else
					rprint(PlayerIndex, "You cannot activate a redemption event.")
				end
				return false
			elseif commandargs[1] == "check" then
				table.remove(commandargs,1)
				if #commandargs == 0 then
					rprint(PlayerIndex, "You need to specify what you want to check!")
				elseif commandargs[1] == "loadout" then
					rprint(PlayerIndex, "Primary Weapon: "..localPlayer:getPrimaryWeapon())
					rprint(PlayerIndex, "Secondary Weapon: "..localPlayer:getSecondaryWeapon())
				elseif commandargs[1] == "job" then
					if localPlayer.professionLimit ~= 0 then
						rprint(PlayerIndex, "You are a"..localPlayer:getProfession())
					end
				elseif commandargs[1] == "rank" then
					local rankNumber = localPlayer:getCopRank()
					if rankNumber == 0 then
						rprint(PlayerIndex, "You are not a cop.")
					elseif rankNumber == 1 then
						rprint(PlayerIndex, "Deputy")
					elseif rankNumber == 2 then
						rprint(PlayerIndex, "Sheriff")
					end
				elseif commandargs[1] == "stats" then
					rprint(PlayerIndex, "Player Statistics for: "..ActivePlayers[PlayerIndex]:getName())
					rprint(PlayerIndex, "You are a "..ActivePlayers[PlayerIndex]:getProfession())
					rprint(PlayerIndex, "You have "..ActivePlayers[PlayerIndex]:getKarma().." karma points.")
				elseif commandargs[1] == "all" then
					rprint(PlayerIndex, "name: "..ActivePlayers[PlayerIndex]:getName())
					rprint(PlayerIndex, "hash: "..ActivePlayers[PlayerIndex]:getHash())
					rprint(PlayerIndex, "bucks: "..ActivePlayers[PlayerIndex]:getBucks())
					rprint(PlayerIndex, "profession: "..ActivePlayers[PlayerIndex]:getProfession())
					rprint(PlayerIndex, "apartment: "..ActivePlayers[PlayerIndex]:getApartment())
					rprint(PlayerIndex, "cop position: "..ActivePlayers[PlayerIndex]:getCopPosition().." ("..COPPOSITIONS[ActivePlayers[PlayerIndex]:getCopPosition()]..")")
					rprint(PlayerIndex, "authority: "..ActivePlayers[PlayerIndex]:getCopAuthority())
					rprint(PlayerIndex, "fugitive status: "..ActivePlayers[PlayerIndex]:getFugitiveStatus())
					rprint(PlayerIndex, "karma: "..ActivePlayers[PlayerIndex]:getKarma())
					rprint(PlayerIndex, "primary weapon: "..ActivePlayers[PlayerIndex]:getPrimaryWeapon())
					rprint(PlayerIndex, "secondary weapon: "..ActivePlayers[PlayerIndex]:getSecondaryWeapon())
					rprint(PlayerIndex, "jail status: "..ActivePlayers[PlayerIndex]:getJailStatus())
				end
				return false
			elseif commandargs[1] == "wallet" then --/checkstatus -> debug function
				local aTable = ActivePlayers[PlayerIndex]
				rprint(PlayerIndex, "Wallet: "..niceMoneyDisplay(localPlayer:getBucks()))
				return false
			elseif commandargs[1] == "loadout" then
				if playerIsInArea(PlayerIndex, "gunstore") then
					local ownedWeapons = ActivePlayersOwnedWeapons[PlayerIndex]
					if tonumber(ActivePlayers[PlayerIndex]:getBucks()) >= loadoutChangePrice then
						if ownedWeapons[commandargs[2]] == nil  and ownedWeapons[commandargs[3]] == nil then
							rprint(PlayerIndex, "Loadout command was not issued correctly.")
							rprint(PlayerIndex, "You specified one or more weapons you do not own.")
						else
							localPlayer:deductBucks(loadoutChangePrice)
							localPlayer:setLoadoutPrimary(commandargs[2])
							localPlayer:setLoadoutSecondary(commandargs[3])
							rprint(PlayerIndex, "You have successfully changed your loadout for "..niceMoneyDisplay(loadoutChangePrice))
							rprint(PlayerIndex, "Primary: "..localPlayer:getPrimaryWeapon()..", Secondary: "..localPlayer:getSecondaryWeapon())
						end
					else
						rprint(PlayerIndex, "You do not have enough bucks to change your loadout.")
					end
				else
					rprint(PlayerIndex, "You must be at a gunstore to change your loadout.")
				end		
				return false
			elseif commandargs[1] == "owned" then
				table.remove(commandargs,1)
				if commandargs[1] == "cars" or commandargs[1] == "vehicles" then
					rprint(PlayerIndex, "You own the following cars: ")
					local vehicleTable = ActivePlayersOwnedCars[PlayerIndex]
					for vehicleName, veh in pairs(vehicleTable) do
						rprint(PlayerIndex, vehicleName)
					end
				elseif commandargs[1] == "guns" or commandargs[1] == "weapons" then
					rprint(PlayerIndex, "You own the following weapons: ")
					local weaponTable = ActivePlayersOwnedWeapons[PlayerIndex]
					for weaponName, veh in pairs(weaponTable) do
						rprint(PlayerIndex, weaponName)
					end
				end
				return false
			elseif commandargs[1] == "betatester" then
				-- localPlayer:setBucks(15000)
				-- rprint(PlayerIndex, "Be Careful! This will SET your bucks to 15,000!")
				return false
			end
		end
	else
		rprint(PlayerIndex, "You cannot issue a command while the server is desynced!")
	end

end