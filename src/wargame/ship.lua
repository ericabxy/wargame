--- large space combat vehicle
-- @classmod wargame.ship
local charmap = require('src.game.charmap')
local circle_sprite = require('src.game.circle_sprite')
local color = require('src.game.color')

local ship = {}

-- class table
local Ship = circle_sprite.new{
  class = '',
  hull_points = 11,
  hull_remain = 11,
  mass = 22,
  role = 'light cruiser',
  screens = 1,
  threshholds = 3,
  thrust = 6
}

function Ship:draw_outline(texture, x, y)
  x, y = x and self.x + x or self.x, y and self.y + y or self.y
  love.graphics.setColor(color.cyan)
  love.graphics.draw(texture, self.quad, x + self.ox, y + self.oy)
end

function Ship:take_damage(damage)
  if self.hull_remain > 0 then
    self.hull_remain = self.hull_remain - math.min(damage, self.hull_remain)
  end
end

function ship.new(o)
  local self = o or {}
  setmetatable(self, { __index = Ship })
  return self
end

return ship
