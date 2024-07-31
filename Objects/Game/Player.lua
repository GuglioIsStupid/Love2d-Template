---@class Player
local Player = Class:extend()

---@param x number
---@param y number
function Player:new(x --[[700]], y --[[250]])
    self.x, self.y = x or 700, y or 250
end

function Player:update(dt)
    self.x = 640 + math.cos(love.timer.getTime()) * 100
    self.y = 360 + math.sin(love.timer.getTime()) * 100
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, 25, 25)
end

function Player:release()
    -- Clean up garbage here, after calling Player:release(), you should be able to simply nil the value
    -- Alternatively, you can just nil it, as lua will eventually clean up the garbage automatically
end

return Player
