local game = {}
local love = require "love"


local function placeallpieces(locations, radius)
    for _, spot in pairs(locations) do
        print(spot[1] .. " " .. spot[2])
        love.graphics.setColor(1, 0, 0)
        love.graphics.circle("fill", spot[1], spot[2], radius)
    end
end

local function drawlines(width, height)
    -- Get dimensions of things to draw
    local linewidthx = width * 0.01
    local linewidthy = height * 0.01
    local spotwidth = width / 3
    local spotheight = height / 3
    --Calculate gameboard lines
    local lines = {
        -- The lines are actually rectangles
        -- so x, y, w, h are required
        --Vertical width=linewidthx height= height
        -- First vertical line
        { spotwidth - (linewidthx / 2),           0,                                        linewidthx, height },
        -- Second vertical line: only x is different
        { (width - spotwidth) - (linewidthx / 2), 0,                                        linewidthx, height },
        -- Horizontal width = width height = linewidthy
        -- First horizontal line
        { 0,                                      spotheight - (linewidthy / 2),            width,      linewidthy },
        -- Second horizontal line only y is different
        { 0,                                      (height - spotheight) - (linewidthy / 2), width,      linewidthy },
    }
    for _, l in ipairs(lines) do
        local x, y, w, h = unpack(l)
        love.graphics.rectangle("fill", x, y, w, h)
    end
end

local function getcenterpoints(width, height)
    local spotheight = height / 3
    local spotwidth = width / 3
    local results = {}
    local xvalues = {}
    for i = 1, 3 do
        table.insert(xvalues, i * spotwidth - (spotwidth / 2))
    end
    local yvalues = {}
    for i = 1, 3 do
        table.insert(yvalues, i * spotheight - (spotheight / 2))
    end
    for i = 1, 9 do
        if i < 4 then
            table.insert(results, { xvalues[i], yvalues[1] })
        elseif i < 7 then
            table.insert(results, { xvalues[i - 3], yvalues[2] })
        elseif i < 10 then
            table.insert(results, { xvalues[i - 6], yvalues[3] })
        end
    end

    return results
end

game.cpucolor = function()
    love.graphics.setColor(0, 1, 0)
end
game.playercolor = function()
    love.graphics.setColor(1, 0, 0)
end
game.menucolor = function()
    love.graphics.setColor(1, 1, 1)
end

game.draw = function(width, height, owners)
    drawlines(width, height)
    print("BEGIN DRAWING")
    local positions = getcenterpoints(width, height)
    for k, v in pairs(owners) do
        print(string.format("k:: %d v:: %s", k, v))
        if v == "player" then print ("v is player") end
        if v ~= "player" or v ~= "cpu" then
            love.graphics.printf(
                v,
                love.graphics.getFont(),
                positions[k][1],
                positions[k][2],
                width / 3,
                "center",
                0, 1, 1,
                (width / 3 / 2),
                love.graphics.getFont():getHeight(v) / 2
            )
        end
        if v == "player" then
            game.playercolor()
        else
            game.cpucolor()
        end
        love.graphics.circle("fill", positions[k][1], positions[k][2], width / 6 * 0.85)
    end
    -- placeallpieces(getcenterpoints(width, height), width/6*0.85)
end


return game
