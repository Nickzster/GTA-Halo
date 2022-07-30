--BEGIN_IMPORT
-- import helpers.new end
-- import core.objects.GameEvent end
-- import shared.config end
-- import core.objects.Profession end
-- END_IMPORT


-- Table of GameEvents, accessible by server.

GameEvents = {
    carEvent = GameEvent:new():setActive(false):setItem(FREE_CAR_TO_DISTRIBUTE),
    moneyEvent = GameEvent:new():setActive(false):setItem(FREE_MONEY_TO_DISTRIBUTE),
    gunEvent = GameEvent:new():setActive(false):setItem(FREE_GUN_TO_DISTRIBUTE)
}

function GameEvent:get(key)
    return self[key]
end

-- OLD

ClaimedRewards = {}


COPPOSITIONS = {
    [0] = "civilian",
    [1] = "officer",
    [2] = "deputy",
    [3] = "sheriff"
}
GAMESETTINGS = {
    ["gametype"] = "gta_halo",
    ["mapname"] = "gta_badlands"
}
BIPEDS = {
    ["cops"] = "halo3\\characters\\spartan\\cqb\\cqb",
    ["civilians"] = "halo3\\characters\\spartan\\mark v\\mark v",
    ["swat"] = "halo3\\characters\\spartan\\odst\\odst"
}

COPCARS = {
    ["tank"] = "tank",
    ["phog"] = "phog",
    ["pferrari"] = "pferrari"
}


BIPED_IDS = {}
CHOSEN_BIPEDS = {}
DEFAULT_BIPED = nil

--dynamic tables
ActivePlayers = {} --All players that are active in the server
PlayerSpawnedVehicles = {} --List of players that have spawned a personal vehicle. Prevents duplicate spawning.
PlayerIsInAVehicle = {} --List of players that are in a vehicle. Prevents players from deleting themselves.
ActivePlayersOwnedCars = {} --List of the cars that active players own.
ActivePlayersOwnedWeapons = {} --list of the weapons that active players own
PlayerAreas = {} --List of all of the player's that are in key areas (stores, etc.)
timeToReward = 30 * 60 * 30
waitingToReward = 0
needToResetGame = false
--end of dynamic tables
--end of Startup stuff