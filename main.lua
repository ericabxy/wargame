local person = require('src.wargame.person')
local ship = require('src.wargame.ship')
local wargame = require('src.wargame')

love.graphics.setDefaultFilter('nearest', 'nearest')
texture0 = love.graphics.newImage('share/battleship_00.png')
texture1 = love.graphics.newImage('share/Grid3.png')
texture2 = love.graphics.newImage('share/paperdoll_00.png')
local game = wargame.new{texture0 = texture0}
global_x = 0
global_y = 0

function love.load()
  game:setup()
end

function love.update(dt)
  if love.keyboard.isDown('d') and global_x < 256 then
    global_x = global_x + dt * 100
  elseif love.keyboard.isDown('a') and global_x > 0 then
    global_x = global_x - dt * 100
  end
  if love.keyboard.isDown('s') and global_y < 256 then
    global_y = global_y + dt * 100
  elseif love.keyboard.isDown('w') and global_y > 0 then
    global_y = global_y - dt * 100
  end
end

function love.draw()
  love.graphics.scale(2.5, 2.5)
  love.graphics.draw(texture1, -global_x, -global_y)
  game:draw(-global_x, -global_y)
end

function love.mousepressed()
  game:mouse_down()
end
