--BEGIN_IMPORT
-- import config.globals end
-- import core.Inventory end
-- import helpers.moneyDisplay end
-- import core.LocalDB end
-- import helpers.serverUtils end
-- import helpers.gameUtils end
-- import core.commands.buyGun end
--END_IMPORT


function OnScriptUnload()
end

--Define your callbacks in here.

function OnScriptLoad()
	register_callback(cb['EVENT_COMMAND'],"OnCommand")
	register_callback(cb['EVENT_VEHICLE_ENTER'], "OnVehicleEnter")
	register_callback(cb['EVENT_VEHICLE_EXIT'], "OnVehicleExit")
	register_callback(cb['EVENT_LEAVE'], "OnPlayerLeave")
	register_callback(cb['EVENT_JOIN'], "OnPlayerJoin")
	register_callback(cb['EVENT_GAME_START'], "OnGameStart")
	register_callback(cb['EVENT_GAME_END'], "OnGameEnd")
	register_callback(cb['EVENT_DIE'], "OnPlayerDie")
	register_callback(cb['EVENT_AREA_ENTER'], "OnAreaEnter")
	register_callback(cb['EVENT_AREA_EXIT'], "OnAreaExit")
	register_callback(cb['EVENT_KILL'], "OnKill")
	register_callback(cb['EVENT_SUICIDE'], "OnSuicide")
	register_callback(cb['EVENT_TICK'], "OnTick")
	register_callback(cb['EVENT_OBJECT_SPAWN'],"OnObjectSpawn")
	register_callback(cb['EVENT_SPAWN'], "OnSpawn")
	--initalizeInventory()
end


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

function copCommands(PlayerIndex, commandargs)
	if commandargs[1] == "setwantedlevel" then
		table.remove(commandargs,1)
		WantedPlayer = tonumber(commandargs[1])
		if WantedPlayer ~= nil then
			table.remove(commandargs,1)
			local tempWantedLevel = tonumber(commandargs[1])
			if tempWantedLevel ~= nil then
				ActivePlayers[WantedPlayer].setWantedLevel(ActivePlayers[WantedPlayer], tempWantedLevel)
				if tempWantedLevel > 0 then
					AlertServer(nil, "A wanted level was issued by the police! Be on the lookout for someone suspicious!")
					AlertServer(WantedPlayer, "You now have a wanted level of "..tempWantedLevel)
				else
					AlertServer(nil, "A wanted level has been removed. It is now a little safer...")
					AlertServer(WantedPlayer, "Your wanted level has been removed.")
				end
			else
				rprint(PlayerIndex, "Invalid wanted level was specified!")
			end
		else
			rprint(PlayerIndex, "Invalid player was specified!")
		end
	elseif commandargs[1] == "detain" then
		table.remove(commandargs,1)
		local PlayerToDetain = tonumber(commandargs[1])
		if PlayerToDetain ~= nil then
			distance = getDistance(PlayerIndex, PlayerToDetain)
				if distance < 1 then
					execute_command("s "..PlayerToDetain.." 0")
					AlertServer(PlayerToDetain, "You have been detained!")
				else
					rprint(PlayerIndex, "You are too far away to do that!")
				end
		else
			rprint(PlayerIndex, "Invalid player specified!")
		end
	elseif commandargs[1] == "undetain" then
		table.remove(commandargs,1)
		PlayerToUndetain = tonumber(commandargs[1])
		execute_command("s "..PlayerToUndetain.." 1")
		AlertServer(PlayerToDetain, "You have been undetained!")
	elseif commandargs[1] == "confiscate" then
		table.remove(commandargs,1)
		local PlayerToConfiscate = tonumber(commandargs[1])
		if getDistance(PlayerIndex, PlayerToConfiscate) < 1 then
			execute_command("wdel "..PlayerToConfiscate.." 5")
		else
			rprint(PlayerIndex, "The player is too far away for you to do that!")
		end
	elseif commandargs[1] == "fine" then
		-- table.remove(commandargs,1)
		-- local PlayerToFine = commandargs[1]
		-- if PlayerToFine ~= nil then
		-- 	PlayerToFine = tonumber(PlayerToFine)
		-- 	table.remove(commandargs,1)
		-- 	local amountToFine = commandargs[1]
		-- 	if amountToFine ~= nil then
		-- 		amountToFine = tonumber(amountToFine)
		-- 		local bankBalance = tonumber(ActivePlayers[PlayerToFine].getBucks(ActivePlayers[PlayerToFine]))
		-- 		if bankBalance ~= nil then
		-- 			if amountToFine < bankBalance then --if the player has enough money in their bank
		-- 				ActivePlayers[PlayerToFine].deductBank(ActivePlayers[PlayerToFine], amountToFine) --then take the fine out of their bank
		-- 			else --otherwise, take it out of their bank and cash
		-- 				local cashDifference = amountToFine - bankBalance
		-- 				ActivePlayers[PlayerToFine].deductBank(ActivePlayers[PlayerToFine], amountToFine)
		-- 				ActivePlayers[PlayerToFine].deductCash(ActivePlayers[PlayerToFine], cashDifference)
		-- 			end
		-- 		else
		-- 			rprint(PlayerIndex, "Invalid fine amount specified!")
		-- 		end
		-- 	else
		-- 		rprint(PlayerIndex, "Invalid fine amount specified")
		-- 	end
		-- else
		-- 	rprint(PlayerIndex, "Invalid player index specified!")
		-- end
		rprint(PlayerIndex, "Work in progress")
	elseif commandargs[1] == "enterhq" then
		if playerIsInArea(PlayerIndex, "hqenter") then
			execute_command("t "..PlayerIndex.." hqentrance")
		else
			rprint(PlayerIndex, "You must be at HQ entrance to enter HQ!")
		end
	elseif commandargs[1] == "enterhqmagically" then
		execute_command("t "..PlayerIndex.." hqentrance")
	elseif commandargs[1] == "exithq" then
		execute_command("t "..PlayerIndex.." hqexit")
	else
		rprint(PlayerIndex, "Invalid cop command was issued!")
	end
end

function DriveCommand(PlayerIndex, vehicleToDrive) --Summons a specified vehicle for the player that requests it.
	if PlayerSpawnedVehicles[PlayerIndex] ~= 1 then --if the player does not have a spawned vehicle
		if playerIsInArea(PlayerIndex, "garage") then --and they are at a valid garage
			if ownsThisCar(PlayerIndex, vehicleToDrive) == true then --and they own the car they want to spawn
				Spawn(PlayerIndex, commandargs) --spawn it
			else --otherwise, let them know that they don't own it.
				rprint(PlayerIndex, "You do not own this vehicle.")
			end
		else --otherwise, let them know that they are not at a valid garage
			rprint(PlayerIndex, "You need to be at a valid garage location!")
		end
	else
		rprint(PlayerIndex, "You already have a summoned vehicle!")
	end
end

function ParkCommand(PlayerIndex) --Parks a player's vehicle. Will be modified in the future to ONLY park within certain areas.
	if PlayerIsInAVehicle[PlayerIndex] == 0 then --if the player not in a vehicle
		if playerIsInArea(PlayerIndex, "garage") then --and the player is at a garage
			execute_command("vdel " .. PlayerIndex) --then park their vehicle
			PlayerSpawnedVehicles[PlayerIndex] = 0
		else
			rprint(PlayerIndex, "You need to be at a garage in order to park your car!")
		end
	else --otherwise, let them know that they need to exit the vehicle to park it.
		rprint(PlayerIndex, "You need to exit the vehicle first!")
	end
end

function ShowIDFunction(PlayerIndex)
	for i=1, 16 do
		if ActivePlayers[PlayerIndex] ~= nil and ActivePlayers[i] ~= nil then
			if getDistance(PlayerIndex, i) < 2 then
				if ActivePlayers[i].getCopStatus(ActivePlayers[i]) > 0 then
					rprint(PlayerIndex, "You have successfully shown your ID")
					say(i, "Seeing Player ID:      ".."Name: "..get_var(PlayerIndex, "$name").."      PlayerIndex: "..PlayerIndex)
				end
			end
		end
	end
end

--CREDIT: altis - made this for me for twisted metal mod
function vehicleSpawn(PlayerIndex, name, vehicleClass) --utility function for Spawn, particularly for vehicles.
	--say(PlayerIndex, "Getcha ass together boy!")
	PlayerIndex = tonumber(PlayerIndex)
	if player_present(PlayerIndex) then
			execute_command("m "..PlayerIndex.." 0 0 0.4")
			execute_command("spawn vehi "..VEHICLES[name].." "..PlayerIndex)
			execute_command("venter "..PlayerIndex)
	end
end
function Spawn(PlayerIndex, commandargs) --utility function for DriveCommand
	for name, tag in pairs(VEHICLES) do
		if commandargs[1] == name then
			say(PlayerIndex, "Summoning " .. name )
			vehicleSpawn(PlayerIndex, name, commandParameter)
			PlayerSpawnedVehicles[PlayerIndex] = 1
		end
	end
end

function OnAreaEnter(PlayerIndex, areaEntered)
	PlayerAreas[PlayerIndex] = areaEntered
	rprint(PlayerIndex, "You have entered "..LOCATIONS[areaEntered])
end

function OnAreaExit(PlayerIndex, areaExited)
	PlayerAreas[PlayerIndex] = ""
	rprint(PlayerIndex, "You have exited "..LOCATIONS[areaExited])
end

function OnCommand(PlayerIndex,Command,Environment,Password)
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

function OnError(message)
	say_all("error was called")
	for i=0, 16 do
		if tonumber(get_var(i, "$lvl")) > 1 then -- Gets player admin level
			rprint(i, message)
		end
	end
	local file = io.open("errors.txt", "a")
	file:write(message)
	file:write("\n")
	file:close()
end

function OnGameEnd()
    OnGameEnd = OnScriptUnload
end

function OnGameStart()
	--gameStartSequence()
	print("Starting game...")
end

function OnKill(PlayerIndex, VictimIndex) --if a player kills someone
	rprint(PlayerIndex, "You earned money!")
	rprint(VictimIndex, "You lost money!")
	VictimIndex = tonumber(VictimIndex)
	local droppedCash = ActivePlayers[VictimIndex].getBucks(ActivePlayers[VictimIndex])
	ActivePlayers[PlayerIndex]:setFugitiveStatus(1)
	if tonumber(ActivePlayers[VictimIndex]:getCopRank()) > 0 then
		rprint(PlayerIndex, "You just killed a cop!")
	else
		rprint(PlayerIndex, "You just killed someone!")
	end
	ActivePlayers[PlayerIndex].payBucks(ActivePlayers[PlayerIndex], 100)
end

function OnObjectSpawn(PlayerIndex, MapID, ParentID, ObjectID)
    if(player_present(PlayerIndex) == false) then return true end --if player does not exist, do not execute. otherwise, proceed.
    if(DEFAULT_BIPED == nil) then --if the default biped is nil, then read into the globals, and grab it out of the globals.
        local tag_array = read_dword(0x40440000)
        for i=0,read_word(0x4044000C)-1 do
            local tag = tag_array + i * 0x20
            if(read_dword(tag) == 1835103335 and read_string(read_dword(tag + 0x10)) == "globals\\globals") then
                local tag_data = read_dword(tag + 0x14)
                local mp_info = read_dword(tag_data + 0x164 + 4)
                for j=0,read_dword(tag_data + 0x164)-1 do
                    DEFAULT_BIPED = read_dword(mp_info + j * 160 + 0x10 + 0xC)
                end
            end
        end
    end
    local hash = get_var(PlayerIndex,"$hash") --retrieves the player indexes CD hash to use it as an index in the CHOSEN_BIPEDS table.
    if(MapID == DEFAULT_BIPED and CHOSEN_BIPEDS[hash]) then --if the Tag ID matches the default biped, and the chosen biped matches the hash.
        for key,value in pairs(BIPEDS) do --(note: key and value represent "i"). Find the biped tag.
            if(BIPED_IDS[key] == nil) then --if it is found, overwrite.
                BIPED_IDS[key] = FindBipedTag(BIPEDS[key])
            end
        end
        return true,BIPED_IDS[CHOSEN_BIPEDS[hash]] --and return it. (in case it is not found, it does not get over-written.)
	end
    return true
end

function OnPlayerDie(PlayerIndex, message)
	execute_command("vdel " .. PlayerIndex)
	PlayerIsInAVehicle[PlayerIndex] = 0
	PlayerSpawnedVehicles[PlayerIndex] = 0
	-- setColor(PlayerIndex)
end

function OnPlayerJoin(PlayerIndex)
	getPlayerData(PlayerIndex)
end

function OnPlayerLeave(PlayerIndex)
	execute_command("vdel " .. PlayerIndex)
	PlayerIsInAVehicle[PlayerIndex] = 0
	PlayerSpawnedVehicles[PlayerIndex] = 0
	writePlayerData(PlayerIndex)
	local emptyInventory = Inventory:new(Inventory)
	local emptyVehicleTable = {}
	ActivePlayers[PlayerIndex] = emptyInventory
	ActivePlayersOwnedCars[PlayerIndex] = emptyVehicleTable
end

function OnSpawn(PlayerIndex)
	print("*********************OnSpawn called")
	if ActivePlayers[PlayerIndex]:getPrimaryWeapon() ~= "empty" and ActivePlayers[PlayerIndex]:getSecondaryWeapon() ~= "empty" then
		print("SETTING GUNS")
		giveGun(ActivePlayers[PlayerIndex]:getSecondaryWeapon(), PlayerIndex)
		giveGun(ActivePlayers[PlayerIndex]:getPrimaryWeapon(), PlayerIndex)
	end
end

function OnSuicide(PlayerIndex)
	rprint(PlayerIndex, "Why'd you kill yourself dum dum?!?")
end

function OnTick()
	if waitingToReward > timeToReward then
		AlertServer(nil, "Welfare has been distributed!")
		for i=1, 16 do
			if ActivePlayers[i] ~= nil then
				ActivePlayers[i].payBucks(ActivePlayers[i], 1500) --NEEDS TO BE CHANGED.
			end
		end
		waitingToReward = 0
	else
		waitingToReward = waitingToReward + 1
	end
end

function OnVehicleEnter(PlayerIndex)
	PlayerIsInAVehicle[PlayerIndex] = 1
end

function OnVehicleExit(PlayerIndex)
	PlayerIsInAVehicle[PlayerIndex] = 0
end
