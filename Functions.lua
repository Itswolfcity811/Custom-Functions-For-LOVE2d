--[[ 
    You have to import it in every file like this:
        local functions = require("Functions")
]]

functions = {
    Color = function (value1, value2, value3)
        return value1 / 255, value2 / 255, value3 / 255
        --[[If you are used to the standered (0-255, 0-255, 0-255) RGB, then this will convert it to (0-1, 0-1, 0-1). You have to import it in every file like this:
                local functions = require("Functions")
            You will use it like:
                love.graphics.setBackgroundColor(functions:Color(0, 0, 0))
            ]]
    end
}

return functions
