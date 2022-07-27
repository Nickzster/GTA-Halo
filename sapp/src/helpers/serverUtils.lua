-- NO_IMPORTS

function AlertServer(PlayerIndex, message)
	if PlayerIndex ~= nil then
		say(PlayerIndex, message)
	else
		say_all(message)
	end
end

function desync()
	for i=1, 16 do
		if player_present(i) then
			if ActivePlayers[i] == nil then --if the player is active, but their table is nil
				return true
			else
				return false
			end
		else
			return false
		end
	end
end

