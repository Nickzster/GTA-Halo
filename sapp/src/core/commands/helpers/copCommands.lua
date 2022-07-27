-- BEGIN_IMPORT
-- import helpers.serverUtils end
-- import helpers.gameUtils end
-- END_IMPORT

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