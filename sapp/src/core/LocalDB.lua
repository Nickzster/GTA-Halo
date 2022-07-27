-- BEGIN_IMPORT
-- import core.Inventory end
-- END_IMPORT

function writePlayerData(PlayerIndex) --ActivePlayers -> $hash
	print("\nWriting"..get_var(PlayerIndex, "$name").."'s data to a file.")
	local hashNumber = get_var(PlayerIndex, "$hash")
	local hashFile = "player_data_files/"..hashNumber
	print("\n It is in"..hashFile)
	local outputFile = io.open(hashFile, "w")
    if outputFile == nil then print("Uh oh! File not found. You need to create player_data_files!"); return end
	--error("Writing... "..hash)
	--print("writing name...")
	outputFile:write("$PLAYER_NAME")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getName())
	outputFile:write("\n")
	outputFile:write("$PLAYER_HASH")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getHash())
	outputFile:write("\n")
	outputFile:write("$PLAYER_BUCKS")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getBucks())
	outputFile:write("\n")
	outputFile:write("$PLAYER_PROFESSION")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getProfession())
	outputFile:write("\n")
	outputFile:write("$PLAYER_KARMA")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getKarma())
	outputFile:write("\n")
	outputFile:write("$PLAYER_APARTMENTSTATUS")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getApartment())
	outputFile:write("\n")
	outputFile:write("$PLAYER_COPPOSITION")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getCopPosition())
	outputFile:write("\n")
	outputFile:write("$PLAYER_AUTHORITY")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getCopAuthority())
	outputFile:write("\n")
	outputFile:write("$PLAYER_FUGITIVESTATUS")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getFugitiveStatus())
	outputFile:write("\n")
	outputFile:write("$PLAYER_LOADOUTPRIMARY")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getPrimaryWeapon())
	outputFile:write("\n")
	outputFile:write("$PLAYER_LOADOUTSECONDARY")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getSecondaryWeapon())
	outputFile:write("\n")
	outputFile:write("$PLAYER_JAILSTATUS")
	outputFile:write("\n")
	outputFile:write(ActivePlayers[PlayerIndex]:getJailStatus())
	outputFile:write("\n")
	--print("writing vehicles...")
	outputFile:write("@PLAYER_OWNEDVEHICLES")
	outputFile:write("\n")
	local vehicleTable = ActivePlayersOwnedCars[PlayerIndex]
		for vehicleName, veh in pairs(vehicleTable) do
			outputFile:write(vehicleName)
			outputFile:write("\n")
		end
	outputFile:write("@PLAYER_OWNEDVEHICLES")
	outputFile:write("\n")
	outputFile:write("@PLAYER_OWNEDWEAPONS")
	outputFile:write("\n")
	local weaponTable = ActivePlayersOwnedWeapons[PlayerIndex]
		for weaponName, weap in pairs(weaponTable) do
			outputFile:write(weaponName)
			outputFile:write("\n")
		end
	outputFile:write("@PLAYER_OWNEDWEAPONS")
	outputFile:write("\n")
	outputFile:write("$EOF")
	print("Done!")
	outputFile:close()	
end
function getPlayerData(PlayerIndex) --$hash -> ActivePlayers
	local fileHash = get_var(PlayerIndex, "$hash")
	local filename = "player_data_files/"..fileHash
	local inputFile = io.open(filename, "r") 
	local tempInventory = Inventory.new(Inventory)
	local tempVehicleTable = {}
	local tempWeaponTable = {}
	local playerName = get_var(PlayerIndex, "$name")
	if inputFile ~= nil then --if the file exists, then read the data in that way
		say(PlayerIndex, "Welcome BACK, "..playerName.."!")
		local endOfFile = false
		while endOfFile == false do
			local valueToCompare = inputFile:read("*l")
			print("\nChecking "..valueToCompare.." to see if it is valid.")
			if valueToCompare == "$PLAYER_NAME" then
				tempInventory:setName(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_HASH" then
				tempInventory:setHash(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_BUCKS" then
				tempInventory:setBucks(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_PROFESSION" then
				tempInventory:setProfession(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_KARMA" then
				tempInventory:setKarma(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_APARTMENTSTATUS" then
				tempInventory:setApartment(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_COPPOSITION" then
				tempInventory:setCopPosition(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_AUTHORITY" then
				tempInventory:setCopAuthority(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_FUGITIVESTATUS" then 
				tempInventory:setFugitiveStatus(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_LOADOUTPRIMARY" then
				tempInventory:setLoadoutPrimary(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_LOADOUTSECONDARY" then
				tempInventory:setLoadoutSecondary(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_JAILSTATUS" then
				tempInventory:setJailStatus(inputFile:read("*l"))
			elseif valueToCompare == "@PLAYER_OWNEDVEHICLES" then
				local readVehicles = true
				while readVehicles do
					local aVehicle = inputFile:read("*l")
					if aVehicle ~= "@PLAYER_OWNEDVEHICLES" then
						print("\n ***player owns a "..aVehicle.."\n")
						tempVehicleTable[aVehicle] = aVehicle
					else
						readVehicles = false
					end
				end
			elseif valueToCompare == "@PLAYER_OWNEDWEAPONS" then
				local readWeapons = true
				while readWeapons do
					local aWeapon = inputFile:read("*l")
					if aWeapon ~= "@PLAYER_OWNEDWEAPONS" then
						print("\n ***player owns a "..aWeapon.."\n")
						tempWeaponTable[aWeapon] = aWeapon
					else
						readWeapons = false
					end
				end
			elseif valueToCompare == "$EOF" then
				print("\nEnd of file reached.")
				endOfFile = true
			else
				print("\nRemoving depricated feature...\n")
			end
		end
		inputFile:close()
	else --otherwise, set default values.
		say(PlayerIndex, "Welcome to GTA Halo, "..playerName.."!")
		tempInventory:setName(playerName)
		tempInventory:setHash(fileHash)
		tempInventory:setBucks(5000)
		tempInventory:setApartment(0)
		tempInventory:setKarma(1)
		tempInventory:setCopPosition("")
		tempInventory:setCopAuthority(0)
		tempInventory:setProfession("civilian")
		tempInventory:setFugitiveStatus(0)
		tempInventory:setLoadout("empty","empty")
		tempInventory:setJailStatus(0)
		tempVehicleTable = {["cwarthog"] = "cwarthog"}
		tempWeaponTable = {["g17"] = "g17"}
	end
	ActivePlayers[PlayerIndex] = tempInventory
	ActivePlayersOwnedCars[PlayerIndex] = tempVehicleTable
	ActivePlayersOwnedWeapons[PlayerIndex] = tempWeaponTable
	if ActivePlayers[PlayerIndex]:getProfession() == "officer" then
		AlertServer(nil, "An officer has just signed in.")
	elseif ActivePlayers[PlayerIndex]:getProfession() == "deputy" then
		AlertServer(nil, "The deputy is in town!")
	elseif ActivePlayers[PlayerIndex]:getProfession() == "sheriff" then
		AlertServer(nil, "Look out boys! The Sheriff's in town.")
	end
end