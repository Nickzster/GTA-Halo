-- BEGIN_IMPORT
-- import helpers.new end
-- END_IMPORT

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