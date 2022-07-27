-- BEGIN_IMPORT
-- import helpers.new end
-- END_IMPORT

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