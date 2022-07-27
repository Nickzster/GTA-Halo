-- BEGIN_IMPORT
-- import helpers.gameUtils end
-- import config.globals end
-- END_IMPORT

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