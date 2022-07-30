-- BEGIN_IMPORT
-- import helpers.new end
-- END_IMPORT

Event = {
    timeRemaining=0,
    callback=nil,

}

function Event:execute()
    local isExpired = self.timeRemaining == 0
    if isExpired then
        self.callback()
        return true
    end

    self.timeRemaining = self.timeRemaining - 1

    return false
end

function Event:setTime(time)
    self.timeRemaining = time
    return self
end

function Event:setCallback(callback)
    self.callback = callback
    return self
end

Event['new'] = new