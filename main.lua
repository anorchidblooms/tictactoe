--[[
    Your love2d game start here
]]
local love = require "love"

local mainmenu  = require "mainmenu"
local gameboard = require "gameboard"
local owners = {}

local state = "menu"
love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
    -- init something here ...
    love.window.setTitle('Hello love2d!')
    love.window.setMode(600,600)

    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    -- ...
end

function love.mousereleased(x, y, button)
    if state=="menu" and button==1 then state="game" end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    -- change some values based on your actions

    love.keyboard.keysPressed = {}
end

function love.draw()
    local _, _, winw, winh = love.window.getSafeArea()
    if state=="menu" then
        mainmenu.draw(winw, winh)
    end
    if state=="game" then
        gameboard.draw(winw, winh, owners)
    end

end

