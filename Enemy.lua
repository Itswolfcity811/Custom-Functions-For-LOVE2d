local love = _G.love

local functions = require("Functions")

function Enemy(level)
    local dice = math.random(1, 4)
    local _x, _y
    local _radius = 20
    side = nil

    if dice == 1 then
        _x = math.random(_radius + 40, love.graphics.getWidth() + 40)

        _y = -_radius * 4

        side = "top"
        -- love.window.showMessageBox("Message", side)
    elseif dice == 2 then
        _x = -_radius * 4

        _y = math.random(_radius, love.graphics.getHeight())

        side = "left"
        -- love.window.showMessageBox("Message", side)
    elseif dice == 3 then
        _x = math.random(_radius, love.graphics.getWidth())

        _y = love.graphics.getHeight() + (_radius * 4)

        side = "bottom"
        -- love.window.showMessageBox("Message", side)
    else
        _x = love.graphics.getWidth() + (_radius * 4)

        _y = math.random(_radius, love.graphics.getHeight())

        side = "right"
        -- love.window.showMessageBox("Message", side)
    end

    red = 0
    green = 250
    blue = 0

    print(level)
    
    return {
        side = side,
        
        level = level or 1,
        radius = _radius,
        x = _x,
        y = _y,
        
        red = red,
        green = green,
        blue = blue,

        CheckTouched = function(self, player_x, player_y, _cursor_radius)
            local cursor_radius = _cursor_radius or 1
            
            -- love.window.showMessageBox("Message", type())
            return math.sqrt((self.x - player_x) ^ 2 + (self.y - player_y) ^ 2) <= cursor_radius * 2
        end,

        Move = function (self, player_x, player_y)
            if player_x - self.x > 0 then
                self.x = self.x + self.level
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level
            end

            if player_y - self.y > 0 then
                self.y = self.y + self.level
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level
            end
        end,

        Draw = function (self)

            love.graphics.setColor(functions.Color(self.red, self.green, self.blue))

            love.graphics.circle("fill", self.x, self.y, self.radius)

            love.graphics.setColor(1, 1, 1)
        end    
    }
end

return Enemy