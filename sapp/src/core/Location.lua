-- BEGIN_IMPORT
-- import helpers.new end
-- END_IMPORT

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