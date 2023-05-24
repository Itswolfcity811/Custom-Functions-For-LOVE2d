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
    end,
    
    Data = {
        Write = function (name, data, size)
            success, message = love.filesystem.write( name, data, size )
            if success then
                return
            else
                love.errorhandler(message)
                return
            end
        end, --[[This function writes to file, I'm not to sure how it works though. I think this is how you use it:
            functions.Data.Write(name, data, size) -- I don't know how it works
        ]]
        
        NewFile = function (NameOfFile) 
            return file = love.filesystem.newFile(NameOfFile)
        end, --[[This function makes a new file. This is how I think you use it:
            functions.Data.NewFile(NameOfFile) -- But you should probaly do it like this:
            local Files = {}
        
            functions.Data.NewFile(NameOfFile)
        
            table.append(Files, file)
        ]]
    },
    
    Graphics = {},
    
    Mouse = {
        Position function ()
            return x = love.mouse.getX, y = love.mouse.getY
        end --[[Use this as a simpler way of getting the mouse x and y. You will use it like:
            MouseX, MouseY = functions.mouse.Position()
        ]]
    },
    
    Window = {
        Quit = function (Confermation)
           if not Congermation then
                love.event.quit()
           else
                --Not Fineshed
           end
        end --[[This is how you can quit the game. Use "Confermation" as a boolean value. If you put false it will just close the window, if you put true it will ask the user for a promt input and if they say yes then it closes and if not nothing happens. You will use it like this:
            functions.Window.Quit(True) -- You could put false though
        ]]
    }
}

return functions
