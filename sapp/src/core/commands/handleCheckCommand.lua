--BEGIN_IMPORT
-- import helpers.validateCommand end
-- END_IMPORT

function handleCheckCommand(playerIndex, commandName, commandArgs)
    
    if not validateCommand(commandName, "check") then return false end

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

    return true

end