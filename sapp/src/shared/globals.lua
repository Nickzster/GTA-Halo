--BEGIN_IMPORT
-- import helpers.new end
-- import core.GameEvent end
-- import shared.config end
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
LOCATIONS = {
    ["dealership_1"] = "the dealership in Camel.",
    ["dealership_2"] = "the anarchist dealership.",
    ["garage_5"] = "the garage in Camel.",
    ["apartments"] = "the apartments in Camel.",
    ["gunstore_3"] = "the downtown ammunation in Camel.",
    ["garage_1"] = "a garage in Cottontail.",
    ["garage_2"] = "a garage in Foxtown.",
    ["garage_3"] = "a garage in Scropion Claw.",
    ["garage_4"] = "a garage in Scropion Tail.",
    ["gunstore_1"] = "an ammunation in Foxtown.",
    ["gunstore_2"] = "an ammunation in Scropion",
    ["recruiter"] = "the recruiter in Camel."
}
PROFESSIONS = {
    ["sheriff"] = 10000,
    ["deputy"] = 7500,
    ["officer"] = 5000,
    ["civilian"] = 1500,
    ["robber"] = 0,
    ["delinquent"] = 0
}
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
WEAPONS = {
    ["remington"] = "gta_halo\\weapons\\remington 870\\remington870",
    ["m249"] = "gta_halo\\weapons\\m249\\m249saw",
    ["mg36"] = "gta_halo\\weapons\\mg36\\mg36",
    ["benelli"] = "gta_halo\\weapons\\benelli_shotgun\\benelli_shotgun",
    ["g36"] = "gta_halo\\weapons\\cod4\\weapons\\g36\\g36",
    ["m16"] = "gta_halo\\weapons\\cod4\\weapons\\m16\\m16",
    ["mp5sd"] = "gta_halo\\weapons\\cod4\\weapons\\mp5\\mp5sd",
    ["aa12"] = "gta_halo\\weapons\\dsmt\\weapons\\aa12\\aa12",
    ["as50"] = "gta_halo\\weapons\\dsmt\\weapons\\as-50\\as-50",
    ["g17"] = "gta_halo\\weapons\\dsmt\\weapons\\g17\\g17",
    ["kdw"] = "gta_halo\\weapons\\dsmt\\weapons\\kdw\\gta_kdw",
    ["m4"] = "gta_halo\\weapons\\dsmt\\weapons\\m4\\m4",
    ["mp5k"] = "gta_halo\\weapons\\dsmt\\weapons\\mp5k\\mp5k",
    ["revolver"] = "gta_halo\\weapons\\dsmt\\weapons\\mr96\\mr96revolver",
    ["ak47"] = "gta_halo\\deathstar\\ambush\\weapon\\ak47",
    ["sniper"] = "gta_halo\\deathstar\\ambush\\weapon\\sniper",
    ["uzi"] = "gta_halo\\deathstar\\ambush\\weapon\\uzi",
    ["m27"] = "gta_halo\\weapons\\sideffect\\weapons\\m27\\m27",
    ["mrifle"] = "gta_halo\\weapons\\sideffect\\weapons\\marksman_rifle\\marksman_rifle",
    ["shotgun"] = "gta_halo\\weapons\\sideffect\\weapons\\shotgun\\shotgun",
    ["smg"] = "gta_halo\\weapons\\sideffect\\weapons\\smg\\smg",
    ["usp"] = "gta_halo\\weapons\\mw\\weapons\\hk-usp\\mw2-usp",
    ["m4a1"] = "gta_halo\\weapons\\m4a1\\m4a1"
}
WEAPONPRICES = {
    ["remington"] = 800,
    ["m249"] = 5000,
    ["mg36"] = 4000,
    ["benelli"] = 1000,
    ["g36"] = 1400,
    ["m16"] = 1500,
    ["mp5sd"] = 1000,
    ["aa12"] = 2000,
    ["as50"] = 2000,
    ["g17"] = 400,
    ["kdw"] = 600,
    ["m4"] = 1700,
    ["mp5k"] = 900,
    ["revolver"] = 1200,
    ["ak47"] = 1600,
    ["sniper"] = 2500,
    ["uzi"] = 800,
    ["m27"] = 1600,
    ["mrifle"] = 1800,
    ["shotgun"] = 900,
    ["smg"] = 1100,
    ["usp"] = 600,
    ["m4a1"] = 1400
}
COPCARS = {
    ["tank"] = "tank",
    ["phog"] = "phog",
    ["pferrari"] = "pferrari"
}
VEHICLES = {
    ["911"] = "twisted_metal\\vehicles\\_ff\\porsche",
    ["aventador"] = "twisted_metal\\vehicles\\_ff\\aventador",
    ["ccx"]  = "twisted_metal\\vehicles\\_ff\\ccx",
    ["charger"] = "twisted_metal\\vehicles\\_ff\\charger",
    ["murcielago"] = "twisted_metal\\vehicles\\_ff\\lp640",
    ["reventon"] = "twisted_metal\\vehicles\\_ff\\reventon",
    ["rx7"] = "twisted_metal\\vehicles\\_ff\\rx",
    ["veyron"] = "twisted_metal\\vehicles\\_ff\\veyron",
    ["zonda"] = "twisted_metal\\vehicles\\zonda\\zonda",
    ["gtr"] = "twisted_metal\\vehicles\\gtr\\gtr",
    ["countach"] = "altis\\crashday\\judge\\judge",
    ["towtruck"] = "twisted_metal\\vehicles\\_v2\\junkyarddog\\junkyarddog",
	["crimsonfury"] = "twisted_metal\\vehicles\\_v2\\crimsonfury\\crimsonfury",
	["interceptor"] = "twisted_metal\\vehicles\\interceptor\\interceptor",
	["policeferrari"] = "twisted_metal\\vehicles\\police_ferrari\\police_ferrari",
	["glendalemonster"] = "vehicles\\glendalemonster\\glendalemonster",
    ["compact"] = "twisted_metal\\vehicles\\_v2\\crazy8\\crazy8",
    ["cwarthog"] = "vehicles\\yohog\\yohog",
    ["bfinjection"] = "vehicles\\bfinjection\\bfinjection",
    ["cleaver"] = "vehicles\\cleaver\\cleaver",
    ["clover"] = "vehicles\\clover\\clover",
    ["glendale"] = "vehicles\\glendale\\glendale",
    ["sabre"] = "vehicles\\sabre\\sabre",
    ["tornado"] = "vehicles\\tornado\\tornado",
    ["virgo"] = "vehicles\\virgo\\virgo",
    ["challenger"] = "twisted_metal\\vehicles\\challenger\\challenger",
    ["veneno"] = "twisted_metal\\vehicles\\_v3\\veneno_low_poly\\veneno",
    ["vincent"] = "altis\\vehicles\\vincent\\vincent",
	["katyusha"] = "altis\\vehicles\\truck_katyusha\\truck_katyusha"
     
}
VEHICLEPRICES = { 
    ["911"] = 1000,
    ["aventador"] = 1000,
    ["ccx"]  = 1000,
    ["charger"] = 1000,
    ["murcielago"] = 1000,
    ["reventon"] = 1000,
    ["rx7"] = 1000,
    ["veyron"] = 1000,
    ["zonda"] = 1000,
    ["gtr"] = 1000,
    ["countach"] = 1000,
    ["towtruck"] = 1000,
    ["compact"] = 1000,
    ["cwarthog"] = 1000,
    ["bfinjection"] = 1000,
    ["cleaver"] = 1000,
    ["clover"] = 1000,
    ["glendale"] = 1000,
    ["sabre"] = 1000,
    ["tornado"] = 1000,
    ["virgo"] = 1000,
    ["challenger"] = 1000,
    ["veneno"] = 1000,
    ["vincent"] = 1000,
	["crimsonfury"] = 1000,
	["interceptor"] = 1000,
	["policeferrari"] = 1000,
	["glendalemonster"] = 1000,
	["katyusha"] = 1000
}
--CREDIT: 002 and Altis for switching bipeds
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