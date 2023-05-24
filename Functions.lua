--[[ 
    You have to import it in every file like this:
        local functions = require("Functions")
]]

local love = require("love")

functions = {
    function Color(value1, value2, value3)
        return value1 / 255, value2 / 255, value3 / 255
        --[[If you are used to the standered (0-255, 0-255, 0-255) RGB, then this will convert it to (0-1, 0-1, 0-1). You will use it like:
                love.graphics.setBackgroundColor(functions:Color(0, 0, 0))
            ]]
    end,
    
    function Print(text, x, y)
        love.graphics.print(text, x, y)
        return 1
        --[[This function is a shorter way of printing to the screen. You will use it like this:
            functions:Print("Hello World", 500, 500)
        ]]
    end
    
    Data = {
        function Write(name, data, size)
            success, message = love.filesystem.write( name, data, size )
            if success then
                return
            else
                love.errorhandler(message)
                return
            end
        end --[[This function writes to file, I'm not to sure how it works though. I think this is how you use it:
            functions.Data:Write(name, data, size) -- I don't know how it works
        ]]
        
        function NewFile(NameOfFile) 
            return file = love.filesystem.newFile(NameOfFile)
        end --[[This function makes a new file. This is how I think you use it:
            functions.Data:NewFile(NameOfFile) -- But you should probaly do it like this:
            local Files = {}
        
            functions.Data:NewFile(NameOfFile)
        
            table.append(Files, file)
        ]]
    }
}

return functions
