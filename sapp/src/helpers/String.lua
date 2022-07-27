-- NO_IMPORTS

function splitString (inputstr, sep)
        local t={}
        if sep == nil then
            for str in inputstr:gmatch("%w+") do 
                table.insert(t, str)
            end
        else
            for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
            end
        end
        return t
end