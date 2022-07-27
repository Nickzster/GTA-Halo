-- BEGIN_IMPORT
-- import shared.config end
-- END_IMPORT

Inventory = {
	name = "", --string value representing players name
	hash = "", --string value representing players hash
	bucks = 5000, --int value representing players money
	profession = "civilian", --string value representing player's profession
	karma = 1.0, --int value representing player's karma value
    apartment = 0, --bool value (0 or 1) representing if a player has an apartment
	copPosition = 0, --0 = not a cop, 1 = officer, 2 = deputy, 3 = sheriff
	copAuthority = 0, --bool value (0 or 1) representing if a player has authority or not.
    fugitiveStatus = 0, --bool value (0 or 1) representing if a player is made or not
    loadoutPrimary = "empty", --string value representing primary weapon
    loadoutSecondary = "empty", --string value representing secondary weapon
    jailStatus = 0, --bool value (0 or 1) value representing if a player is in jail or not
}
--Class methods
--name getters + setters
function Inventory:setName(strname)
	self.name = strname
end
function Inventory:getName()
	return self.name
end
--hash getters + setters
function Inventory:setHash(strhash)
	self.hash = strhash
end
function Inventory:getHash()
	return self.hash
end
--bucks setters + getters
function Inventory:setBucks(bucks)
	if tonumber(bucks) > MAX_MONEY then
		self.bucks = MAX_MONEY
	else
		self.bucks = bucks
	end
end
function Inventory:getBucks(bucks)
	return self.bucks
end
function Inventory:payBucks(bucks) --adds ONTO the amount of bucks a player has
	local tempBalance = self.bucks + bucks
	if tempBalance > MAX_MONEY then
		self.bucks = MAX_MONEY
	else
		self.bucks = tempBalance
	end
end
function Inventory:deductBucks(bucks) --deducts cash out of player's inventory. this value cannot dip below 0.
	local tempBalance = self.bucks - bucks
	if tempBalance < 0 then --if the amount of cash deducted would be below zero
		self.bucks = 0 --then set their amount of cash to 0
	else
		self.bucks = self.bucks - bucks --otherwise do the deduction.
	end
end
--profession setters and getters

function Inventory:setProfession(professionToBe)
	self.profession = professionToBe 
end


function Inventory:getProfession()
    return self.profession
end
--karma setters and getters
function Inventory:setKarma(newKarmaValue)
	newKarmaValue = tonumber(newKarmaValue)
	if newKarmaValue > MAX_KARMA then
		self.karma = MAX_KARMA
	else
		self.karma = newKarmaValue
	end
end
function Inventory:getKarma()
	return self.karma
end
function Inventory:incrementKarma()
	local incrementedKarmaValue = self.karma + 1
	if incrementedKarmaValue > MAX_KARMA then
		self.karma = MAX_KARMA
	else
		self.karma = incrementedKarmaValue
	end
end
--cop getters and setters
function Inventory:setCopPosition(newCopPositionNumber)
	local newCopPosition = COPPOSITIONS[newCopPositionNumber]
	if newCopPosition ~= nil then
		self.copPosition = newCopPositionNumber
		return true
	else
		self.copPosition = 0
		return false
	end
end
function Inventory:getCopPosition()
	return self.copPosition
end
--authority setters and getters
function Inventory:setCopAuthority(newAuthorityValue)
	self.copAuthority = newAuthorityValue
end
function Inventory:getCopAuthority()
	return self.copAuthority
end
--apartment status getters + setters
function Inventory:setApartment(apartmentStatus)
	self.apartment = apartmentStatus
end
function Inventory:getApartment()
	return self.apartment
end
function Inventory:getCopRank()
	return self.copRank
end
--fugitive status setters + getters
function Inventory:setFugitiveStatus(fugitiveStatusToBe)
    self.fugitiveStatus = fugitiveStatusToBe
end
function Inventory:getFugitiveStatus()
    return self.fugitiveStatus
end
--set loadouts
function Inventory:setLoadoutPrimary(primaryWeapon) 
    self.loadoutPrimary = primaryWeapon
end
function Inventory:setLoadoutSecondary(secondaryWeapon) --used for io
	self.loadoutSecondary = secondaryWeapon
end
function Inventory:setLoadout(primaryWeapon, secondaryWeapon)
	self.loadoutPrimary = primaryWeapon
    self.loadoutSecondary = secondaryWeapon
end
--get loadouts
function Inventory:getPrimaryWeapon()
    return self.loadoutPrimary
end
function Inventory:getSecondaryWeapon()
    return self.loadoutSecondary
end
function Inventory:setJailStatus(jailStatusToBe)
	self.jailStatus = jailStatusToBe
end
function Inventory:getJailStatus()
	return self.jailStatus
end

function Inventory:new(o)
	o = o or {} --if o is not specified, it will make the object a table, therefore not able to access Inventory's functions.
	setmetatable(o,self)
	self.__index = self
	return o
end