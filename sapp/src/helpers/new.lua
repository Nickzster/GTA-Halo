-- NO_IMPORTS

new = function(self, o)
    local newClassInstance = o or {}
    setmetatable(newClassInstance, self)
    self.__index = self
    return newClassInstance
end