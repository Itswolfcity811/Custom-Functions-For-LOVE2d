--[[ Make sure you you do the following in the love.load function inside of the Main.lua file 
   require("Functions")
]]
function Color(value1, value2, value3)
    return value1 / 255, value2 / 255, value3 / 255
end --If you are used to the standered (0-255, 0-255, 0-255) RGB, then this will convert it to (0-1, 0-1, 0-1)
