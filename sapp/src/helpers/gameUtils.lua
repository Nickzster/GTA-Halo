-- NO_IMPORTS

function FindBipedTag(TagName)
    local tag_array = read_dword(0x40440000)
    for i=0,read_word(0x4044000C)-1 do
        local tag = tag_array + i * 0x20
        if(read_dword(tag) == 1651077220 and read_string(read_dword(tag + 0x10)) == TagName) then
            return read_dword(tag + 0xC)
        end
    end
end

function getDistance(index1, index2)
	p1x, p1y, p1z = read_vector3d(get_dynamic_player(index1)+0x5C)
	p2x, p2y, p2z = read_vector3d(get_dynamic_player(index2)+0x5C)
	
	return math.sqrt( (p2x-p1x)^2 + (p2y-p1y)^2 + (p2z-p1z)^2 )
end

function giveGun(weaponName, PlayerIndex)
	local gunToGive = spawn_object("weapon", WEAPONS[weaponName])
	assign_weapon(gunToGive, tonumber(PlayerIndex))
end



function payAPlayer(PlayerIndex, amount)
	ActivePlayers[PlayerIndex].payBucks(ActivePlayers[PlayerIndex], amount)
end

function playerIsInArea(PlayerIndex, boolLocation)
	local locName = {}
	local playerLocation = PlayerAreas[PlayerIndex]
	if playerLocation ~= nil then
		for w in playerLocation:gmatch("%a+") do locName[#locName+1] = w end --should take out _<number> in the area
			if locName[1] == boolLocation then
				return true
			else
				return false
		end
	else
		rprint(PlayerIndex, "You are not in the correct area to be doing that!")
	end
end



function setColor(PlayerIndex)
	rprint(PlayerIndex, "SetColor Called (WIP function)")
	-- local copRank = ActivePlayers[PlayerIndex]:getCopRank()
	-- if copRank > 0 then
	-- 	rprint(PlayerIndex, "You will now play as COPS")
	-- 	--CHOSEN_BIPEDS[get_var(PlayerIndex, "$hash")] = "swat"
	-- 	execute_command("color "..PlayerIndex.." 1")
	-- else
	-- 	rprint(PlayerIndex, "You will now play as CIVILIANS")
	-- 	--CHOSEN_BIPEDS[get_var(PlayerIndex, "$hash")] = "civilians"
	-- 	execute_command("color "..PlayerIndex.." 0")
	-- end
end

function ownsThisCar(PlayerIndex, vehicleName) --utility function that checks if a player owns the specified car
	local checkTable = ActivePlayersOwnedCars[PlayerIndex]
	if checkTable[vehicleName] ~= nil then --if the table is nil, the player does not own the car
		--rprint(PlayerIndex, "Do you own "..vehicleName.."?")
		return true
	else
		return false
	end
end

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