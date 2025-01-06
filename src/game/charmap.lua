--- a short description
-- @classmod game.charmap
local color = require('src.game.color')

local charmap = {}

-- class table
local Charmap = {
  x = 0,
  y = 0,
  map =
    '91111111111111113'..
    '80000000000000002'..
    '80000000000000002'..
    'C4444444444444446',
  charwidth = 8,
  font = 'Font',
  width = 16,
}

function Charmap:draw()
  love.graphics.setColor(color.white)
  love.graphics.setFont(self.font)
  love.graphics.printf(self.map, self.x, self.y, self.width * self.charwidth)
end

function charmap.new(o)
  local self = o or {}
  setmetatable(self, { __index = Charmap })
  return self
end

return charmap
