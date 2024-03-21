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

local function cpucolor()
    love.graphics.setColor(0, 1, 0)
end
local function playercolor()
    love.graphics.setColor(1, 0, 0)
end
local function menucolor()
    love.graphics.setColor(1, 1, 1)
end

game.draw = function(width, height, owners)
    drawlines(width, height)
    print("BEGIN DRAWING")
    local positions = getcenterpoints(width, height)
    for v in pairs(owners) do
    end
end

return game
