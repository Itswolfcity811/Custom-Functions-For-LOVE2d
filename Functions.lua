--[[ 
    You have to import it in every file like this:
        local functions = require("Functions")
]]

local love = require("love")

functions = {
    Color = function (value1, value2, value3)
        return value1 / 255, value2 / 255, value3 / 255
        --[[If you are used to the standered (0-255, 0-255, 0-255) RGB, then this will convert it to (0-1, 0-1, 0-1). You will use it like:
                love.graphics.setBackgroundColor(functions:Color(0, 0, 0))
            ]]
    end,
    
    Print = function (text, x, y)
        love.graphics.print(text, x, y)
        return 1
        --[[This function is a shorter way of printing to the screen. You will use it like this:
            functions:Print("Hello World", 500, 500)
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
        end, --[[This function writes to file, I'm not to sure how it works though.NOTE:THIS WILL OVERRIDE YOUR FILE. I think this is how you use it:
            functions.Data:Write(name, data, size) -- I don't know how it works
        ]]
        
        NewFile = function (NameOfFile) 
            local file = love.filesystem.newFile(NameOfFile)
            return file
        end, --[[This function makes a new file. This is how I think you use it:
            functions.Data:NewFile(NameOfFile) -- But you should probaly do it like this:
            local Files = {}
        
            functions.Data.NewFile(NameOfFile)
        
            table.append(Files, file)
        ]]
        
        LoadFile = function (NameOfFile, size1)
            local size = nil or size1
            local contents, size = love.filesystem.read( name, size )
            return contents, size
        end, --[[This loads the contant of the file. You don't have to put anything for the second peramater. You will use it like:
            Contents, Size = functions.Data:LoadFile(FileName, nil)
        ]]
        
        CreateAndWrite = function(self, NameOfFile, data, size)
            local file = NewFile(NameOfFile)
            Write(file, data, size)
            return file
        end
    },
    
    Graphics = {},
    
    Mouse = {
        Position = function ()
            local x = love.mouse.getX
            local y = love.mouse.getY
            return x, y
        end --[[Use this as a simpler way of getting the mouse x and y. You will use it like:
            MouseX, MouseY = functions.mouse:Position()
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
            functions.Window:Quit(True) -- You could put false though
        ]]
    },
    
    --The following is 3rd party aplecations
    --I put them in a pcall function so they don't throw and error incase they aren't installed
    pcall(function()
        Enet = {
            Server = {

            },

            Client = {
                Disconect = function(data)
                    if data ~= nil then
                        peer:disconect(data)
                    else
                        peer:disconect()      
                    end
                end, --[[Asks for a disconect from the host. You will use it like:
                        function.Enet.Client:Disconect(OpitionalData)
                ]]
                ForceDisconect = function(data)
                    if data ~= nil then
                        peer:disconnect_now(data)
                    else
                        peer:disconnect_now()
                    end
                end, --[[This Disconects the client from the host. I don't suggest using this if you have a saveing mechanic or anything like that. You will use it like this:
                        function.Enet.Client:ForceDisconectDisconect(OpitionalData)
                ]]
                
                LaterDisconect = function(data)
                    if data ~= nil then
                        peer:disconnect_later(data)
                    else
                        peer:disconnect_later()
                    end
                end, --[[This requests a disconect but after all data is transfered. You will use it like:
                        function.Enet.Client:LaterDisconect(OpitionalData) 
                        --I really suggest to do this:
                        function.Enet.Client:LaterDisconect(OpitionalData)
                        
                        function.Enet.Client:ForceDisconectDisconect(OpitionalData)
                ]]
            }

            
        }
    end),
}

return functions
