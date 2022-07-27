--BEGIN_IMPORT
-- import shared.globals end
-- import core.objects.Inventory end
-- import helpers.moneyDisplay end
-- import core.objects.LocalDB end
-- import helpers.serverUtils end
-- import helpers.gameUtils end
-- import core.commands.CommandHandler end
-- import helpers.new end
-- import core.objects.GameEvent end
-- import shared.config end
-- import core.handlers.handleObjectSpawn end
-- import core.objects.Location end
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
	local areaObject = LOCATIONS[areaEntered]
	if areaObject == nil then rprint(PlayerIndex, "You have exited an area! (1)"); return end
	local areaName = areaObject:getName()
	local areaType = areaObject:getType()
	if areaName == nil or areaType == nil then rprint(PlayerIndex, "You exited an area! (2)"); return end
	local locationToPrint = buildLocationString(areaType, areaName, true)
	rprint(PlayerIndex, locationToPrint)
end

function OnAreaExit(PlayerIndex, areaExited)
	PlayerAreas[PlayerIndex] = ""
	local areaObject = LOCATIONS[areaExited]
	if areaObject == nil then rprint(PlayerIndex, "You have exited an area! (1)"); return end
	local areaName = areaObject:getName()
	local areaType = areaObject:getType()
	if areaName == nil or areaType == nil then rprint(PlayerIndex, "You exited an area! (2)"); return end
	local locationToPrint = buildLocationString(areaType, areaName)
	rprint(PlayerIndex, locationToPrint)
end

function OnCommand(PlayerIndex,Command,Environment,Password)
	return CommandHandler(PlayerIndex, Command, Environment, Password)
end 

function OnError(message)
	-- say_all("error was called")
	-- for i=0, 16 do
	-- 	if tonumber(get_var(i, "$lvl")) > 1 then -- Gets player admin level
	-- 		rprint(i, message)
	-- 	end
	-- end
	print(message)
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
   handleObjectSpawn(PlayerIndex, MapID, ParentID, ObjectID)
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
	if ActivePlayers[PlayerIndex]:getPrimaryWeapon() ~= "empty" and ActivePlayers[PlayerIndex]:getSecondaryWeapon() ~= "empty" then
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
