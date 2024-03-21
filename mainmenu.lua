local m = {}
local love = require "love"
m.draw = function (width, height)
    love.graphics.setBackgroundColor(0,0,0)
    local title = "TIC TAC TOE"
    local font = love.graphics.setNewFont(height*(0.15))
    local fontwidth = font:getWidth(title)
    love.graphics.setColor(1,1,1)
    love.graphics.print(title, (width/2)-(fontwidth/2), height/2-height*0.15/2)

end

return m
