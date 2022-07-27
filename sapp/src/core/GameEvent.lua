-- NO_IMPORTS

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