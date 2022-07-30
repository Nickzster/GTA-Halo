-- BEGIN_IMPORT
-- import helpers.new end
-- END_IMPORT

Weapon = {
    label="",
    key="",
    price="",
    tagReference=""
}

function Weapon:setLabel(newLabel)
    self.label = newLabel
    return self
end

function Weapon:getLabel()
    return self.label
end

function Weapon:setKey(newKey)
    self.key = newKey
    return self
end

function Weapon:getKey()
    return self.key
end

function Weapon:setPrice(newPrice)
    self.price = newPrice
    return self
end

function Weapon:getPrice()
    return self.price
end

function Weapon:setTagReference(newTagReference)
    self.tagReference = newTagReference
    return self
end

function Weapon:getTagReference()
    return self.tagReference
end

Weapon['new'] = new