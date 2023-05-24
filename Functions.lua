--[[ 
    You have to import it in every file like this:
        local functions = require("Functions")
]]

local love = require("love")

functions = {
    Color = function (value1, value2, value3)
        return value1 / 255, value2 / 255, value3 / 255
        --[[If you are used to the standered (0-255, 0-255, 0-255) RGB, then this will convert it to (0-1, 0-1, 0-1). You will use it like:
                love.graphics.setBackgroundColor(functions.Color(0, 0, 0))
            ]]
    end,
    
    Print = function (text, x, y)
        love.graphics.print(text, x, y)
        return 1
        --[[This function is a shorter way of printing to the screen. You will use it like this:
            functions.Print("Hello World", 500, 500)
        ]]
    end
}

return functions
