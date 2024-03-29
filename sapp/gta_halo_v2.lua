api_version="1.10.1.0"


new = function(self, o)
    local newClassInstance = o or {}
    setmetatable(newClassInstance, self)
    self.__index = self
    return newClassInstance
end

Profession = {
    title="",
    salary=0,
    key=""
}

function Profession:setTitle(newTitle)
    self.title = newTitle
    return self
end

function Profession:getTitle()
    return self.title
end

function Profession:setKey(newKey)
    self.key = newKey
    return self
end

function Profession:getKey()
    return self.key
end

function Profession:setSalary(newSalary)
    self.salary = newSalary
    return self
end

function Profession:getSalary()
    return self.salary
end

Profession['new'] = new

Location = {
    locationName="",
    locationType=""
}

function Location:setName(locationNameToSet)
    self.locationName = locationNameToSet
    return self
end

function Location:getName()
    return self.locationName
end

function Location:setType(locationTypeToSet)
    self.locationType = locationTypeToSet
    return self
end

function Location:getType()
    return self.locationType
end

Location['new'] = new

Item = {
    label="",
    key="",
    price="",
    tagReference=""
}

function Item:setLabel(newLabel)
    self.label = newLabel
    return self
end

function Item:getLabel()
    return self.label
end

function Item:setKey(newKey)
    self.key = newKey
    return self
end

function Item:getKey()
    return self.key
end

function Item:setPrice(newPrice)
    self.price = newPrice
    return self
end

function Item:getPrice()
    return self.price
end

function Item:setTagReference(newTagReference)
    self.tagReference = newTagReference
    return self
end

function Item:getTagReference()
    return self.tagReference
end

Item['new'] = new

FREE_GUN_TO_DISTRIBUTE = "remington"
FREE_CAR_TO_DISTRIBUTE = "countach"
FREE_MONEY_TO_DISTRIBUTE = 10000

MAX_MONEY = 9999999
MAX_KARMA = 2.0
MAX_AMMO_PRICE = 750
LOADOUT_CHANGE_PRICE = 500



LOCATIONS = {
    ["dealership_1"] = Location:new():setName("Camel"):setType("dealership"),
    ["dealership_2"] = Location:new():setName("yonder"):setType("anarchist dealership"),
    ["garage_5"] = Location:new():setName("Camel"):setType("garage"),
    ["apartments"] = Location:new():setName("Camel"):setType("apartments"),
    ["gunstore_3"] = Location:new():setName("Camel"):setType("ammunation"),
    ["garage_1"] = Location:new():setName("Cottontail"):setType("garage"),
    ["garage_2"] = Location:new():setName("Foxtown"):setType("garage"),
    ["garage_3"] = Location:new():setName("Scropion Claw"):setType("garage"), 
    ["garage_4"] = Location:new():setName("Scropion Tail"):setType("garage"),
    ["gunstore_1"] = Location:new():setName("Foxtown"):setType("ammunation"),
    ["gunstore_2"] = Location:new():setName("Scropion"):setType("ammunation"),
    ["recruiter"] = Location:new():setName("Camel"):setType("recruiter")
}

PROFESSIONS = {
    ["sheriff"] = Profession:new():setKey("sheriff"):setTitle("Sheriff"):setSalary(10000),
    ["deputy"] = Profession:new():setKey("deputy"):setTitle("Deputy"):setSalary(7500),
    ["officer"] = Profession:new():setKey("officer"):setTitle("Officer"):setSalary(5000),
    ["civilian"] = Profession:new():setKey("civilian"):setTitle("Civilian"):setSalary(1500),
    ["criminal"] = Profession:new():setKey("criminal"):setTitle("Criminal"):setSalary(0)
}

COMMAND_NAMES = {
    ["drive"] = "drive",
    ["park"] = "park",
    ["pay"] = "pay",
    ["save"] = "save",
    ["buy"] = "buy",
    ["drop"] = "drop",
    ["wallet"] = "wallet",
    ["test"] = "test"
}

WEAPONS = {
    ["remington"] = Item:new():setKey("remington"):setLabel("Remington"):setPrice(800):setTagReference("gta_halo\\weapons\\remington 870\\remington870"),
    ["m249"]= Item:new():setKey("m249"):setLabel("M-249 Machine Gun"):setPrice(5000):setTagReference("gta_halo\\weapons\\m249\\m249saw"),
    ["mg36"] = Item:new():setKey("mg36"):setLabel("MG-36"):setPrice(4000):setTagReference("gta_halo\\weapons\\mg36\\mg36"),
    ["benelli"] = Item:new():setKey("benelli"):setLabel("Benelli"):setPrice(1000):setTagReference("gta_halo\\weapons\\benelli_shotgun\\benelli_shotgun"),
    ["g36"] = Item:new():setKey("g36"):setLabel("G-36"):setPrice(1400):setTagReference("gta_halo\\weapons\\cod4\\weapons\\g36\\g36"),
    ["m16"] = Item:new():setKey("m16"):setLabel("M-16"):setPrice(1500):setTagReference("gta_halo\\weapons\\cod4\\weapons\\m16\\m16"),
    ["mp5sd"] = Item:new():setKey("mp5sd"):setLabel("MP5-SD"):setPrice(1000):setTagReference("gta_halo\\weapons\\cod4\\weapons\\mp5\\mp5sd"),
    ["aa12"] = Item:new():setKey("aa12"):setLabel("AA-12"):setPrice(2000):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\aa12\\aa12"),
    ["as50"] = Item:new():setKey("as50"):setLabel("AS-50"):setPrice(2000):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\as-50\\as-50"),
    ["g17"] = Item:new():setKey("g17"):setLabel("G-17"):setPrice(400):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\g17\\g17"),
    ["kdw"] = Item:new():setKey("kdw"):setLabel("KDW"):setPrice(600):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\kdw\\gta_kdw"),
    ["m4"] = Item:new():setKey("m4"):setLabel("M-4"):setPrice(1700):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\m4\\m4"),
    ["mp5k"] = Item:new():setKey("mp5k"):setLabel("MP5-K"):setPrice(900):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\mp5k\\mp5k"),
    ["revolver"] = Item:new():setKey("revolver"):setLabel("Revolver"):setPrice(1200):setTagReference("gta_halo\\weapons\\dsmt\\weapons\\mr96\\mr96revolver"),
    ["ak47"] = Item:new():setKey("ak47"):setLabel("AK-47"):setPrice(1600):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\ak47"),
    ["sniper"] = Item:new():setKey("sniper"):setLabel("Sniper Rifle"):setPrice(2500):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\sniper"),
    ["uzi"] = Item:new():setKey("uzi"):setLabel("Uzi"):setPrice(800):setTagReference("gta_halo\\deathstar\\ambush\\weapon\\uzi"),
    ["m27"] = Item:new():setKey("m27"):setLabel("M-27"):setPrice():setTagReference("gta_halo\\weapons\\sideffect\\weapons\\m27\\m27"),
    ["mrifle"] = Item:new():setKey("mrifle"):setLabel("Marksman Rifle"):setPrice(1600):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\marksman_rifle\\marksman_rifle"),
    ["shotgun"] = Item:new():setKey("shotgun"):setLabel("Shotgun"):setPrice(1800):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\shotgun\\shotgun"),
    ["smg"] = Item:new():setKey("smg"):setLabel("SMG"):setPrice(1100):setTagReference("gta_halo\\weapons\\sideffect\\weapons\\smg\\smg"),
    ["usp"] = Item:new():setKey("usp"):setLabel("USP"):setPrice(600):setTagReference("gta_halo\\weapons\\mw\\weapons\\hk-usp\\mw2-usp"),
    ["m4a1"] = Item:new():setKey("m4a1"):setLabel("M4-A1"):setPrice(1400):setTagReference("gta_halo\\weapons\\m4a1\\m4a1")
}


VEHICLES={
    ["911"] = Item:new():setKey("911"):setLabel(""):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\porsche"),
    ["aventador"] = Item:new():setKey("aventador"):setLabel("Lamborghini Aventador"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\aventador"),
    ["ccx"]  = Item:new():setKey("ccx"):setLabel("Koenigsegg CCX"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\ccx"),
    ["charger"] = Item:new():setKey("charger"):setLabel("Dodge Charger"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\charger"),
    ["murcielago"] = Item:new():setKey("murcielago"):setLabel("Lamborghini Murcielago"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\lp640"),
    ["reventon"] = Item:new():setKey("reventon"):setLabel("Lamborghini Reventon"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\reventon"),
    ["rx7"] = Item:new():setKey("rx7"):setLabel("Mazda RX7"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\rx"),
    ["veyron"] = Item:new():setKey("veyron"):setLabel("Bugatti Veyron"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_ff\\veyron"),
    ["zonda"] = Item:new():setKey("zonda"):setLabel("Pagani Zonda"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\zonda\\zonda"),
    ["gtr"] = Item:new():setKey("gtr"):setLabel("Nissian GTR"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\gtr\\gtr"),
    ["countach"] = Item:new():setKey("countach"):setLabel("Lamborghini Countach"):setPrice(1000):setTagReference("altis\\crashday\\judge\\judge"),
    ["towtruck"] = Item:new():setKey("towtruck"):setLabel("Junkyard Dog"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v2\\junkyarddog\\junkyarddog"),
	["crimsonfury"] = Item:new():setKey("crimsonfury"):setLabel("Crimson Fury"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v2\\crimsonfury\\crimsonfury"),
	["interceptor"] = Item:new():setKey("interceptor"):setLabel("Interceptor"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\interceptor\\interceptor"),
	["policeferrari"] = Item:new():setKey("policeferrari"):setLabel("Ferrari (Police)"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\police_ferrari\\police_ferrari"),
	["glendalemonster"] = Item:new():setKey("glendalemonster"):setLabel("Glendale (Monster)"):setPrice(1000):setTagReference("vehicles\\glendalemonster\\glendalemonster"),
    ["compact"] = Item:new():setKey("compact"):setLabel("Compact"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v2\\crazy8\\crazy8"),
    ["cwarthog"] = Item:new():setKey("cwarthog"):setLabel("Civilian Warthog"):setPrice(1000):setTagReference("vehicles\\yohog\\yohog"),
    ["bfinjection"] = Item:new():setKey("bfinjection"):setLabel("BF Injection"):setPrice(1000):setTagReference("vehicles\\bfinjection\\bfinjection"),
    ["cleaver"] = Item:new():setKey("cleaver"):setLabel("Cleaver"):setPrice(1000):setTagReference("vehicles\\cleaver\\cleaver"),
    ["clover"] = Item:new():setKey("clover"):setLabel("Clover"):setPrice(1000):setTagReference("vehicles\\clover\\clover"),
    ["glendale"] = Item:new():setKey("glendale"):setLabel("Glendale"):setPrice(1000):setTagReference("vehicles\\glendale\\glendale"),
    ["sabre"] = Item:new():setKey("sabre"):setLabel("Sabre"):setPrice(1000):setTagReference("vehicles\\sabre\\sabre"),
    ["tornado"] = Item:new():setKey("tornado"):setLabel("Tornado"):setPrice(1000):setTagReference("vehicles\\tornado\\tornado"),
    ["virgo"] = Item:new():setKey("virgo"):setLabel("Virgo"):setPrice(1000):setTagReference("vehicles\\virgo\\virgo"),
    ["challenger"] = Item:new():setKey("challenger"):setLabel("Dodge Challenger"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\challenger\\challenger"),
    ["veneno"] = Item:new():setKey("veneno"):setLabel("Lamborghini Veneno"):setPrice(1000):setTagReference("twisted_metal\\vehicles\\_v3\\veneno_low_poly\\veneno"),
    ["vincent"] = Item:new():setKey("vincent"):setLabel("Vincent"):setPrice(1000):setTagReference("altis\\vehicles\\vincent\\vincent"),
	["katyusha"] = Item:new():setKey("katyusha"):setLabel("Katyusha"):setPrice(1000):setTagReference("altis\\vehicles\\truck_katyusha\\truck_katyusha")
}


function validateCommand(commandNameToCheck, expectedCommandName)
    return commandNameToCheck == COMMAND_NAMES[expectedCommandName]
end

-- GameEvent object, representing a single event.

GameEvent = {
    active=false,
    item=""
}

function GameEvent:setActive(isActive)
    self.active = isActive
    return self
end

function GameEvent:setItem(itemToSet)
    self.item = itemToSet
    return self
end

function GameEvent:new(o)
    return new(self, o)
end

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
	local gunToGive = spawn_object("weapon", WEAPONS[weaponName]:getTagReference())
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
	PlayerIndex = tonumber(PlayerIndex)
	if player_present(PlayerIndex) then
			execute_command("m "..PlayerIndex.." 0 0 0.4")
			execute_command("spawn vehi "..VEHICLES[name]:getTagReference().." "..PlayerIndex)
			execute_command("venter "..PlayerIndex)
	end
end


function Spawn(PlayerIndex, objectToSpawnKey) --utility function for DriveCommand
	for name, tag in pairs(VEHICLES) do
		if objectToSpawnKey == name then
			say(PlayerIndex, "Summoning " .. name )
			vehicleSpawn(PlayerIndex, name)
			PlayerSpawnedVehicles[PlayerIndex] = 1
		end
	end
end

function buildLocationString(locationType, locationName, isEntering) 
	if isEntering ~= nil then return "You have entered a(n) " .. locationType .. " in " .. locationName .. "." end
	return "You have exited a(n) " .. locationType .. " in " .. locationName .. "."
end


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

-- EventLoopTable = {
--     events={}
--     iterateEventLoopTable=function(self)
--         for i, event in ipairs(self.events) do
--             if event:execute() then
--                 table.remove(self.events, i)
--             end
--         end
--     end,
--     registerEvent=function(self, event )
--         table.insert(self.events, event)
--     end,
-- }

function playerIsAdmin(playerIndex)
    local adminLevel = tonumber(get_var(playerIndex, "$lvl"))

    return adminLevel > 0
end

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



Player = {
	name = "", --string value representing players name
	hash = "", --string value representing players hash
	bucks = 0, --int value representing players money
	profession = "civilian", --string value representing player's profession
	karma = 1.0, --int value representing player's karma value
    apartment = 0, --bool value (0 or 1) representing if a player has an apartment
	copPosition = 0, --0 = not a cop, 1 = officer, 2 = deputy, 3 = sheriff
	copAuthority = 0, --bool value (0 or 1) representing if a player has authority or not.
    fugitiveStatus = 0, --bool value (0 or 1) representing if a player is made or not
    loadoutPrimary = "empty", --string value representing primary weapon
    loadoutSecondary = "empty", --string value representing secondary weapon
    jailStatus = 0, --bool value (0 or 1) value representing if a player is in jail or not,
	ownedVehicles=nil,
	ownedWeapons=nil,
	inventory=nil,
	hasActiveVehicle=false,
	inVehicle=false,
	currentLocation=nil,
}
--Class methods
--name getters + setters
function Player:setName(strname)
	self.name = strname
end
function Player:getName()
	return self.name
end
--hash getters + setters
function Player:setHash(strhash)
	self.hash = strhash
end
function Player:getHash()
	return self.hash
end
--bucks setters + getters
function Player:setBucks(bucks)
	if tonumber(bucks) > MAX_MONEY then
		self.bucks = MAX_MONEY
	else
		self.bucks = bucks
	end
end
function Player:getBucks(bucks)
	return self.bucks
end
function Player:payBucks(bucks) --adds ONTO the amount of bucks a player has
	local tempBalance = self.bucks + bucks
	if tempBalance > MAX_MONEY then
		self.bucks = MAX_MONEY
	else
		self.bucks = tempBalance
	end
end
function Player:deductBucks(bucks) --deducts cash out of player's Player. this value cannot dip below 0.
	local tempBalance = self.bucks - bucks
	if tempBalance < 0 then --if the amount of cash deducted would be below zero
		self.bucks = 0 --then set their amount of cash to 0
	else
		self.bucks = self.bucks - bucks --otherwise do the deduction.
	end
end
--profession setters and getters

function Player:setProfession(professionToBe)
	self.profession = professionToBe 
end


function Player:getProfession()
    return self.profession
end
--karma setters and getters
function Player:setKarma(newKarmaValue)
	newKarmaValue = tonumber(newKarmaValue)
	if newKarmaValue > MAX_KARMA then
		self.karma = MAX_KARMA
	else
		self.karma = newKarmaValue
	end
end
function Player:getKarma()
	return self.karma
end
function Player:incrementKarma()
	local incrementedKarmaValue = self.karma + 1
	if incrementedKarmaValue > MAX_KARMA then
		self.karma = MAX_KARMA
	else
		self.karma = incrementedKarmaValue
	end
end
--cop getters and setters
function Player:setCopPosition(newCopPositionNumber)
	local newCopPosition = COPPOSITIONS[newCopPositionNumber]
	if newCopPosition ~= nil then
		self.copPosition = newCopPositionNumber
		return true
	else
		self.copPosition = 0
		return false
	end
end
function Player:getCopPosition()
	return self.copPosition
end
--authority setters and getters
function Player:setCopAuthority(newAuthorityValue)
	self.copAuthority = newAuthorityValue
end
function Player:getCopAuthority()
	return self.copAuthority
end
--apartment status getters + setters
function Player:setApartment(apartmentStatus)
	self.apartment = apartmentStatus
end
function Player:getApartment()
	return self.apartment
end
function Player:getCopRank()
	return self.copRank
end
--fugitive status setters + getters
function Player:setFugitiveStatus(fugitiveStatusToBe)
    self.fugitiveStatus = fugitiveStatusToBe
end
function Player:getFugitiveStatus()
    return self.fugitiveStatus
end
--set loadouts
function Player:setLoadoutPrimary(primaryWeapon) 
    self.loadoutPrimary = primaryWeapon
end
function Player:setLoadoutSecondary(secondaryWeapon) --used for io
	self.loadoutSecondary = secondaryWeapon
end
function Player:setLoadout(primaryWeapon, secondaryWeapon)
	self.loadoutPrimary = primaryWeapon
    self.loadoutSecondary = secondaryWeapon
end
--get loadouts
function Player:getPrimaryWeapon()
    return self.loadoutPrimary
end
function Player:getSecondaryWeapon()
    return self.loadoutSecondary
end
function Player:setJailStatus(jailStatusToBe)
	self.jailStatus = jailStatusToBe
end
function Player:getJailStatus()
	return self.jailStatus
end

function Player:setOwnedVehicles(ownedVehicles)
	self.ownedVehicles = ownedVehicles
	return self
end

function Player:getOwnedVehicles()
	return self.ownedVehicles
end

function Player:setOwnedWeapons(ownedWeapons)
	self.ownedWeapons = ownedWeapons
	return self
end

function Player:getOwnedWeapons()
	return self.ownedWeapons
end

function Player:new(o)
	o = o or {} 
	setmetatable(o,self)
	self.__index = self
	return o
end

function buyGun(PlayerIndex, gunToBuy)
	if not playerIsInArea(PlayerIndex, "gunstore") then rprint(PlayerIndex, "You need to be at a gunstore in order to buy weapons"); return; end

	if gunToBuy == nil then rprint(PlayerIndex, "In order to buy something, you need to specify what you want to buy!"); return; end

	if WEAPONS[gunToBuy] == nil then rprint(PlayerIndex, "An invalid gun was specified!"); return; end

	if WEAPONS[gunToBuy]:getPrice() > tonumber(ActivePlayers[PlayerIndex]:getBucks()) then rprint(PlayerIndex, "You do not have enough money to buy this gun!"); return; end

	local updatedWeapons = ActivePlayersOwnedWeapons[PlayerIndex]

	if updatedWeapons[gunToBuy] == nil then
		updatedWeapons[gunToBuy] = gunToBuy
		ActivePlayersOwnedWeapons[PlayerIndex] = updatedWeapons
		rprint(PlayerIndex, "You now own this weapon for loadouts.")
	end

	ActivePlayers[PlayerIndex].deductBucks(ActivePlayers[PlayerIndex], WEAPONS[gunToBuy]:getPrice())
	giveGun(gunToBuy, PlayerIndex)
	rprint(PlayerIndex, "Purchase of "..WEAPONS[gunToBuy]:getLabel().." for "..niceMoneyDisplay(WEAPONS[gunToBuy]:getPrice()).." was successful.")
			
end

function buyVehicle(PlayerIndex, vehicleToBuy)

	if not playerIsInArea(PlayerIndex, "dealership") then rprint(PlayerIndex, "You need to be at a vehicle store in order to buy vehicles!"); return; end

	if vehicleToBuy == nil then rprint(PlayerIndex, "In order to buy something, you need to specify what you want to buy!"); return; end

	if VEHICLES[vehicleToBuy] == nil then rprint(PlayerIndex, "An invalid vehicle was specified!"); return; end

	if VEHICLES[vehicleToBuy]:getPrice() > tonumber(ActivePlayers[PlayerIndex]:getBucks()) then rprint(PlayerIndex, "You do not have enough money to buy this vehicle!"); return; end

	local updatedVehicles = ActivePlayersOwnedCars[PlayerIndex]

	if updatedVehicles[vehicleToBuy] == nil then
		updatedVehicles = ActivePlayersOwnedCars[PlayerIndex]
		updatedVehicles[vehicleToBuy] = vehicleToBuy
		ActivePlayersOwnedCars[PlayerIndex] = updatedVehicles						
		ActivePlayers[PlayerIndex].deductBucks(ActivePlayers[PlayerIndex], VEHICLES[vehicleToBuy]:getPrice())
		rprint(PlayerIndex, "Purchase of "..VEHICLES[vehicleToBuy]:getLabel().." for "..niceMoneyDisplay(VEHICLES[vehicleToBuy]:getPrice()).." was successful.")
	else 
		rprint(PlayerIndex, "You already own this vehicle!")
	end

	
end

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
	outputFile:write(ActivePlayers[PlayerIndex]:getProfession():getKey())
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
	local playerInstance = Player:new()
	local tempVehicleTable = {}
	local tempWeaponTable = {}
	local playerName = get_var(PlayerIndex, "$name")
	local defaultProfession = PROFESSIONS["civilian"]
	if inputFile ~= nil then --if the file exists, then read the data in that way
		say(PlayerIndex, "Welcome BACK, "..playerName.."!")
		local endOfFile = false
		while endOfFile == false do
			local valueToCompare = inputFile:read("*l")
			print("\nChecking "..valueToCompare.." to see if it is valid.")
			if valueToCompare == "$PLAYER_NAME" then
				playerInstance:setName(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_HASH" then
				playerInstance:setHash(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_BUCKS" then
				playerInstance:setBucks(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_PROFESSION" then
				local professionKey = inputFile:read("*l") or "civilian"
				playerInstance:setProfession(PROFESSIONS[professionKey])
			elseif valueToCompare == "$PLAYER_KARMA" then
				playerInstance:setKarma(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_APARTMENTSTATUS" then
				playerInstance:setApartment(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_COPPOSITION" then
				playerInstance:setCopPosition(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_AUTHORITY" then
				playerInstance:setCopAuthority(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_FUGITIVESTATUS" then 
				playerInstance:setFugitiveStatus(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_LOADOUTPRIMARY" then
				playerInstance:setLoadoutPrimary(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_LOADOUTSECONDARY" then
				playerInstance:setLoadoutSecondary(inputFile:read("*l"))
			elseif valueToCompare == "$PLAYER_JAILSTATUS" then
				playerInstance:setJailStatus(inputFile:read("*l"))
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
		playerInstance:setName(playerName)
		playerInstance:setHash(fileHash)
		playerInstance:setBucks(5000)
		playerInstance:setApartment(0)
		playerInstance:setKarma(1)
		playerInstance:setCopPosition("")
		playerInstance:setCopAuthority(0)
		playerInstance:setProfession(defaultProfession)
		playerInstance:setFugitiveStatus(0)
		playerInstance:setLoadout("empty","empty")
		playerInstance:setJailStatus(0)
		tempVehicleTable = {["cwarthog"] = "cwarthog"}
		tempWeaponTable = {["g17"] = "g17"}
	end
	ActivePlayers[PlayerIndex] = playerInstance
	ActivePlayersOwnedCars[PlayerIndex] = tempVehicleTable
	ActivePlayersOwnedWeapons[PlayerIndex] = tempWeaponTable
	if ActivePlayers[PlayerIndex]:getProfession():getTitle() == "Officer" then
		AlertServer(nil, "An officer has just signed in.")
	elseif ActivePlayers[PlayerIndex]:getProfession():getTitle()  == "Deputy" then
		AlertServer(nil, "The deputy is in town!")
	elseif ActivePlayers[PlayerIndex]:getProfession():getTitle()  == "Sheriff" then
		AlertServer(nil, "Look out boys! The Sheriff's in town.")
	end
end

function handleBuyCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "buy") then return false end

    local localPlayer = ActivePlayers[playerIndex]

    if VEHICLES[commandArgs[1]] ~= nil then
        buyVehicle(playerIndex, commandArgs[1])
    elseif WEAPONS[commandArgs[1]] ~= nil then
        buyGun(playerIndex, commandArgs[1])
    elseif commandArgs[1] == "ammo" then
        if playerIsInArea(playerIndex, "gunstore") then
            if tonumber(localPlayer:getBucks()) >= MAX_AMMO_PRICE then--if the player has enough money
                --then allow the purchase
                localPlayer:deductBucks(MAX_AMMO_PRICE)
                execute_command("ammo "..playerIndex.." 999 0")
                rprint(playerIndex, "Purchase of max ammo for "..niceMoneyDisplay(MAX_AMMO_PRICE).." was successful.")
            else
                --otherwise tell them they do not have enough
                rprint(playerIndex, "You do not have enough money to buy ammo.")
            end
        else
            rprint(playerIndex, "You need to be at a gunstore to buy ammo.")
        end
    else
        rprint(playerIndex, "Invalid object specified.")
    end

    return true
end

function handlePayCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, 'pay') then return false end

    local isAdmin = playerIsAdmin(playerIndex)

    if not isAdmin then rprint(playerIndex, "You do not have sufficent admin privileges to execute this command."); return true end
    
    local playerToPay = tonumber(commandArgs[1])
    local amountToPay = tonumber(commandArgs[2])
    payAPlayer(playerToPay, amountToPay)

    return true

end
------------------------------------------------------------
-- from sam_lie
-- Compatible with Lua 5.0 and 5.1.
-- Disclaimer : use at own risk especially for hedge fund reports :-)
--http://lua-users.org/wiki/FormattingNumbers
---============================================================
-- add comma to separate thousands
-- 
function comma_value(amount)
	local formatted = amount
	while true do  
	  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
	  if (k==0) then
		break
	  end
	end
	return formatted
end
  -- rounds a number to the nearest decimal places
function round(val, decimal)
	if (decimal) then
	  return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
	else
	  return math.floor(val+0.5)
	end
end
  -- given a numeric value formats output with comma to separate thousands
  -- and rounded to given decimal places
function format_num(amount, decimal, prefix, neg_prefix)
	local str_amount,  formatted, famount, remain
  
	decimal = decimal or 2  -- default 2 decimal places
	neg_prefix = neg_prefix or "-" -- default negative sign
  
	famount = math.abs(round(amount,decimal))
	famount = math.floor(famount)
  
	remain = round(math.abs(amount) - famount, decimal)
  
		  -- comma to separate the thousands
	formatted = comma_value(famount)
  
		  -- attach the decimal portion
	if (decimal > 0) then
	  remain = string.sub(tostring(remain),3)
	  formatted = formatted .. "." .. remain ..
				  string.rep("0", decimal - string.len(remain))
	end
  
		  -- attach prefix string e.g '$' 
	formatted = (prefix or "") .. formatted 
  
		  -- if value is negative then format accordingly
	if (amount<0) then
	  if (neg_prefix=="()") then
		formatted = "("..formatted ..")"
	  else
		formatted = neg_prefix .. formatted 
	  end
	end
  
	return formatted
end
function niceMoneyDisplay(bucksToDisplay)
	bucksToDisplay = tonumber(bucksToDisplay)
	return format_num(bucksToDisplay, 2, "$")
end


function handleDriveCommand(playerIndex, commandName, commandArgs) --Summons a specified vehicle for the player that requests it.
	if not validateCommand(commandName, 'drive') then return false end
	local vehicleToDrive = commandArgs[1]

	local hasActiveVehicle = PlayerSpawnedVehicles[playerIndex] == 1
	local isInGarage = playerIsInArea(playerIndex, "garage") == true
	local playerOwnsVehicle = ownsThisCar(playerIndex, vehicleToDrive) == true

	if hasActiveVehicle then rprint(playerIndex, "You already have a summoned vehicle!"); return true end

	if not isInGarage then rprint(playerIndex, "You need to be at a valid garage location!"); return true end

	if not playerOwnsVehicle then rprint(playerIndex, "You do not own this vehicle."); return true end

	Spawn(playerIndex, vehicleToDrive) --spawn it

	return true
end

function handleParkCommand(playerIndex, commandName, commandArgs) --Parks a player's vehicle. Will be modified in the future to ONLY park within certain areas.
	
	if not validateCommand(commandName, 'park') then return false end

	if PlayerIsInAVehicle[playerIndex] == 0 then --if the player not in a vehicle
		if playerIsInArea(playerIndex, "garage") then --and the player is at a garage
			execute_command("vdel " .. playerIndex) --then park their vehicle
			PlayerSpawnedVehicles[playerIndex] = 0
		else
			rprint(playerIndex, "You need to be at a garage in order to park your car!")
		end
	else --otherwise, let them know that they need to exit the vehicle to park it.
		rprint(playerIndex, "You need to exit the vehicle first!")
	end

	return true
end

function createClosure(playerIndex, message)

    return function()
        rprint(playerIndex, message)
    end

end

function handleTestCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "test") then return false end

    local closure = createClosure(playerIndex, "Closures do in fact work!")

    closure()

    return true

end

function handleOwnedCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "owned") then return false end

    table.remove(commandargs,1)
				if commandargs[1] == "cars" or commandargs[1] == "vehicles" then
					rprint(playerIndex, "You own the following cars: ")
					local vehicleTable = ActivePlayersOwnedCars[playerIndex]
					for vehicleName, veh in pairs(vehicleTable) do
						rprint(playerIndex, vehicleName)
					end
				elseif commandargs[1] == "guns" or commandargs[1] == "weapons" then
					rprint(playerIndex, "You own the following weapons: ")
					local weaponTable = ActivePlayersOwnedWeapons[playerIndex]
					for weaponName, veh in pairs(weaponTable) do
						rprint(playerIndex, weaponName)
					end
				end

    return true
end

function handleDropCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "drop") then return false end

    drop_weapon(playerIndex)

    return true

end

function splitString (inputstr, sep)
        local t={}
        if sep == nil then
            for str in inputstr:gmatch("%w+") do 
                table.insert(t, str)
            end
        else
            for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
            end
        end
        return t
end

function handleRedeemCommand(playerIndex, commandName, commandArgs)

    if  not validateCommand(commandName, "redeem") then return false end

    if gunEvent ~= false or moneyEvent ~= false or carEvent ~= false then
        table.remove(commandargs,1)
        local typeOfEvent = commandargs[1]
        if typeOfEvent ~= nil then
            if typeOfEvent == "gun" and gunEvent ~= false then
                if playerIsInArea(playerIndex, "gunstore") then
                    local gunToGive = spawn_object("weapon", WEAPONS[FREE_GUN_TO_DISTRIBUTE]:getKey())
                    assign_weapon(gunToGive, playerIndex)
                    rprint(playerIndex, "You have successfully redeemed a "..FREE_GUN_TO_DISTRIBUTE.."!")
                else
                    rprint(playerIndex, "You must be at a gun store to redeem this item.")
                end
            elseif typeOfEvent == "money" and moneyEvent ~= false then
                if ClaimedRewards[get_var(playerIndex, "$hash")] == nil then
                    rprint(playerIndex, "Congratulations. You just earned free money!")
                    ActivePlayers[playerIndex]:payBucks(FREE_MONEY_TO_DISTRIBUTE)
                    ClaimedRewards[get_var(playerIndex, "$hash")] = get_var(playerIndex, "$hash")
                else
                    rprint(playerIndex, "You have already claimed this reward!")
                end
            elseif typeOfEvent == "car" and carEvent ~= false then
                if playerIsInArea(playerIndex, "dealership") then
                    local updatedVehicles = ActivePlayersOwnedCars[playerIndex]
                    if updatedVehicles[FREE_CAR_TO_DISTRIBUTE] == nil then
                        updatedVehicles[FREE_CAR_TO_DISTRIBUTE] = FREE_CAR_TO_DISTRIBUTE
                        ActivePlayersOwnedCars[playerIndex] = updatedVehicles
                        rprint(playerIndex, "You have successfully redeemed a "..FREE_CAR_TO_DISTRIBUTE.."!")
                    else
                        rprint(playerIndex, "You already own this vehicle!")
                    end
                else
                    rprint(playerIndex, "You must be at a dealership in order to redeem this vehicle.")
                end
            else
                rprint(playerIndex, "You did not specify a correct redemption value, OR")
                rprint(playerIndex, "That specific event is not activated.")
            end
        else
            rprint(playerIndex, "You did not specify a redemption value!")
        end
    else
        rprint(playerIndex, "There is currently no active freebe events.")
    end

    return true

end

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

function handleLoadoutCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "loadout") then return false end

    local localPlayer = ActivePlayers[playerIndex]
    
    if playerIsInArea(playerIndex, "gunstore") then
        local ownedWeapons = ActivePlayersOwnedWeapons[playerIndex]
        if tonumber(ActivePlayers[playerIndex]:getBucks()) >= LOADOUT_CHANGE_PRICE then
            if ownedWeapons[commandargs[2]] == nil  and ownedWeapons[commandargs[3]] == nil then
                rprint(playerIndex, "Loadout command was not issued correctly.")
                rprint(playerIndex, "You specified one or more weapons you do not own.")
            else
                localPlayer:deductBucks(LOADOUT_CHANGE_PRICE)
                localPlayer:setLoadoutPrimary(commandargs[2])
                localPlayer:setLoadoutSecondary(commandargs[3])
                rprint(playerIndex, "You have successfully changed your loadout for "..niceMoneyDisplay(LOADOUT_CHANGE_PRICE))
                rprint(playerIndex, "Primary: "..localPlayer:getPrimaryWeapon()..", Secondary: "..localPlayer:getSecondaryWeapon())
            end
        else
            rprint(playerIndex, "You do not have enough bucks to change your loadout.")
        end
    else
        rprint(playerIndex, "You must be at a gunstore to change your loadout.")
    end		

    return true

end

function handleObjectSpawn(PlayerIndex, MapID, ParentID, ObjectID)
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



function handleSaveCommand(playerIndex, commandName, commandArgs) 
    if not validateCommand(commandName, "save") then return false end

    writePlayerData(playerIndex)

    return true
end

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


function handleCopCommand(playerIndex, commandName, commandArgs) 
    if not validateCommand(commandName, "cop") then return false end

	local tempCopStatus = ActivePlayers[playerIndex].getCopStatus(ActivePlayers[playerIndex])
	if tempCopStatus > 0 then
		table.remove(commandargs,1)
		copCommands(playerIndex, commandargs)
	else
		rprint(playerIndex, "You must be a cop to execute a cop command!")
	end

    return true
end


function handleHireCopCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "hirecop") then return false end

    if adminLevel >= 4 or localPlayer:getProfession():getTitle() == "sheriff" then
        table.remove(commandargs,1)
        local hiredCop = tonumber(commandargs[1])
        if player_present(hiredCop) then
            if ActivePlayers[hiredCop]:setCopPosition(tonumber(commandargs[2])) then
                rprint(hiredCop, "You are now a "..COPPOSITIONS[tonumber(commandargs[2])])
                rprint(playerIndex, "You have successfully changed "..ActivePlayers[hiredCop]:getName().." to be a "..COPPOSITIONS[tonumber(commandargs[2])])
                ActivePlayers[hiredCop]:setProfession(COPPOSITIONS[tonumber(commandargs[2])])
                if ActivePlayers[hiredCop]:getCopPosition() == 0 then
                    rprint(playerIndex, "AUTHORITY LOST")
                    ActivePlayers[hiredCop]:setCopAuthority(0)
                else
                    rprint(playerIndex, "AUTHORITY GAINED")
                    ActivePlayers[hiredCop]:setCopAuthority(1)
                end
            else
                rprint(playerIndex, "You did not specify a valid cop rank.")
            end
        else
            rprint(playerIndex, "This person is not active on the server right now.")
        end
    else
        rprint(playerIndex, "You do not have permission to hire cops!")
    end
    rprint(playerIndex, "This command is WIP (You entered "..commandargs[1]..")")

    return true
end

function handleActivateEventCommand(playerIndex, commandName, commandArgs)

    if not validateCommand(commandName, "activateevent") then return false end

    if adminLevel >= 4 then
        table.remove(commandargs,1)
        local typeOfEvent = commandargs[1]
        if typeOfEvent ~= nil then
            if typeOfEvent == "gun" and gunEvent == false then
                say_all("A GUN Event has been activated.")
                say_all("Head to the gun store to redeem a free gun!")
                gunEvent = true
            elseif typeOfEvent == "car" and carEvent == false then
                say_all("A CAR Event has been activated.")
                say_all("Head to the dealership to redeem a free car!")
                carEvent = true
            elseif typeOfEvent == "money" and moneyEvent == false then
                say_all("A MONEY event has been activated.")
                say_all ("Type in /redeem money ANYWHERE to get free money!")
                moneyEvent = true
            else
                rprint(playerIndex, "You did not specify a valid event! OR")
                rprint(playerIndex, "That event has already been activated!")
            end
        else
            rprint(playerIndex, "You did not specify the type of event to activate!")
        end		
    else
        rprint(playerIndex, "You cannot activate a redemption event.")
    end

    return true

end

function handleWalletCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "wallet") then return false end

    local localPlayer = ActivePlayers[playerIndex]
    local aTable = ActivePlayers[playerIndex]
    rprint(playerIndex, "Wallet: "..niceMoneyDisplay(localPlayer:getBucks()))

    return true
end

function CommandHandler (playerIndex,Command,Environment,Password)
	if player_present(playerIndex) then
		Command = string.lower(Command)
		
		local commandargs = splitString(Command)
		local commandArgs = splitString(Command)
		local commandName = table.remove(commandArgs, 1)

		if handleDriveCommand(playerIndex, commandName, commandArgs) then return false end
		if handleParkCommand(playerIndex, commandName, commandArgs) then return false end
		if handlePayCommand(playerIndex, commandName, commandArgs) then return false end
		if handleSaveCommand(playerIndex, commandName, commandArgs) then return false end
		if handleBuyCommand(playerIndex, commandName, commandArgs) then return false end
		if handleCopCommand(playerIndex, commandName, commandArgs) then return false end 
		if handleHireCopCommand(playerIndex, commandName, commandArgs) then return false end
		if handleShowIDCommand(playerIndex, commandName, commandArgs) then return false end
		if handleDropCommand(playerIndex, commandName, commandArgs) then return false end
		if handleRedeemCommand(playerIndex, commandName, commandArgs) then return false end
		if handleActivateEventCommand(playerIndex, commandName, commandArgs) then return false end
		if handleCheckCommand(playerIndex, commandName, commandArgs) then return false end
		if handleWalletCommand(playerIndex, commandName, commandArgs) then return false end 
		if handleLoadoutCommand(playerIndex, commandName, commandArgs) then return false end
		if handleOwnedCommand(playerIndex, commandName, commandArgs) then return false end
		if handleTestCommand(playerIndex, commandName, commandArgs) then return false end
	end
	return true
end



function handleShowIDCommand(playerIndex, commandName, commandArgs)
    if not validateCommand(commandName, "showid") then return false end

    ShowIDFunction(playerIndex)
    
    return true

end


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
	local emptyPlayer = Player:new()
	local emptyVehicleTable = {}
	ActivePlayers[PlayerIndex] = emptyPlayer
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

