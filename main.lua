Project = require("Project")

-- converts a position to the game screen
---@param x number
---@param y number
---@return number, number
function ToGameScreen(x, y)
    local ratio = 1
    ratio = math.min(Project.WindowWidth/Project.GameWidth, Project.WindowHeight/Project.GameHeight)

    x, y = (x or 0) - Project.WindowWidth/2, (y or 0) - Project.WindowHeight/2

    x, y = x / ratio, y / ratio
    x, y = x + Project.GameWidth/2, y + Project.GameHeight/2

    return x, y
end

function love.load()
    -- Setup Libraries
    Input = (require("Libraries.Baton")).new({
        controls = {
            GameLeft  =  { "key:a" },
            GameDown  =  { "key:s" },
            GameUp    =  { "key:w" },
            GameRight =  { "key:d" },
            GameDash  =  { "key:space" }
        }
    })
    Class = require("Libraries.Class")
    State = require("Libraries.State")

    Project.GameScreen = love.graphics.newCanvas(Project.GameWidth, Project.GameHeight)

    -- Initialize Game
    States = require("Modules.States")
    Shaders = require("Modules.Shaders")
    Objects = require("Modules.Objects")
    require("Modules.Debug")

    State.switch(States.TestState)
end

function love.update(dt)
    Input:update()
    State.update(dt)
end

function love.draw()
    love.graphics.push()
        love.graphics.setCanvas(Project.GameScreen)
            love.graphics.clear(0,0,0,1)
            State.draw()
        love.graphics.setCanvas()
    love.graphics.pop()

    -- ratio
    local ratio = 1
    ratio = math.min(Project.WindowWidth/Project.GameWidth, Project.WindowHeight/Project.GameHeight)
    love.graphics.setColor(1,1,1,1)
    -- draw game screen with the calculated ratio and center it on the screen
    love.graphics.setShader(Shaders.CurrentShader)
    love.graphics.draw(Project.GameScreen, Project.WindowWidth/2, Project.WindowHeight/2, 0, ratio, ratio, Project.GameWidth/2, Project.GameHeight/2)
    love.graphics.setShader()

    debug.printInfo()
end

function love.resize(w, h)
    Project.WindowWidth = w
    Project.WindowHeight = h
end

function love.quit()

end