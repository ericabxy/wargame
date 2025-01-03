--- large space combat vehicle
-- @classmod ship
local circle_sprite = require('src.game.circle_sprite')

local ship = {}

-- class table
local Ship = circle_sprite.new{
  hull = 100,
  thrust = 4
}

function Ship:paint(x, y)
  love.graphics.print(self.hull, self.x + x, self.y + y)
end

function ship.new(o)
  local self = o or {}
  setmetatable(self, { __index = Ship })
  return self
end

return ship
