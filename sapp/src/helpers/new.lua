-- NO_IMPORTS

function new(self, o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return self
end