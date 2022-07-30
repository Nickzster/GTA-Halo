-- BEGIN_IMPORT
-- import shared.config end
-- END_IMPORT

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