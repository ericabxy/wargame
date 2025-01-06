local wargame = require('src.wargame')

local MEASUREMENT_UNIT = 12.50
local scale = 1.00
local view_width, view_height = 320, 240
if not lutro then
love.graphics.setDefaultFilter('nearest', 'nearest')
end
texture0 = love.graphics.newImage('share/battleship_00.png')
texture1 = love.graphics.newImage('share/Grid3.png')
texture2 = love.graphics.newImage('share/paperdoll_00.png')
texture3 = love.graphics.newImage('share/battleship_01.png')
font0 = love.graphics.newImageFont(
  'share/display_symbols_small.png',
  'ox0123456789ABCDEF',
  0
)
local glyphs = ''
for x = 32, 127 do
  print(string.char(x))
  glyphs = glyphs .. string.char(x)
end
font1 = love.graphics.newImageFont(
  'share/8x8_ImageFont.png',
  glyphs,
  0
)
font2 = love.graphics.newImageFont(
  'share/dialog_box_00.png',
  '0123456789ABCDEF',
  0
)
local game = wargame.new{
  width = texture1:getWidth(),
  height = texture1:getHeight(),
  texture0 = texture0,
  texture1 = texture3,
  font0 = font0, font1 = font1, font2 = font2
}
global_x = 0
global_y = 0

function love.load()
  game:setup(view_width, view_height)
end

function love.update(dt)
end

function love.draw()
  if not lutro then love.graphics.scale(scale, scale) end
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(texture1, -global_x, -global_y)
  game:draw(-global_x, -global_y)
end

function love.mousepressed(x, y, button)
  if button <= 3 then
    x = (x + global_x) / scale
    y = (y + global_y) / scale
    game:mouse_down(x, y, button)
  end
end

function love.wheelmoved(x, y)
  if x > 0 then
    global_x = math.min(global_x + x * 2.50, 576)
  elseif x < 0 then
    global_x = math.max(global_x + x * 2.50, 0)
  end
  if y < 0 then
    global_y = math.min(global_y - y * 2.50, 400)
  elseif y > 0 then
    global_y = math.max(global_y - y * 2.50, 0)
  end
end
