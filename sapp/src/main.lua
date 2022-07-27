--BEGIN_IMPORT
-- import config.globals end
-- import core.Inventory end
-- import helpers.moneyDisplay end
-- import core.LocalDB end
-- import helpers.serverUtils end
-- import helpers.gameUtils end
-- import core.commands.CommandHandler end
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


function OnAreaEnter(PlayerIndex, areaEntered)
	PlayerAreas[PlayerIndex] = areaEntered
	rprint(PlayerIndex, "You have entered "..LOCATIONS[areaEntered])
end

function OnAreaExit(PlayerIndex, areaExited)
	PlayerAreas[PlayerIndex] = ""
	rprint(PlayerIndex, "You have exited "..LOCATIONS[areaExited])
end

function OnCommand(PlayerIndex,Command,Environment,Password)
	CommandHandler(PlayerIndex, Command, Environment, Password)
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
