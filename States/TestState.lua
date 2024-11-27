local TestState = State()

local player

function TestState:enter()
    player = Player()
end

function TestState:update(dt)
    player:update(dt)
end

function TestState:draw()
    player:draw()
end

return TestState
